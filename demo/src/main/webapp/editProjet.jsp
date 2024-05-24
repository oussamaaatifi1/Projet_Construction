<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Modifier Projet</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
</head>
<body>
<div class="container mx-auto px-4">
    <h2 class="text-2xl font-semibold my-4">Modifier Projet</h2>
    <div class="bg-white p-4 rounded-lg shadow-md">
        <form action="projets" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="${projet.id}">

            <div class="mb-4">
                <label for="nom" class="block text-gray-700">Nom:</label>
                <input type="text" id="nom" name="nom" value="${projet.nom}" class="w-full border-gray-300 rounded-lg shadow-sm" required>
            </div>

            <div class="mb-4">
                <label for="description" class="block text-gray-700">Description:</label>
                <textarea id="description" name="description" class="w-full border-gray-300 rounded-lg shadow-sm" required>${projet.description}</textarea>
            </div>

            <div class="mb-4">
                <label for="dateDebut" class="block text-gray-700">Date de Début:</label>
                <input type="date" id="dateDebut" name="dateDebut" value="${projet.dateDebut != null ? projet.dateDebut : ''}" class="w-full border-gray-300 rounded-lg shadow-sm" required>
            </div>

            <div class="mb-4">
                <label for="dateFin" class="block text-gray-700">Date de Fin:</label>
                <input type="date" id="dateFin" name="dateFin" value="${projet.dateFin != null ? projet.dateFin : ''}" class="w-full border-gray-300 rounded-lg shadow-sm" required>
            </div>

            <div class="mb-4">
                <label for="budget" class="block text-gray-700">Budget:</label>
                <input type="number" step="0.01" id="budget" name="budget" value="${projet.budget}" class="w-full border-gray-300 rounded-lg shadow-sm" required>
            </div>

            <button type="submit" class="bg-blue-500 text-white py-2 px-4 rounded hover:bg-blue-600">Modifier</button>
            <a href="projets" class="bg-gray-300 text-gray-700 py-2 px-4 rounded ml-2 hover:bg-gray-400">Annuler</a>
        </form>
    </div>
</div>
</body>
</html>
