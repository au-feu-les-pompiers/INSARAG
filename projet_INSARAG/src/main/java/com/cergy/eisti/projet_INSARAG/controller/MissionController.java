package com.cergy.eisti.projet_INSARAG.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cergy.eisti.projet_INSARAG.model.Mission;
import com.cergy.eisti.projet_INSARAG.model.Utilisateur;
import com.cergy.eisti.projet_INSARAG.service.MissionService;
import com.cergy.eisti.projet_INSARAG.service.UtilisateurService;

 
@Controller("missionController")
public class MissionController {
	
	private final Logger logger = LoggerFactory.getLogger(MissionController.class);

 
	@Autowired
	MissionService missionService;
	@Autowired
	UtilisateurService utilisateurService;
 

@RequestMapping(value = "/mission/listAll", method = RequestMethod.GET)
	protected ModelAndView showAllMissions(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
        if (session.getAttribute("connected") == "connected") {
        	List<Mission> listeMissions = missionService.getAll();
        	return new ModelAndView("/mission/showAllMissions", "missions", listeMissions);
        }
        return new ModelAndView("redirect:/"); 
	}

	 	@RequestMapping(value = "/mission/list", method = RequestMethod.GET)
	    public String list(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
	 		HttpSession session = request.getSession();
	        if (session.getAttribute("connected") == "connected") {
	        	model.addAttribute("missions", missionService.getAll());
	        	return "/mission/showAllMissions"; // Afficher la page showAllMissions.jsp qui se trouve sous /mission
	        }
	        return "redirect:/";
	    }

	    @RequestMapping(value = "/mission/get/{id}" , method = RequestMethod.GET)
	    public String get(@PathVariable Long id, Model model,HttpServletRequest request, HttpServletResponse response) throws Exception {
	 		HttpSession session = request.getSession();
	        if (session.getAttribute("connected") == "connected") {
	        	Long idUtilisateur = (Long) session.getAttribute("id");

	        	model.addAttribute("missionToShow", missionService.getByIdMission(id));
	        	model.addAttribute("utilisateurForm", utilisateurService.getByIdUtilisateur(idUtilisateur));
	        	return "/mission/showMission"; // Afficher la page showMission.jsp qui se trouve sous /mission
	        }
	        return "redirect:/";
	    }
	    
	    @RequestMapping(value = "/mission/accept", method = RequestMethod.POST)
		public String acceptMission(Model model, HttpServletRequest request, HttpServletResponse response,final RedirectAttributes redirectAttributes) throws Exception {
	 		HttpSession session = request.getSession();
	        if (session.getAttribute("connected") == "connected") {
		    	Long idUtilisateur = (Long) session.getAttribute("id");
	    		Utilisateur utilisateur=utilisateurService.getByIdUtilisateur(idUtilisateur);
	
		    	if(utilisateur.getId()!=null) {
		    		if(request.getParameter("Accepter")!= null) {
			    		utilisateur.setEnMission(1);
			    		utilisateurService.save(utilisateur);
		    		}
		    		if(request.getParameter("Refuser")!= null) {
			    		utilisateur.setEnMission(2);
			    		utilisateurService.save(utilisateur);
		    		}
		    	}
		    	return "redirect:/mission/listAll";
	        }
	        return "redirect:/";	        
	    }
	    
	    
	    @RequestMapping(value = "/mission/save", method = RequestMethod.POST)
	    public String saveOrUpdate(@ModelAttribute("missionForm") Mission mission, Model model,
	    		final RedirectAttributes redirectAttributes, HttpServletRequest request) throws Exception {
	 		HttpSession session = request.getSession();
	        if (session.getAttribute("connected") != "connected") {
		        return "redirect:/";	        
	        }
    		try {
				
			
			Long idMission = missionService.save(mission);
		
			
			if(  mission.getIdMission()!=null){
				redirectAttributes.addFlashAttribute("typeAlert", "info");
		    	redirectAttributes.addFlashAttribute("msgAlert", "Mission dont ID : "+mission.getIdMission()+" a été mis à jour.");
		
			}else{
				redirectAttributes.addFlashAttribute("typeAlert", "success");
		    	redirectAttributes.addFlashAttribute("msgAlert", "Nouveau Mission a été enregsitrée avec ID : "+idMission);
			}
			
			} catch (Exception e) {
				e.printStackTrace();
			}
		    return "redirect:/mission/listAll";
	    }
	    

 
	    @RequestMapping("/mission/update/{id}")
	    public String update(@PathVariable Long id, Model model, 
	    		final RedirectAttributes redirectAttributes, HttpServletRequest request) throws Exception {
	 		HttpSession session = request.getSession();
	        if (session.getAttribute("connected") != "connected") {
		        return "redirect:/";	        
	        }
	    	Mission mission = missionService.getByIdMission(id);
	        model.addAttribute("missionForm", mission);
	        return "/mission/addUpdateMission";
	    }
	    
}
