package com.cergy.eisti.projet_INSARAG.service;

import java.util.List;

import com.cergy.eisti.projet_INSARAG.model.Utilisateur;

public interface UtilisateurService {

	public Long save (Utilisateur mission) throws Exception ;
	
	List<Utilisateur> getAll();
 
	Utilisateur getByIdUtilisateur(Long id) throws Exception;
	
	int getAutoByIdUtilisateur(Long id) throws Exception;
	
	int updateId (Long id);
	
  	int updateAuto (int autoUtilisateur, Long idUtilisateur); 

  	int downAuto (Long idUtilisateur); 

   
}
