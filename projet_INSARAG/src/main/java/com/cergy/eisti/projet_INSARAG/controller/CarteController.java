package com.cergy.eisti.projet_INSARAG.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class CarteController {
	
	@RequestMapping(value = "/carte", method = RequestMethod.GET)
	public String afficherCarte (HttpServletRequest request) throws Exception {
		return ("/carte");
	}


}
