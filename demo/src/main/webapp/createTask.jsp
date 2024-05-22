<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Créer une Nouvelle Tâche</title>
</head>
<body>
<h1>Créer une Nouvelle Tâche</h1>
<form action="CreateTacheServlet" method="post">
    <label for="status">Statut:</label>
    <input type="text" id="status" name="status" required><br><br>

    <label for="dateDebut">Date de début (yyyy-MM-dd):</label>
    <input type="date" id="dateDebut" name="dateDebut" required><br><br>

    <label for="dateFin">Date de fin (yyyy-MM-dd):</label>
    <input type="date" id="dateFin" name="dateFin" required><br><br>

    <label for="description">Description:</label>
    <textarea id="description" name="description" required></textarea><br><br>

    <input type="submit" value="Créer Tâche">
</form>
</body>
</html>
