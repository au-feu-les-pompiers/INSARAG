package com.cergy.eisti.projet_INSARAG.controller;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
//import org.eclipse.FirstSpringMvc.dao.PersonneRepository;
//import org.eclipse.FirstSpringMvc.model.Personne;



@Controller("InscriptionController")
public class InscriptionController {

	@Autowired 
	private ProfilRepository profilRepository;

	
@RequestMapping(value = "/inscription", method = RequestMethod.POST)
	    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
	        /* Affichage de la page d'inscription */

	    }
}
