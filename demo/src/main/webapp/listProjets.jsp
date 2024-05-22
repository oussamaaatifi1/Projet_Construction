<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.construction.projetconstruction.model.Projet" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Projets</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>
<div class="container mx-auto mt-4">
    <h2 class="text-xl font-semibold mb-4">Liste des Projets</h2>
    <a href="projets?action=new" class="bg-blue-500 text-white py-2 px-4 rounded mb-4 inline-block">Créer un nouveau projet</a>
    <table class="w-full bg-white shadow-md rounded-lg overflow-hidden">
        <thead class="bg-blue-600 text-white">
        <tr>
            <th class="py-2 px-4">Nom</th>
            <th class="py-2 px-4">Description</th>
            <th class="py-2 px-4">Date de Début</th>
            <th class="py-2 px-4">Date de Fin</th>
            <th class="py-2 px-4">Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="projetDao" items="${projetDao}">
            <tr>
                <td class="py-2 px-4">${projetDao.nom}</td>
                <td class="py-2 px-4">${projetDao.description}</td>
                <td class="py-2 px-4">${projetDao.dateDebut}</td>
                <td class="py-2 px-4">${projetDao.dateFin}</td>
                <td class="py-2 px-4">
                    <a href="projets?action=edit&id=${projetDao.id}" class="text-blue-500 hover:underline">Modifier</a> |
                    <a href="projets?action=delete&id=${projetDao.id}" class="text-red-500 hover:underline">Supprimer</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
