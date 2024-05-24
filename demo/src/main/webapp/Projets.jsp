<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title>Projets</title>
    <link rel="stylesheet" href="CSS/style.css">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="styles/sidebar.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
<div class="left">
    <div class="sidebar close">
        <div class="logo-details">
            <span class="logo_name"><img src="media/logo Construction.png" alt=""></span>
        </div>
        <ul class="nav-links">
            <li>
                <a href="#">
                    <i class='bx bx-grid-alt' ></i>
                    <span class="link_name">Dashboard</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class='bx bx-grid-alt' ></i>
                    <span class="link_name">Projet</span>
                </a>
            </li>
            <li>
                <div class="profile-details">
                    <div class="profile-content">
                        <img src="media/uifaces-popular-image.jpg" alt="profileImg">
                    </div>
                    <div class="name-job">
                        <div class="profile_name">Prem Shahi</div>
                        <div class="job">Web Desginer</div>
                    </div>
                    <i class='bx bx-log-out' ></i>
                </div>
            </li>
        </ul>
        <div class="forms">

        </div>
    </div>
    <section class="home-section">
        <div class="home-content">
            <i class='bx bx-menu' ></i>
            <span class="text">Gestion des Projets</span>
        </div>
        <div class="listprojet">
            <section id="tasks" class="mb-8">
                <h2 class="text-xl font-semibold mb-4"></h2>
                <!-- Button to open the popup form -->
                <button onclick="openForm()" class="bg-blue-500 text-white py-2 px-4 rounded inline-block mb-4 hover:bg-blue-600">Créer une nouvelle Projet</button>

                <!-- Popup form for creating a new task -->
                <div id="taskForm" class="hidden fixed z-10 inset-0 overflow-y-auto">
                    <div class="flex items-center justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
                        <div class="fixed inset-0 transition-opacity" aria-hidden="true">
                            <div class="absolute inset-0 bg-gray-500 opacity-75"></div>
                        </div>
                        <span class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">&#8203;</span>
                        <div class="inline-block align-bottom bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full">
                            <div class="bg-white px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
                                <div class="sm:flex sm:items-start">
                                    <div class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left">
                                        <h3 class="text-lg leading-6 font-medium text-gray-900">Create a New Task</h3>
                                        <div class="mt-2">
                                            <%@ include file="createProject.jsp" %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="bg-gray-50 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
                                <button onclick="closeForm()" type="button" class="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-blue-500 text-base font-medium text-white hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 sm:ml-3 sm:w-auto sm:text-sm">Close</button>
                            </div>
                        </div>
                    </div>
                </div>

                <table class="w-full bg-white shadow-md rounded-lg overflow-hidden">
                    <thead class="bg-blue-600 text-white">
                    <tr>
                        <th class="py-2 px-4">Nom</th>
                        <th class="py-2 px-4">Date de Début</th>
                        <th class="py-2 px-4">Date de Fin</th>
                        <th class="py-2 px-4">Description</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- Sample data, replace with dynamic content -->
                    <tr>
                        <td class="py-2 px-4">Task 1</td>
                        <td class="py-2 px-4">2024-01-01</td>
                        <td class="py-2 px-4">2024-02-01</td>
                        <td class="py-2 px-4">
                            <a href="projets" class="text-red-500 hover:underline">Voir</a>
                            <a href="updateTask.jsp?id=0" class="text-blue-500 hover:underline">Mettre à jour</a> |
                            <a href="deleteTask.jsp?id=0" class="text-red-500 hover:underline">Supprimer</a>
                        </td>
                    </tr>

                    </tbody>
                </table>
            </section>
        </div>
    </section>
</div>
<script src="js/jss.js"></script>
</body>
</html>
