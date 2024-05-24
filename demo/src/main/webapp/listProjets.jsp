<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.construction.projetconstruction.model.Projet" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Liste des Projets</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
</head>
<body>
<div class="container mx-auto px-4">
    <h2 class="text-2xl font-semibold my-4">Liste des Projets</h2>
    <a href="projets?action=new" class="bg-blue-500 text-white py-2 px-4 rounded inline-block mb-4 hover:bg-blue-600">Créer un nouveau projet</a>
    <table class="min-w-full bg-white border border-gray-300">
        <thead class="bg-blue-600 text-white">
        <tr>
            <th class="py-2 px-4 border">Nom</th>
            <th class="py-2 px-4 border">Description</th>
            <th class="py-2 px-4 border">Date de Début</th>
            <th class="py-2 px-4 border">Date de Fin</th>
            <th class="py-2 px-4 border">Budgets</th>

            <th class="py-2 px-4 border">Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Projet> projets = (List<Projet>) request.getAttribute("projets");
            if (projets != null && !projets.isEmpty()) {
                for (Projet projet : projets) {
        %>
        <tr>
            <td class="py-2 px-4 border"><%= projet.getNom() %></td>
            <td class="py-2 px-4 border"><%= projet.getDescription() %></td>
            <td class="py-2 px-4 border"><%= projet.getDateDebut() %></td>
            <td class="py-2 px-4 border"><%= projet.getDateFin() %></td>
            <td class="py-2 px-4 border"><%= projet.getBudget() %></td>
            <td class="py-2 px-4 border">
                <a href="projets?action=edit&id=<%= projet.getId() %>" class="text-blue-500 hover:underline">Mettre à jour</a> |
                <a href="projets?action=delete&id=<%= projet.getId() %>" class="text-red-500 hover:underline" onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce projet ?');">Supprimer</a>
                <a href="projets?action=list&id=<%= projet.getId() %>" class="text-blue-500 hover:underline">Mettre à jour</a> |
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="5" class="py-2 px-4 border text-center">Aucun projet trouvé.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
