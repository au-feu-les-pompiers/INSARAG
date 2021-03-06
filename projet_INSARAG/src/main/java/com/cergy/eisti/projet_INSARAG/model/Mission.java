package com.cergy.eisti.projet_INSARAG.model;
// Generated 11-Dec-2018 14:29:04 by Hibernate Tools 5.2.10.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * Mission generated by hbm2java
 */
@Entity
@Table(name = "MISSION")
public class Mission implements java.io.Serializable {

	private Long idMission;
	private String lieu;
	private String debut;
	private String fin;
	private Integer flagFin;
	
	public Mission() {
	}

	public Mission(Long idMission, String lieu, String debut, String fin, Integer flagFin) {
		this.idMission = idMission;
		this.lieu = lieu;
		this.debut = debut;
		this.fin = fin;
		this.flagFin = flagFin;
	}

	@Id

	@Column(name = "IDMISSION", unique = true, nullable = false, scale = 0)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator="MISSION_gen_seq")
    @SequenceGenerator(name="MISSION_gen_seq", sequenceName="MISSION_SEQ", allocationSize=1)
	public Long getIdMission() {
		return this.idMission;
	}

	public void setIdMission(Long idMission) {
		this.idMission = idMission;
	}

	@Column(name = "LIEU", nullable = false, length = 30)
	public String getLieu() {
		return this.lieu;
	}

	public void setLieu(String lieu) {
		this.lieu = lieu;
	}

	@Column(name = "DEBUT", nullable = false, length = 7)
	public String getDebut() {
		return this.debut;
	}

	public void setDebut(String debut) {
		this.debut = debut;
	}
	
	@Column(name = "FIN", nullable = false, length = 7)
	public String getFin() {
		return this.fin;
	}

	public void setFin(String fin) {
		this.fin = fin;
	}

	@Column(name = "FLAG_FIN", precision = 1, scale = 0)
	public Integer getFlagFin() {
		return this.flagFin;
	}

	public void setFlagFin(Integer flagFin) {
		this.flagFin = flagFin;
	}

}
