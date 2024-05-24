package com.construction.projetconstruction.model;

import java.sql.Date;

public class Projet {
    private int id_projet;
    private String nom;
    private Date datedebut;
    private Date datefin;
    private String description;
    private double budget;




    public Projet(String nom, Date dateDebut, Date dateFin, String description,double budget) {
        this.nom = nom;
        this.datedebut = dateDebut;
        this.datefin = dateFin;
        this.description = description;
        this.budget = budget;
    }

    public Projet(int id_projet, String nom, String description, Date dateDebut, Date dateFin,double Budgets) {
        this.id_projet = id_projet;
        this.nom = nom;
        this.description = description;
        this.datedebut = dateDebut;
        this.datefin = dateFin;
        this.budget = Budgets;
    }

    public Projet() {

    }

    public int getId() {
        return id_projet;
    }

    public void setId_projet(int id_projet) {
        this.id_projet = id_projet;
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

    public double getBudget() {
        return budget;
    }

    public void setBudget(double budget) {
        this.budget = budget;
    }
}

