package com.cergy.eisti.projet_INSARAG.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cergy.eisti.projet_INSARAG.service.ConnexionService;

@Controller 
@RequestMapping("/") //make all URL's through this controller relative to /index
public class ConnexionController {
	
	@Autowired
	ConnexionService connexionService;
	
	
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
			session.setAttribute("accreditation", connexionService.accreditationLvl());
			session.setAttribute("connected", "connected");
			
			System.out.println(session.getAttribute("accreditation"));
			return "utilisateur/showAllUtilisateurs";
		}
		
		return "Connexion";
	}

}
