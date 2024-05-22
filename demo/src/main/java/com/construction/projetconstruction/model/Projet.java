package com.construction.projetconstruction.model;

import java.sql.Date;

public class Projet {
    private String nom;
    private Date datedebut;
    private Date datefin;
    private String description;

    public Projet() {
    }

    public Projet(String nom, Date dateDebut, Date dateFin, String description) {
        this.nom = nom;
        this.datedebut = dateDebut;
        this.datefin = dateFin;
        this.description = description;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Date getDateDebut() {
        return datedebut;
    }

    public void setDateDebut(Date dateDebut) {
        this.datedebut = dateDebut;
    }

    public Date getDateFin() {
        return datefin;
    }

    public void setDateFin(Date dateFin) {
        this.datefin = dateFin;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
