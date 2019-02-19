package com.cergy.eisti.projet_INSARAG.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Redirect;
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

import com.cergy.eisti.projet_INSARAG.model.Utilisateur;
import com.cergy.eisti.projet_INSARAG.service.UtilisateurService;

import ch.qos.logback.classic.turbo.MDCValueLevelPair;

 
@Controller("inscriptionController")
public class InscriptionController {
	
	private final Logger logger = LoggerFactory.getLogger(InscriptionController.class);

 
	@Autowired
	UtilisateurService utilisateurService;
 

@RequestMapping(value = "/utilisateur/listAll", method = RequestMethod.GET)
	protected ModelAndView showAllUtilisateur() throws Exception {
		/*
		 * Lancement du Service et recupeation donnees en base
		 */
		List<Utilisateur> listeUtilisateurs = utilisateurService.getAll();

		/*
		 * Envoi Vue + Modele MVC pour Affichage donnees vue
		 */
		return new ModelAndView("/utilisateur/showAllUtilisateurs", "utilisateurs", listeUtilisateurs);
	}

	 	@RequestMapping(value = "/utilisateur/list", method = RequestMethod.GET)
	    public String list(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
	 		HttpSession session = request.getSession();
	        model.addAttribute("utilisateurs", utilisateurService.getAll());
	        if (session.getAttribute("connected") == "connected") {
		        return "/utilisateur/showAllUtilisateurs"; // Afficher la page showAllUtilisateurs.jsp qui se trouve sous /utilisateur
	        	
	        }
	        return "redirect:/"; // Afficher la page showAllUtilisateurs.jsp qui se trouve sous /utilisateur
	        
	    }

	    @RequestMapping(value = "/utilisateur/get/{id}" , method = RequestMethod.GET)
	    public String get(@PathVariable Long id, Model model) throws Exception {
	        model.addAttribute("utilToShow", utilisateurService.getByIdUtilisateur(id));
	        return "/utilisateur/showUtilisateur"; // Afficher la page modificationUtilisateur.jsp qui se trouve sous /utilisateur
	    }
	    
	    
	    @RequestMapping(value = "/utilisateur/save", method = RequestMethod.POST)
	    public String saveOrUpdate(@ModelAttribute("utilisateurForm") Utilisateur utilisateur, Model model, final RedirectAttributes redirectAttributes) throws Exception {
	    	utilisateur.setMdp(utilisateurService.hash(utilisateur.getEmail(), utilisateur.getMdp()));
	    	Long id = utilisateurService.save(utilisateur);
	    	try {
				
			
			

	    	
	    	if(  utilisateur.getId()!=null){
				redirectAttributes.addFlashAttribute("typeAlert", "info");
		    	redirectAttributes.addFlashAttribute("msgAlert", "Utilisateur dont ID : "+utilisateur.getId()+" a été mis à jour.");

			}else{
				redirectAttributes.addFlashAttribute("typeAlert", "success");
		    	redirectAttributes.addFlashAttribute("msgAlert", "Nouveau Utilisateur a été enregsitrée avec ID : "+id);
			}
	    	
	    	} catch (Exception e) {
				e.printStackTrace();
			}
	        return ("redirect:/utilisateur/get/"+Long.toString(id));
	    }
	    

 
	    @RequestMapping("/utilisateur/update/{id}")
	    public String update(@PathVariable Long id, Model model, final RedirectAttributes redirectAttributes) throws Exception {
	        Utilisateur utilisateur = utilisateurService.getByIdUtilisateur(id);
	        model.addAttribute("utilisateurForm", utilisateur);
	        return "/utilisateur/modificationUtilisateur";
	    }
	    
	    @RequestMapping("/utilisateur/upauto/{id}")
	    public String upauto(@PathVariable Long id, Model model,final RedirectAttributes redirectAttributes) throws Exception {
	    	int auto = utilisateurService.getAutoByIdUtilisateur(id);
	    	if((auto == 0) || (auto == -1)) {
	    		auto = 1;
	    	}
	    	else if(auto == 1) {
	    		auto = 2;
	    	}
	        utilisateurService.updateAuto(auto,id);
	    	model.addAttribute("utilisateurs", utilisateurService.getAll());
	        return "/utilisateur/showAllUtilisateurs";
	    }
	    
	    @RequestMapping("/utilisateur/down/{id}")
	    public String down(@PathVariable Long id, Model model,final RedirectAttributes redirectAttributes) throws Exception {
	        utilisateurService.downAuto(id);
	    	model.addAttribute("utilisateurs", utilisateurService.getAll());
	        return "/utilisateur/showAllUtilisateurs";
	    }
 
}
