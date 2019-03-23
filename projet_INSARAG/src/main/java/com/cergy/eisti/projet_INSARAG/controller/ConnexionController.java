package com.cergy.eisti.projet_INSARAG.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cergy.eisti.projet_INSARAG.service.ConnexionService;
import com.cergy.eisti.projet_INSARAG.service.MissionService;
import com.cergy.eisti.projet_INSARAG.service.UtilisateurService;

@Controller 
@RequestMapping("/") //make all URL's through this controller relative to /index
public class ConnexionController {
	
	@Autowired
	ConnexionService connexionService;
	
	@Autowired
	MissionService missionService;
	
	@Autowired
	UtilisateurService utilisateurService;
	
	@RequestMapping(value="/", method= RequestMethod.GET)
	public String getFormAdmission(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.invalidate();
		return "Connexion";
	} 
	
	@RequestMapping(value="/submitConnexion", method = RequestMethod.POST)
	public String submitFormAdmission (HttpServletRequest request, HttpServletResponse response)  throws Exception{
		String login = request.getParameter("user_identifiant");
		String mdp = request.getParameter("user_mdp");
		
		boolean isRegistered = connexionService.isRegistered(login, mdp);
		if (isRegistered) {
			HttpSession session = request.getSession();
			Long id = connexionService.getPompier(login, mdp);
			session.setAttribute("accreditation", connexionService.accreditationLvl());
			session.setAttribute("connected", "connected");
			session.setAttribute("id",id);
			session.setAttribute("idUtilisateur", connexionService.numId());
			session.setAttribute("enMission", utilisateurService.getEnMission(id));
			
			return "redirect:/Accueil";
		}
		
		return "Connexion";
	}
	
	@GetMapping(value="Accueil")
	public String accueilPage(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
        if (session.getAttribute("connected") != "connected") {
	        return "redirect:/";	        
        }
    	Long idUtilisateur = (Long) session.getAttribute("id");

    	try {
			model.addAttribute("missionToShow", missionService.getNextMission());
			request.setAttribute("idMission", missionService.getNextMission().getIdMission());
	    	model.addAttribute("utilisateurForm", utilisateurService.getByIdUtilisateur(idUtilisateur));

		} catch (Exception e) {
			e.printStackTrace();
		}
        
		return "Accueil";

	}

}
