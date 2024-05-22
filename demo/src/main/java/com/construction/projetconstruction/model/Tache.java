package com.construction.projetconstruction.model;

import java.sql.Date;

public class Tache {
    private int id;
    private String status;
    private Date dateDebut;
    private Date dateFin;
    private String description;

    public Tache(String status, Date dateDebut, Date dateFin, String description) {
        this.status = status;
        this.dateDebut = dateDebut;
        this.dateFin = dateFin;
        this.description = description;
    }

    public Tache(int id, String status, Date dateDebut, Date dateFin, String description) {
        this.id = id;
        this.status = status;
        this.dateDebut = dateDebut;
        this.dateFin = dateFin;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getDateDebut() {
        return dateDebut;
    }

    public void setDateDebut(Date dateDebut) {
        this.dateDebut = dateDebut;
    }

    public Date getDateFin() {
        return dateFin;
    }

    public void setDateFin(Date dateFin) {
        this.dateFin = dateFin;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
