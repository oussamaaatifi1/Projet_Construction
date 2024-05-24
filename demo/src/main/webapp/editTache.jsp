<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Modifier Tache</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
</head>
<body>
<div class="container mx-auto px-4">
    <h2 class="text-2xl font-semibold my-4">Modifier Tache</h2>
    <div class="bg-white p-4 rounded-lg shadow-md">
        <form action="taches" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="${tache.id_tache}">

            <div class="mb-4">
                <label for="status" class="block text-gray-700">Statut:</label>
                <input type="text" id="status" name="status" value="${tache.status}" class="w-full border-gray-300 rounded-lg shadow-sm">
            </div>

            <div class="mb-4">
                <label for="description" class="block text-gray-700">Description:</label>
                <textarea id="description" name="description" class="w-full border-gray-300 rounded-lg shadow-sm">${tache.description}</textarea>
            </div>

            <div class="mb-4">
                <label for="dateDebut" class="block text-gray-700">Date de Début:</label>
                <input type="date" id="dateDebut" name="dateDebut" value="${tache.dateDebut}" class="w-full border-gray-300 rounded-lg shadow-sm">
            </div>

            <div class="mb-4">
                <label for="dateFin" class="block text-gray-700">Date de Fin:</label>
                <input type="date" id="dateFin" name="dateFin" value="${tache.dateFin}" class="w-full border-gray-300 rounded-lg shadow-sm">
            </div>

            <div class="mb-4">
                <label for="id_projet" class="block text-gray-700">ID Projet:</label>
                <input type="number" id="id_projet" name="id_projet" value="${tache.id_projet}" class="w-full border-gray-300 rounded-lg shadow-sm">
            </div>

            <button type="submit" class="bg-blue-500 text-white py-2 px-4 rounded hover:bg-blue-600">Modifier</button>
        </form>
    </div>
</div>
</body>
</html>
