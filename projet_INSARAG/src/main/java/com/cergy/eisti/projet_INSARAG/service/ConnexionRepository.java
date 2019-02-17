package com.cergy.eisti.projet_INSARAG.service;

import java.util.List;

import org.springframework.data.repository.Repository;

import com.cergy.eisti.projet_INSARAG.model.Profil;

public interface ConnexionRepository extends Repository <Profil, Long>{
	
	Profil findById(Long idPompier);
	 
	List<Profil> findAll();
	
	Profil save (Profil profil);
	
}
