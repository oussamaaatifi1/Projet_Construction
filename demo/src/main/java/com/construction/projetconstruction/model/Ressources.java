package com.construction.projetconstruction.model;

public class Ressources {
    private String nom;
    private String type;
    private int quantite;
    private String Fournisseur;

    public Ressources(String nom, String type, int quantite, String fournisseur) {
        this.nom = nom;
        this.type = type;
        this.quantite = quantite;
        Fournisseur = fournisseur;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getQuantite() {
        return quantite;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }

    public String getFournisseur() {
        return Fournisseur;
    }

    public void setFournisseur(String fournisseur) {
        Fournisseur = fournisseur;
    }
}
