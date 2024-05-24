package com.construction.projetconstruction.Dao;

import com.construction.projetconstruction.dbconnection.DbConnect;
import com.construction.projetconstruction.model.Projet;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProjetDao {

    // Retrieve all projects
    public List<Projet> getAllProjets() {
        List<Projet> projets = new ArrayList<>();
        String sql = "SELECT * FROM projet";
        try (Connection connection = DbConnect.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {
            while (resultSet.next()) {
                Projet projet = new Projet();
                projet.setId_projet(resultSet.getInt("id_projet")); // Change to id_projet
                projet.setNom(resultSet.getString("nom"));
                projet.setDescription(resultSet.getString("description"));
                projet.setDateDebut(resultSet.getDate("dateDebut"));
                projet.setDateFin(resultSet.getDate("dateFin"));
                projet.setBudget(resultSet.getDouble("budget"));
                projets.add(projet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return projets;
    }

    // Create a new project
    public boolean createProjet(Projet projet) {
        String sql = "INSERT INTO projet (nom, description, dateDebut, dateFin, budget) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DbConnect.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, projet.getNom());
            statement.setString(2, projet.getDescription());
            statement.setDate(3, projet.getDateDebut());
            statement.setDate(4, projet.getDateFin());
            statement.setDouble(5, projet.getBudget());
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Retrieve a project by its ID
    public Projet getProjetById(int id) {
        Projet projet = null;
        String sql = "SELECT * FROM projet WHERE id_projet = ?";
        try (Connection connection = DbConnect.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int Id = resultSet.getInt("id_projet");
                    String nom = resultSet.getString("nom");
                    Date dateDebut = resultSet.getDate("dateDebut");
                    Date dateFin = resultSet.getDate("dateFin");
                    String description = resultSet.getString("description");
                    double budget = resultSet.getDouble("budget");
                    projet = new Projet(Id, nom, description, dateDebut, dateFin, budget);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return projet;
    }

    // Update an existing project
    public boolean updateProjet(Projet projet) {
        String sql = "UPDATE projet SET nom = ?, description = ?, dateDebut = ?, dateFin = ?, budget = ? WHERE id_projet = ?";
        try (Connection connection = DbConnect.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, projet.getNom());
            statement.setString(2, projet.getDescription());
            statement.setDate(3, projet.getDateDebut());
            statement.setDate(4, projet.getDateFin());
            statement.setDouble(5, projet.getBudget());
            statement.setInt(6, projet.getId()); // Change to id_projet
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete a project by its ID
    public boolean deleteProjet(int id) {
        String sql = "DELETE FROM projet WHERE id_projet = ?";
        try (Connection connection = DbConnect.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
