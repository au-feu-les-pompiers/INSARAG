package com.cergy.eisti.projet_INSARAG.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class CarteController {
	
	@RequestMapping(value = "/carte", method = RequestMethod.GET)
	public String afficherCarte (HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
        if (session.getAttribute("connected") != "connected") {
	        return "redirect:/";	        
        }
		return ("/carte");
	}


}
