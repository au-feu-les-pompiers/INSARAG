package com.cergy.eisti.projet_INSARAG.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cergy.eisti.projet_INSARAG.model.Utilisateur;

@Service
public class ConnexionService {
	
	@Autowired
	private ConnexionRepository repo;
	private Utilisateur utilisateur;

	
	public boolean isRegistered(String login,String mdp) {
		for (Utilisateur profilFind : this.getAll()) {
			String emailGet = profilFind.getEmail();
			String mdpGet = profilFind.getMdp();
			
			if (login.equals(emailGet) && mdp.equals(mdpGet)) {
				this.utilisateur = profilFind;
				return true;
			}			
		}
		return false;
	}
	
	
	public List<Utilisateur> getAll() {
 		return (List<Utilisateur>) repo.findAll() ;
	}
	
	public String accreditationLvl() throws Exception {
		if (utilisateur.getAutorisation() == 1) {
			return "Administrateur";
		}
		return "pompier";
	}

}
