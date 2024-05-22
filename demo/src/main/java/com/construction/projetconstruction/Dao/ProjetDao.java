package com.construction.projetconstruction.Dao;

import com.construction.projetconstruction.dbconnection.DbConnect;
import com.construction.projetconstruction.model.Projet;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProjetDao {

    public boolean create(Projet projet) {
        String query = "INSERT INTO projet (nom, datedebut, datefin, description) VALUES (?, ?, ?, ?)";
        try (Connection connection = DbConnect.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, projet.getNom());
            preparedStatement.setDate(2, projet.getDateDebut());
            preparedStatement.setDate(3, projet.getDateFin());
            preparedStatement.setString(4, projet.getDescription());
            int result = preparedStatement.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Projet> readAll() {
        List<Projet> projets = new ArrayList<>();
        String query = "SELECT * FROM projet";
        try (Connection connection = DbConnect.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {
            while (resultSet.next()) {
                String nom = resultSet.getString("nom");
                Date dateDebut = resultSet.getDate("date_debut");
                Date dateFin = resultSet.getDate("date_fin");
                String description = resultSet.getString("description");
                projets.add(new Projet(nom, dateDebut, dateFin, description));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return projets;
    }
}
