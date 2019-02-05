package com.cergy.eisti.projet_INSARAG.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "ROLESPOMPIERS")
public class RolesPompiers implements java.io.Serializable{
	private Long idRole;
	private String nom;
	
	public RolesPompiers() {	
	}
	
	public RolesPompiers(Long id, String nom) {
		this.idRole = id;
		this.nom = nom;
	}
	
	@Id

	@Column(name = "IDROLE", unique = true, nullable = false, scale = 0)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator="ROLE_gen_seq")
    @SequenceGenerator(name="ROLE_gen_seq", sequenceName="ROLE_SEQ", allocationSize=1) 
	public Long getIdRole() {
		return idRole;
	}

	public void setIdRole(Long idRole) {
		this.idRole = idRole;
	}

	@Column(name = "NOM", nullable = false, length = 30)
	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	
}
