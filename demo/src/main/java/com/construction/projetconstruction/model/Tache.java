package com.construction.projetconstruction.model;

import java.sql.Date;

public class Tache {
    private int id_tache;
    private String status;
    private Date datedebut;
    private Date datefin;
    private String description;
    private int id_projet;

    public Tache(String status, Date datedebut, Date datefin, String description, int id_projet) {
        this.status = status;
        this.datedebut = datedebut;
        this.datefin = datefin;
        this.description = description;
        this.id_projet = id_projet;
    }

    public Tache(int id_tache, String status, Date datedebut, Date datefin, String description, int id_projet) {
        this.id_tache = id_tache;
        this.status = status;
        this.datedebut = datedebut;
        this.datefin = datefin;
        this.description = description;
        this.id_projet = id_projet;
    }

    public Tache() {
    }

    public int getId() {
        return id_tache;
    }

    public void setId(int id_tache) {
        this.id_tache = id_tache;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getDatedebut() {
        return datedebut;
    }

    public void setDatedebut(Date datedebut) {
        this.datedebut = datedebut;
    }

    public Date getDatefin() {
        return datefin;
    }

    public void setDatefin(Date datefin) {
        this.datefin = datefin;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getId_projet() {
        return id_projet;
    }

    public void setId_projet(int id_projet) {
        this.id_projet = id_projet;
    }
}
