package com.cergy.eisti.projet_INSARAG.controller;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cergy.eisti.projet_INSARAG.model.Mission;
import com.cergy.eisti.projet_INSARAG.service.MissionService;
import com.cergy.eisti.projet_INSARAG.model.Utilisateur;
import com.cergy.eisti.projet_INSARAG.service.UtilisateurService;
 
 
@Controller 
@RequestMapping("/") //make all URL's through this controller relative to /index
public class IndexController {
	
	private final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@Autowired
	MissionService missionService;
	
	@Autowired
	UtilisateurService utilisateurService;
	
	@RequestMapping(value="/index", method= RequestMethod.GET)
	public String index(Map<String, Object> model) throws Exception {
	 
    return "commmon/header";
	}   
	
		/**************************************
		 * Gestion mission
		 * **Nouvelle mission : /mission/new
	     * **Liser Tous : /misison/listAll
		 ***************************************/	
		
		// show new Mission form
		@RequestMapping(value = "/mission/new", method = RequestMethod.GET)
		public String showNewMission(Model model, HttpServletRequest request) {
			HttpSession session = request.getSession();
	        if (session.getAttribute("connected") != "connected") {
		        return "redirect:/";	        
	        }
	        if ((int) session.getAttribute("accreditation" ) != 2) {
				return "redirect:/Accueil";
	        }

			logger.debug(":::showNewMission:::");

			Mission mission = new Mission();
			
			model.addAttribute("missionForm", mission);

	 
			 return "/mission/addUpdateMission";

		}
		
		// show new Mission form
		@RequestMapping(value = "/utilisateur/new", method = RequestMethod.GET)
		public String showNewUtilisateur(Model model) {

			logger.debug(":::showNewUtilisateur:::");

			Utilisateur utilisateur = new Utilisateur();
			
			model.addAttribute("utilisateurForm", utilisateur);

	 
			 return "/utilisateur/inscriptionUtilisateur";

		}
		

		
		 // show list of All Mission
			@RequestMapping({"/mission/listAll","missionList"})
			protected ModelAndView lisAllMissions(HttpServletRequest request,
					HttpServletResponse response) throws Exception {
				HttpSession session = request.getSession();
		        if ((int) session.getAttribute("accreditation" ) != 2) {
					return new ModelAndView("/Accueil");
		        }
				/*
				 * Lancement du Service et récupération données en base
				 */
				List<Mission> listeMissions = missionService.getAll();

				/*
				 * Envoi Vue + Modèle MVC pour Affichage données vue
				 */
				return new ModelAndView("/mission/showAllMissions", "missions", listeMissions);
			} 
			
			 // show list of All Mission
				@RequestMapping({"/utilisateur/listAll","utilisateurList"})
				protected ModelAndView lisAllUtilisateurs(HttpServletRequest request,
						HttpServletResponse response) throws Exception {
					HttpSession session = request.getSession();
			        if ((int) session.getAttribute("accreditation" ) != 2) {
						return new ModelAndView("redirect:/Accueil");
			        }
					/*
					 * Lancement du Service et récupération données en base
					 */
					List<Utilisateur> listeUtilisateurs = utilisateurService.getAll();

					/*
					 * Envoi Vue + Modèle MVC pour Affichage données vue
					 */
					return new ModelAndView("/utilisateur/showAllUtilisateurs", "utilisateurs", listeUtilisateurs);
				}
				
				 // show list of All FireFighters in Mission
					@RequestMapping({"/utilisateur/listAllInMision","utilisateurList"})
					protected ModelAndView lisAllUtilisateursInMission(HttpServletRequest request,
							HttpServletResponse response) throws Exception {
						HttpSession session = request.getSession();
						if ((int) session.getAttribute("accreditation" ) < 1) {
							return new ModelAndView("redirect:/Accueil");
				        }
				        if (session.getAttribute("connected") != "connected") {
					        return new ModelAndView("redirect:/");	        
				        }				
						/*
						 * Lancement du Service et récupération données en base
						 */
						List<Utilisateur> listeUtilisateurs = utilisateurService.getAllInMission();

						/*
						 * Envoi Vue + Modèle MVC pour Affichage données vue
						 */
						return new ModelAndView("/utilisateur/Contact", "utilisateurs", listeUtilisateurs);
					} 
				
				
				@RequestMapping(value = "/documents", method = RequestMethod.GET)
				public String showDocuments(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
					HttpSession session = request.getSession();
					if ((int) session.getAttribute("accreditation" ) < 1) {
						return ("redirect:/Accueil");
			        }
					logger.debug(":::showDocuments:::");
					if (session.getAttribute("connected") == "connected") {
					 return "/general/documents";
					}
					return "redirect:/";
				}
				
				@RequestMapping(value = "/fiche", method = RequestMethod.GET)
				public String showFiche(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
					HttpSession session = request.getSession();
					if ((int) session.getAttribute("accreditation" ) < 1) {
						return ("redirect:/Accueil");
			        }
					logger.debug(":::showFiche:::");
					if (session.getAttribute("connected") == "connected") {
					 return "/general/fiche_extraction";
					}
					return "redirect:/";
				}
				
			 	@RequestMapping(value = "/organigramme", method = RequestMethod.GET)
			    public String list(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
			 		HttpSession session = request.getSession();
					if ((int) session.getAttribute("accreditation" ) < 1) {
						return ("redirect:/Accueil");
			        }
			        if (session.getAttribute("connected") == "connected") {
			        	model.addAttribute("pompier", utilisateurService.getPompierInMission());
			        	model.addAttribute("medecin", utilisateurService.getMedecinInMission());
			        	model.addAttribute("manager", utilisateurService.getManagerInMission());
			        	return "/general/organigramme"; // Afficher la page showAllMissions.jsp qui se trouve sous /mission
			        }
			        return "redirect:/";
			    }
	
}
