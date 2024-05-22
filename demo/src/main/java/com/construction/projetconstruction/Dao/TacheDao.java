package com.construction.projetconstruction.Dao;

import com.construction.projetconstruction.dbconnection.DbConnect;
import com.construction.projetconstruction.model.Tache;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class TacheDao {

    public boolean create(Tache tache) {
        String query = "INSERT INTO tache (status, datedebut, datefin, description) VALUES (?, ?, ?, ?)";
        try (Connection connection = DbConnect.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, tache.getStatus());
            preparedStatement.setDate(2, tache.getDateDebut());
            preparedStatement.setDate(3, tache.getDateFin());
            preparedStatement.setString(4, tache.getDescription());
            int result = preparedStatement.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
//    public List<Tache> getAll() {
//        List<Tache> tasks = new ArrayList<>();
//        String query = "SELECT * FROM tache";
//        try (Connection connection = DbConnect.getConnection();
//             Statement statement = connection.createStatement();
//             ResultSet resultSet = statement.executeQuery(query)) {
//            while (resultSet.next()) {
//                Tache tache = new Tache(
//                        resultSet.getInt("id"),
//                        resultSet.getString("status"),
//                        resultSet.getDate("date_debut"),
//                        resultSet.getDate("date_fin"),
//                        resultSet.getString("description")
//                );
//                tasks.add(tache);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return tasks;
//    }

}
