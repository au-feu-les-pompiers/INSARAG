package com.cergy.eisti.projet_INSARAG.service;

import java.util.List;

import com.cergy.eisti.projet_INSARAG.model.Mission;

public interface MissionService {

	public Long save (Mission mission) throws Exception ;
	
	List<Mission> getAll();
 
	Mission getByIdMission(Long id) throws Exception;
	
	int updateId (Long idMission);
	
  	//int updateLieu (String lieuMission, Long idMission); 

   
}
