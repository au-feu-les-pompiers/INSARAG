package com.cergy.eisti.projet_INSARAG.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cergy.eisti.projet_INSARAG.model.Utilisateur;

import javassist.compiler.NoFieldException;

@Service
public class ConnexionService {
	
	@Autowired
	private ConnexionRepository repo;
	private Utilisateur utilisateur;

	
	public boolean isRegistered(String login,String mdp) {
		for (Utilisateur profilFind : this.getAll()) {
			String mdpGet = profilFind.getMdp();
			if (mdpGet.equals(Integer.toString((login + mdp).hashCode()))) {
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
	
	public Long getPompier(String login,String mdp) throws Exception{
		for (Utilisateur profilFind : this.getAll()) {
			String mdpGet = profilFind.getMdp();
			if (mdpGet.equals(Integer.toString((login + mdp).hashCode()))) {
				this.utilisateur = profilFind;
				return profilFind.getId();
			}
		}
		return (long) -1;
	}

}
