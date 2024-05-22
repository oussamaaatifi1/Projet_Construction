<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Créer un Nouveau Projet</title>
</head>
<body>
<h1>Créer un Nouveau Projet</h1>
<form action="CreateProjectServlet" method="post">
    <label for="nom">Nom du projet:</label>
    <input type="text" id="nom" name="nom" required><br><br>

    <label for="dateDebut">Date de début (yyyy-MM-dd):</label>
    <input type="text" id="dateDebut" name="dateDebut" required><br><br>

    <label for="dateFin">Date de fin (yyyy-MM-dd):</label>
    <input type="text" id="dateFin" name="dateFin" required><br><br>

    <label for="description">Description:</label>
    <textarea id="description" name="description" required></textarea><br><br>

    <input type="submit" value="Créer Projet">
</form>
</body>
</html>
