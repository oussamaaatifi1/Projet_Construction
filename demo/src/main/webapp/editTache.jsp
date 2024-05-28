<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Modifier Tache</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
</head>
<body>
<div class="container mx-auto mt-5 px-4">
    <div class="flex justify-center">
        <div class="w-full md:w-2/3 lg:w-1/2">
            <div class="bg-white shadow-md rounded-lg">
                <div class="bg-blue-500 text-white py-4 px-6 rounded-t-lg">
                    <h2 class="text-2xl">Modifier Tache</h2>
                </div>
                <div class="p-6">
                    <form action="taches" method="post">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="id" value="${tache.id_tache}">

                        <div class="mb-4">
                            <label for="status" class="block text-gray-700">Statut:</label>
                            <input type="text" id="status" name="status" value="${tache.status}" class="w-full px-3 py-2 border rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-400">
                        </div>

                        <div class="mb-4">
                            <label for="description" class="block text-gray-700">Description:</label>
                            <textarea id="description" name="description" class="w-full px-3 py-2 border rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-400">${tache.description}</textarea>
                        </div>

                        <div class="mb-4">
                            <label for="dateDebut" class="block text-gray-700">Date de Début:</label>
                            <input type="date" id="dateDebut" name="dateDebut" value="${tache.dateDebut}" class="w-full px-3 py-2 border rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-400">
                        </div>

                        <div class="mb-4">
                            <label for="dateFin" class="block text-gray-700">Date de Fin:</label>
                            <input type="date" id="dateFin" name="dateFin" value="${tache.dateFin}" class="w-full px-3 py-2 border rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-400">
                        </div>

                        <div class="mb-4">
                            <label for="id_projet" class="block text-gray-700">ID Projet:</label>
                            <input type="number" id="id_projet" name="id_projet" value="${tache.id_projet}" class="w-full px-3 py-2 border rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-400">
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
