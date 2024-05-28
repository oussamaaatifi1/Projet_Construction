<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.construction.projetconstruction.Dao.ProjetDao" %>
<%@ page import="com.construction.projetconstruction.model.Projet" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter Tâche</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%
    // Retrieve the list of projects to populate the dropdown
    ProjetDao projetDAO = new ProjetDao();
    List<Projet> listeProjets = projetDAO.getAllProjets();
%>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h2 class="card-title">Ajouter Tâche</h2>
                </div>
                <div class="card-body">
                    <form onsubmit="return validerFormulaireTache();" action="taches" method="POST">

                        <div class="form-group">
                            <label for="description">Description</label>
                            <input type="text" class="form-control" id="description" name="description" placeholder="Description">
                        </div>
                        <div class="form-group">
                            <label for="datedebut">Date de Début</label>
                            <input type="date" class="form-control" id="datedebut" name="datedebut">
                        </div>
                        <div class="form-group">
                            <label for="datefin">Date de Fin</label>
                            <input type="date" class="form-control" id="datefin" name="datefin">
                        </div>
                        <div class="form-group">
                            <label for="status">Statut</label>
                            <input type="text" class="form-control" id="status" name="status" placeholder="Statut">
                        </div>
                        <div class="form-group">
                            <label for="id_projet">Projet</label>
                            <select class="form-control" id="id_projet" name="id_projet">
                                <% for (Projet projets : listeProjets) { %>
                                <option value="<%= projets.getId() %>"><%= projets.getNom() %></option>
                                <% } %>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-success btn-block">Ajouter</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="js/valide.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>