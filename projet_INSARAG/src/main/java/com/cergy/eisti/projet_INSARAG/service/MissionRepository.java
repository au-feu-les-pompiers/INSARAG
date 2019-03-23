package com.cergy.eisti.projet_INSARAG.service;
 

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;

import com.cergy.eisti.projet_INSARAG.model.Mission;

 
public interface MissionRepository extends Repository <Mission, Long>{
	
 
	Mission findById(Long idMission);
	 
	List<Mission> findAll();
	
	Mission save (Mission mission);
	 
	@Modifying
	@Query("update Mission u set u.id = ?1")
	int updateIdMission(Long idMission);

	@Modifying
	@Query("update Utilisateur u set u.enMission = 0 where u.id <> 0")
	int resetEnMission();
	
	@Modifying
	@Query("update Mission m set m.flagFin = 1 where m.flagFin = 0")
	int fermerMission(Long id);
	
//	@Modifying
//	@Query("update Mission u set u.lieu = ?1  where u.id_ = ?2")
//	int updateLieuMission(String lieuMission, Long idMission);

}