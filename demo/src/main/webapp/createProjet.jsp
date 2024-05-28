<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Créer Projet</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <style>
        .error-message {
            color: red;
            font-size: 0.875rem;
            margin-top: 0.25rem;
        }
    </style>
</head>
<body>
<div class="container mx-auto mt-5 px-4">
    <div class="flex justify-center">
        <div class="w-full md:w-2/3 lg:w-1/2">
            <div class="bg-white shadow-md rounded-lg">
                <div class="bg-blue-500 text-white py-4 px-6 rounded-t-lg">
                    <h2 class="text-2xl">Créer Projet</h2>
                </div>
                <div class="p-6">
                    <form action="projets" method="post" id="TacheForm">
                        <input type="hidden" name="action" value="insert">

                        <div class="mb-4">
                            <label for="nom" class="block text-gray-700">Nom:</label>
                            <input type="text" id="nom" name="nom" class="w-full px-3 py-2 border rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-400" required>
                            <span id="nomError" class="error-message"></span>
                        </div>

                        <div class="mb-4">
                            <label for="description" class="block text-gray-700">Description:</label>
                            <textarea id="description" name="description" class="w-full px-3 py-2 border rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-400" required></textarea>
                            <span id="descriptionError" class="error-message"></span>
                        </div>

                        <div class="mb-4">
                            <label for="dateDebut" class="block text-gray-700">Date de Début:</label>
                            <input type="date" id="dateDebut" name="dateDebut" class="w-full px-3 py-2 border rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-400" required>
                            <span id="dateDebutError" class="error-message"></span>
                        </div>

                        <div class="mb-4">
                            <label for="dateFin" class="block text-gray-700">Date de Fin:</label>
                            <input type="date" id="dateFin" name="dateFin" class="w-full px-3 py-2 border rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-400" required>
                            <span id="dateFinError" class="error-message"></span>
                        </div>

                        <div class="mb-4">
                            <label for="budget" class="block text-gray-700">Budget:</label>
                            <input type="number" step="0.01" id="budget" name="budget" class="w-full px-3 py-2 border rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-400" required>
                            <span id="budgetError" class="error-message"></span>
                        </div>

                        <button type="submit" class="w-full bg-blue-500 text-white py-2 rounded-lg hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-400">Créer</button>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    document.getElementById('TacheForm').addEventListener('submit', function(event) {
        const nom = document.getElementById('nom').value;
        const description = document.getElementById('description').value;
        const dateDebut = document.getElementById('dateDebut').value;
        const dateFin = document.getElementById('dateFin').value;
        const budget = document.getElementById('budget').value;

        let isValid = true;

        if (nom.trim() === '') {
            isValid = false;
            document.getElementById('nomError').textContent = 'Le nom est requis.';
        } else {
            document.getElementById('nomError').textContent = '';
        }

        if (description.trim() === '') {
            isValid = false;
            document.getElementById('descriptionError').textContent = 'La description est requise.';
        } else {
            document.getElementById('descriptionError').textContent = '';
        }

        if (dateDebut === '') {
            isValid = false;
            document.getElementById('dateDebutError').textContent = 'La date de début est requise.';
        } else {
            document.getElementById('dateDebutError').textContent = '';
        }

        if (dateFin === '') {
            isValid = false;
            document.getElementById('dateFinError').textContent = 'La date de fin est requise.';
        } else {
            document.getElementById('dateFinError').textContent = '';
        }

        if (budget.trim() === '') {
            isValid = false;
            document.getElementById('budgetError').textContent = 'Le budget est requis.';
        } else if (isNaN(budget)) {
            isValid = false;
            document.getElementById('budgetError').textContent = 'Le budget doit être un nombre.';
        } else {
            document.getElementById('budgetError').textContent = '';
        }

        if (!isValid) {
            event.preventDefault();
        }
    });
</script>
</body>
</html>
