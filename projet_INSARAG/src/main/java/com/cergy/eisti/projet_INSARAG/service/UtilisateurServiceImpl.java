package com.cergy.eisti.projet_INSARAG.service;

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

   
}
