package com.cergy.eisti.projet_INSARAG.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
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
	protected ModelAndView showAllUtilisateur(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
        if (session.getAttribute("connected") != "connected") {
	        return new ModelAndView("redirect:/");	        
        }
        if ((int) session.getAttribute("accreditation" ) != 2) {
			return new ModelAndView("redirect:/Accueil");
        }
		List<Utilisateur> listeUtilisateurs = utilisateurService.getAll();
		return new ModelAndView("/utilisateur/showAllUtilisateurs", "utilisateurs", listeUtilisateurs);
	}

	 	@RequestMapping(value = "/utilisateur/list", method = RequestMethod.GET)
	    public String list(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
	 		HttpSession session = request.getSession();
	        if ((int) session.getAttribute("accreditation" ) != 2) {
				return "redirect:/Accueil";
	        }
	        model.addAttribute("utilisateurs", utilisateurService.getAll());
	        if (session.getAttribute("connected") == "connected") {
		        return "/utilisateur/showAllUtilisateurs"; // Afficher la page showAllUtilisateurs.jsp qui se trouve sous /utilisateur
	        	
	        }
	        return "redirect:/"; // Afficher la page showAllUtilisateurs.jsp qui se trouve sous /utilisateur
	        
	    }

	    @RequestMapping(value = "/utilisateur/get/{id}" , method = RequestMethod.GET)
	    public String get(@PathVariable Long id, Model model, HttpServletRequest request) throws Exception {
			HttpSession session = request.getSession();
			if ((int) session.getAttribute("accreditation" ) < 1) {
				return ("redirect:/Accueil");
	        }
	        if (session.getAttribute("connected") != "connected") {
		        return "redirect:/";	        
	        }
	        model.addAttribute("utilToShow", utilisateurService.getByIdUtilisateur(id));
	        return "/utilisateur/showUtilisateur"; // Afficher la page modificationUtilisateur.jsp qui se trouve sous /utilisateur
	    }
	    
	    
	    @RequestMapping(value = "/utilisateur/save", method = RequestMethod.POST)
	    public String saveOrUpdate(@ModelAttribute("utilisateurForm") Utilisateur utilisateur, Model model,
	    		HttpServletRequest request, final RedirectAttributes redirectAttributes) throws Exception {
	    	
	    	boolean newU = true;
	    	String currentEmail = utilisateur.getEmail();
	    	String currentMatricule = utilisateur.getMatricule();
	    	String currentPhone = utilisateur.getTelephone();
	    	Long currentId = utilisateur.getId();
	    	/*
			 * Lancement du Service et récupération données en base
			 */
			List<Utilisateur> listeUtilisateurs = utilisateurService.getAll();

			/*
			 * Envoi Vue + Modèle MVC pour Affichage données vue
			 */
			for (Utilisateur util : listeUtilisateurs) {
				if (util.getId().equals(currentId)) {
					newU = false;
					break;
				}
			}
			
			if (newU) {
				for (Utilisateur util : listeUtilisateurs) {
					if (util.getEmail().equals(currentEmail)) {
						return "redirect:/utilisateur/new?error=email";
					}else if (util.getMatricule().equals(currentMatricule)){
						return "redirect:/utilisateur/new?error=matricule";
					}else if (util.getTelephone().equals(currentPhone)) {
						return "redirect:/utilisateur/new?error=telephone";
					}
				}
			}else {
				for (Utilisateur util : listeUtilisateurs) {
					if (util.getEmail().equals(currentEmail) && !(util.getId().equals(currentId))) {
						model.addAttribute("error", "Erreur, cet email existe déjà dans la base!");
						return "/utilisateur/modificationUtilisateur";
					}else if (util.getMatricule().equals(currentMatricule) && !(util.getId().equals(currentId))){
						model.addAttribute("error", "Erreur, ce matricule existe déjà dans la base!");
						return "/utilisateur/modificationUtilisateur";
					}else if (util.getTelephone().equals(currentPhone) && !(util.getId().equals(currentId))) {
						model.addAttribute("error", "Erreur, ce numéro de téléphone existe déjà dans la base!");
						return "/utilisateur/modificationUtilisateur";
					}
				}
			}
	    	
	    	utilisateur.setMdp(utilisateurService.hash(utilisateur.getEmail(), utilisateur.getMdp()));
	    	utilisateur.setReponse(utilisateurService.hash(utilisateur.getQuestion(), utilisateur.getReponse()));
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
	        return ("redirect:/Accueil");
	    }
	    
	    @RequestMapping(value = "/utilisateur/savePassword", method = RequestMethod.POST)
	    public String saveOrUpdatePassword(@ModelAttribute("utilisateurForm") Utilisateur utilisateur, Model model,
	    		HttpServletRequest request, final RedirectAttributes redirectAttributes) throws Exception {
	    	
	    	String currentEmail = utilisateur.getEmail();
	    	String currentMatricule = utilisateur.getMatricule();
	    	String currentPhone = utilisateur.getTelephone();
	    	String currentName = utilisateur.getNom();
	    	String currentFirstname = utilisateur.getPrenom();
	    	String currentBirth = utilisateur.getNaissance();
	    	String currentQuestion = utilisateur.getQuestion();
	    	String currentResponse = utilisateur.getReponse();
	    	int currentRole = utilisateur.getRole();
	    	/*
			 * Lancement du Service et récupération données en base
			 */
			List<Utilisateur> listeUtilisateurs = utilisateurService.getAll();

			/*
			 * Envoi Vue + Modèle MVC pour Affichage données vue
			 */
			for (Utilisateur util : listeUtilisateurs) {
				if (util.getEmail().equals(currentEmail)) {
					if (util.getMatricule().equals(currentMatricule) && util.getTelephone().equals(currentPhone) && util.getNaissance().equals(currentBirth) && util.getNom().equals(currentName) && util.getPrenom().equals(currentFirstname) && (util.getRole() == currentRole) && utilisateurService.hash(currentQuestion, currentResponse).equals(util.getReponse())){
						util.setMdp(utilisateurService.hash(utilisateur.getEmail(), utilisateur.getMdp()));
						Long id = utilisateurService.save(util);
						return "redirect:/Accueil";
					}
				}
			}
			return "redirect:/utilisateur/new?psswd=0&error=modif";
	    }
	    
 
	    @RequestMapping("/utilisateur/update/{id}")
	    public String update(@PathVariable Long id, Model model, HttpServletRequest request,
	    		final RedirectAttributes redirectAttributes) throws Exception {
			HttpSession session = request.getSession();
	        if (session.getAttribute("connected") != "connected") {
		        return "redirect:/";	        
	        }
	    	Utilisateur utilisateur = utilisateurService.getByIdUtilisateur(id);
	        model.addAttribute("utilisateurForm", utilisateur);
	        return "/utilisateur/modificationUtilisateur";
	    }
	    
	    @RequestMapping("/utilisateur/upauto/{id}")
	    public String upauto(@PathVariable Long id, Model model,HttpServletRequest request,
	    		final RedirectAttributes redirectAttributes) throws Exception {
			HttpSession session = request.getSession();
	        if (session.getAttribute("connected") != "connected") {
		        return "redirect:/";	        
	        }
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
	    public String down(@PathVariable Long id, Model model,
	    		HttpServletRequest request, final RedirectAttributes redirectAttributes) throws Exception {
			HttpSession session = request.getSession();
	        if (session.getAttribute("connected") != "connected") {
		        return "redirect:/";	        
	        }
	    	utilisateurService.downAuto(id);
	    	model.addAttribute("utilisateurs", utilisateurService.getAll());
	        return "/utilisateur/showAllUtilisateurs";
	    }
 
}
