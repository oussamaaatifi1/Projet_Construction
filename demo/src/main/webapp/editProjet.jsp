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
<div class="container mx-auto mt-5 px-4">
    <div class="flex justify-center">
        <div class="w-full md:w-2/3 lg:w-1/2">
            <div class="bg-white shadow-md rounded-lg">
                <div class="bg-blue-500 text-white py-4 px-6 rounded-t-lg">
                    <h2 class="text-2xl">Modifier Projet</h2>
                </div>
                <div class="p-6">
                    <form action="projets" method="post">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="id" value="${projet.id}">

                        <div class="mb-4">
                            <label for="nom" class="block text-gray-700">Nom:</label>
                            <input type="text" id="nom" name="nom" value="${projet.nom}" class="w-full px-3 py-2 border rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-400" required>
                        </div>

                        <div class="mb-4">
                            <label for="description" class="block text-gray-700">Description:</label>
                            <textarea id="description" name="description" class="w-full px-3 py-2 border rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-400" required>${projet.description}</textarea>
                        </div>

                        <div class="mb-4">
                            <label for="dateDebut" class="block text-gray-700">Date de Début:</label>
                            <input type="date" id="dateDebut" name="dateDebut" value="${projet.dateDebut != null ? projet.dateDebut : ''}" class="w-full px-3 py-2 border rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-400" required>
                        </div>

                        <div class="mb-4">
                            <label for="dateFin" class="block text-gray-700">Date de Fin:</label>
                            <input type="date" id="dateFin" name="dateFin" value="${projet.dateFin != null ? projet.dateFin : ''}" class="w-full px-3 py-2 border rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-400" required>
                        </div>

                        <div class="mb-4">
                            <label for="budget" class="block text-gray-700">Budget:</label>
                            <input type="number" step="0.01" id="budget" name="budget" value="${projet.budget}" class="w-full px-3 py-2 border rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-400" required>
                        </div>

                        <button type="submit" class="w-full bg-blue-500 text-white py-2 rounded-lg hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-400">Modifier</button>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
