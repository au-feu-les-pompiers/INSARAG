package com.cergy.eisti.projet_INSARAG.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cergy.eisti.projet_INSARAG.model.Utilisateur;

@Service
@Transactional
public class UtilisateurServiceImpl implements UtilisateurService{

	@Autowired
	private UtilisateurRepository utilisateurRepository;

	 
	@Override
	public  Utilisateur getByIdUtilisateur(Long id) throws Exception {
        return  (Utilisateur) utilisateurRepository.findById(id);

	}

	@Override
	public  int getAutoByIdUtilisateur(Long id) throws Exception {
        return  (int) utilisateurRepository.findAutoByIdUtilisateur(id);

	}
 
	@Override
	public Long save(Utilisateur utilisateur) throws Exception {
		
		utilisateur = utilisateurRepository.save(utilisateur);
		return utilisateur.getId();
	}




	 


	@Override
	public int updateId(Long id) {
		return utilisateurRepository.updateIdUtilisateur(id);
	}


	@Override
	public int updateAuto(int autoUtilisateur, Long idUtilisateur) {
		return utilisateurRepository.updateAutoUtilisateur(autoUtilisateur, idUtilisateur) ;

	}




	@Override
	public List<Utilisateur> getAll() {
 		return (List<Utilisateur>) utilisateurRepository.findAll() ;
	}

	@Override
	public int downAuto(Long idUtilisateur) {
		return utilisateurRepository.downAutoUtilisateur(idUtilisateur) ;
	}

	@Override
	public String hash(String login, String mdp) {
		return Integer.toString((login + mdp).hashCode());
	}

	@Override
	public List<Utilisateur> getAllInMission() {
		List<Utilisateur> inMission = new ArrayList<>();
		for(Utilisateur u : utilisateurRepository.findAll()) {
			if (u.getEnMission() == 1 ) {
				inMission.add(u);
			}
		}
		return inMission;
	}
	
	@Override
	public List<Utilisateur> getPompierInMission() {
		List<Utilisateur> inMission = new ArrayList<>();
		for(Utilisateur u : utilisateurRepository.findAll()) {
			if (u.getEnMission() == 1 && u.getRole() == 1) {
				inMission.add(u);
			}
		}
		return inMission;
	}
	
	@Override
	public List<Utilisateur> getMedecinInMission() {
		List<Utilisateur> inMission = new ArrayList<>();
		for(Utilisateur u : utilisateurRepository.findAll()) {
			if (u.getEnMission() == 1 && u.getRole() == 2) {
				inMission.add(u);
			}
		}
		return inMission;
	}
	
	@Override
	public List<Utilisateur> getManagerInMission() {
		List<Utilisateur> inMission = new ArrayList<>();
		for(Utilisateur u : utilisateurRepository.findAll()) {
			if (u.getEnMission() == 1 && u.getRole() == 3) {
				inMission.add(u);
			}
		}
		return inMission;
	}

	@Override
	public int getEnMission(Long id) {
		try {
			return this.getByIdUtilisateur(id).getEnMission();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
   
}
