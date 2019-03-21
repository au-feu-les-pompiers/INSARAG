package com.cergy.eisti.projet_INSARAG.service;
 

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;

import com.cergy.eisti.projet_INSARAG.model.Utilisateur;

 
public interface UtilisateurRepository extends Repository <Utilisateur, Long>{
	
 
	Utilisateur findById(Long id);
	 
	List<Utilisateur> findAll();
	
	Utilisateur save(Utilisateur utilisateur);
	
	@Query("select u.autorisation from Utilisateur u where u.id = ?1")
	int findAutoByIdUtilisateur(Long id);
	 
	@Modifying
	@Query("update Utilisateur u set u.id = ?1")
	int updateIdUtilisateur(Long id);
	
	@Modifying
	@Query("update Utilisateur u set u.autorisation = ?1  where u.id = ?2")
	int updateAutoUtilisateur(int autoUtilisateur, Long idUtilisateur);

	@Modifying
	@Query("update Utilisateur u set u.autorisation = -1  where u.id = ?1")
	int downAutoUtilisateur(Long idUtilisateur);

}