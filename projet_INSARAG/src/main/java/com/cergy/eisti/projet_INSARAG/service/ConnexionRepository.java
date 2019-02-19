package com.cergy.eisti.projet_INSARAG.service;

import java.util.List;

import org.springframework.data.repository.Repository;

import com.cergy.eisti.projet_INSARAG.model.Utilisateur;

public interface ConnexionRepository extends Repository <Utilisateur, Long>{
	
	Utilisateur findById(Long idPompier);
	 
	List<Utilisateur> findAll();
	
	Utilisateur save (Utilisateur utilisateur);
	
}
