package com.cergy.eisti.projet_INSARAG.controller;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
 
 
@Controller 
@RequestMapping("/index") //make all URL's through this controller relative to /index
public class IndexController {
	
	private final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@Autowired
	MissionService missionService;	
	
	@RequestMapping(value="/index", method= RequestMethod.GET)
	public String index(Map<String, Object> model) throws Exception {
	 
    return "index";
	}   
	
		/**************************************
		 * Gestion mission
		 * **Nouvelle mission : /mission/new
	     * **Liser Tous : /misison/listAll
		 ***************************************/	
		
		// show new Mission form
		@RequestMapping(value = "/mission/new", method = RequestMethod.GET)
		public String showNewMission(Model model) {

			logger.debug(":::showNewMission:::");

			Mission mission = new Mission();
			
			model.addAttribute("missionForm", mission);

	 
			 return "/mission/addUpdateMission";

		}
		

		
		 // show list of All Mission
			@RequestMapping({"/mission/listAll","missionList"})
			protected ModelAndView lisAllMissions(HttpServletRequest request,
					HttpServletResponse response) throws Exception {
				/*
				 * Lancement du Service et récupération données en base
				 */
				List<Mission> listeMissions = missionService.getAll();

				/*
				 * Envoi Vue + Modèle MVC pour Affichage données vue
				 */
				return new ModelAndView("/mission/showAllMissions", "missions", listeMissions);
			} 
	
}
