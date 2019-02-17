package com.cergy.eisti.projet_INSARAG.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cergy.eisti.projet_INSARAG.model.Profil;

@Service
public class ConnexionService {
	
	@Autowired
	private ConnexionRepository repo;
	private Profil profil;

	
	public boolean isRegistered(String login,String mdp) {
		for (Profil profilFind : this.getAll()) {
			String emailGet = profilFind.getEmail();
			String mdpGet = profilFind.getMdp();
			
			if (login.equals(emailGet) && mdp.equals(mdpGet)) {
				this.profil = profilFind;
				return true;
			}			
		}
		return false;
	}
	
	
	public List<Profil> getAll() {
 		return (List<Profil>) repo.findAll() ;
	}
	
	public String accreditationLvl() throws Exception {
		if (profil.getAdmin() == 1) {
			return "Administrateur";
		}
		return "pompier";
	}

}
