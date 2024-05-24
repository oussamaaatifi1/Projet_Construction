package com.construction.projetconstruction.Dao;

import com.construction.projetconstruction.dbconnection.DbConnect;
import com.construction.projetconstruction.model.Tache;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TacheDao {

    // Retrieve all tasks
    public List<Tache> getAllTaches() {
        List<Tache> taches = new ArrayList<>();
        String sql = "SELECT * FROM tache";
        try (Connection connection = DbConnect.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {
            while (resultSet.next()) {
                Tache tache = new Tache();
                tache.setId(resultSet.getInt("id_tache"));
                tache.setStatus(resultSet.getString("statut"));
                tache.setDescription(resultSet.getString("description"));
                tache.setDatedebut(resultSet.getDate("dateDebut"));
                tache.setDatefin(resultSet.getDate("dateFin"));
//                tache.setId_projet(resultSet.getInt("id_projet"));
                taches.add(tache);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return taches;
    }

    // Create a new task
    public boolean createTache(Tache tache) {
        String sql = "INSERT INTO tache (status, description, dateDebut, dateFin,id_projet) VALUES (?, ?, ?, ?,?)";
        try (Connection connection = DbConnect.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, tache.getStatus());
            statement.setString(2, tache.getDescription());
            statement.setDate(3, tache.getDatedebut());
            statement.setDate(4, tache.getDatefin());
            statement.setInt(5, tache.getId_projet());
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    // Retrieve a task by its ID
    public Tache getTacheById(int id) {
        Tache tache = null;
        String sql = "SELECT * FROM tache WHERE id_tache = ?";
        try (Connection connection = DbConnect.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int Id = resultSet.getInt("id_tache");
                    String status = resultSet.getString("status");
                    Date dateDebut = resultSet.getDate("datedebut");
                    Date dateFin = resultSet.getDate("datefin");
                    String description = resultSet.getString("description");
                    int id_projet = resultSet.getInt("id_projet");
                    tache = new Tache(status,dateDebut,dateFin,description,id_projet);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tache;
    }

    // Update an existing task
    public boolean updateTache(Tache tache) {
        String sql = "UPDATE tache SET status = ?, description = ?, dateDebut = ?, dateFin = ?, id_projet = ? WHERE id_tache = ?";
        try (Connection connection = DbConnect.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, tache.getStatus());
            statement.setString(2, tache.getDescription());
            statement.setDate(3, tache.getDatedebut());
            statement.setDate(4, tache.getDatefin());
            statement.setInt(5, tache.getId_projet());
            statement.setInt(6, tache.getId());
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete a task by its ID
    public boolean deleteTache(int id) {
        String sql = "DELETE FROM tache WHERE id_tache = ?";
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
