<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.construction.projetconstruction.model.Tache" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Liste des Taches</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
</head>
<body>
<div class="container mx-auto px-4">
    <h2 class="text-2xl font-semibold my-4">Liste des Projets</h2>
    <a href="taches?action=new" class="bg-blue-500 text-white py-2 px-4 rounded inline-block mb-4 hover:bg-blue-600">Créer un nouveau projet</a>
    <table class="min-w-full bg-white border border-gray-300">
        <thead class="bg-blue-600 text-white">
        <tr>
            <th class="py-2 px-4 border">Status</th>
            <th class="py-2 px-4 border">Description</th>
            <th class="py-2 px-4 border">Date de Début</th>
            <th class="py-2 px-4 border">Date de Fin</th>
            <th class="py-2 px-4 border">Actions</th>

        </tr>
        </thead>
        <tbody>
        <%
            List<Tache> taches = (List<Tache>) request.getAttribute("taches");
            if (taches != null && !taches.isEmpty()) {
                for (Tache tache : taches) {
        %>
        <tr>
            <td class="py-2 px-4 border"><%= tache.getStatus() %></td>
            <td class="py-2 px-4 border"><%= tache.getDescription() %></td>
            <td class="py-2 px-4 border"><%= tache.getDatedebut() %></td>
            <td class="py-2 px-4 border"><%= tache.getDatefin() %></td>
<%--            <td class="py-2 px-4 border"><%= tache.getId_projet() %></td>--%>
            <td class="py-2 px-4 border">
                <a href="taches?action=edit&id=<%= tache.getId() %>" class="text-blue-500 hover:underline">Mettre à jour</a> |
                <a href="taches?action=delete&id=<%= tache.getId() %>" class="text-red-500 hover:underline" onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce projet ?');">Supprimer</a>
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
