package com.construction.projetconstruction.model;

import com.construction.projetconstruction.dbconnection.DbConnect;
import com.construction.projetconstruction.model.Projet;
import com.construction.projetconstruction.util.DateUtil;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Main {
    public static void main(String[] args) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        Statement statement = null;
        try {
            // Établir la connexion à la base de données en utilisant la classe DbConnect
            connection = DbConnect.getConnection();

            // Créer un objet Statement pour exécuter des requêtes SQL
            statement = connection.createStatement();

            // Exemple d'opération : Sélection de tous les projets
            String selectProjetQuery = "SELECT * FROM projet";
            ResultSet resultSetProjet = statement.executeQuery(selectProjetQuery);

            // Affichage des projets
            System.out.println("Liste des projets :");
            while (resultSetProjet.next()) {
                // Créer un objet Projet à partir des données de la base de données
                Projet projet = new Projet(
                        resultSetProjet.getString("nom"),
                        resultSetProjet.getDate("datedebut"),
                        resultSetProjet.getDate("datefin"),
                        resultSetProjet.getString("description")
                );

                // Afficher les détails du projet
                System.out.println(projet);
            }

            // Fermer le ResultSet
            resultSetProjet.close();

            // Création d'un nouveau projet avec des dates valides
            Projet nouveauProjet = new Projet();
            nouveauProjet.setDateDebut(DateUtil.convertStringToSqlDate("2024-05-19")); // Convertir la chaîne en Date
            nouveauProjet.setDateFin(DateUtil.convertStringToSqlDate("2024-06-12")); // Convertir la chaîne en Date
            nouveauProjet.setDescription("Nouveau projet de construction");
            nouveauProjet.setNom("Projet Alpha");

            // Insérer le nouveau projet dans la base de données en utilisant PreparedStatement
            String insertProjetQuery = "INSERT INTO projet (nom, datedebut, datefin, description) VALUES (?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(insertProjetQuery);
            preparedStatement.setString(1, nouveauProjet.getNom());
            preparedStatement.setDate(2, nouveauProjet.getDateDebut());
            preparedStatement.setDate(3, nouveauProjet.getDateFin());
            preparedStatement.setString(4, nouveauProjet.getDescription());
            preparedStatement.executeUpdate();

            // Affichage du nouveau projet
            System.out.println("Nouveau projet inséré dans la base de données : " + nouveauProjet);

        } catch (SQLException e) {
            // Gérer les exceptions SQL
            e.printStackTrace();
        } finally {
            // Fermer les ressources (PreparedStatement, Statement, Connection)
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                // Gérer les exceptions lors de la fermeture des ressources
                e.printStackTrace();
            }
        }
    }
}
