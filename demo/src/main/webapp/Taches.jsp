<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.construction.projetconstruction.model.Tache" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<%
    List<Tache> listTache = (List<Tache>) request.getAttribute("model");
    for (Tache tache : listTache) {
%>
<div class="left">
    <div class="sidebar close">
        <div class="logo-details">
            <span class="logo_name"><img src="media/logo Construction.png" alt=""></span>
        </div>
        <ul class="nav-links">
            <li>
                <a href="#">
                    <i class='bx bx-grid-alt'></i>
                    <span class="link_name">Dashboard</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class='bx bx-grid-alt'></i>
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
                    <i class='bx bx-log-out'></i>
                </div>
            </li>
        </ul>
    </div>
    <section class="home-section">
        <div class="home-content">
            <i class='bx bx-menu'></i>
            <span class="text">Gestion des Taches</span>
        </div>

        <!-- Cards for displaying project information -->
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4 mt-4">
            <!-- Example card for a project -->
            <div class="bg-white border border-gray-200 rounded-lg shadow-sm flex justify-center items-center">
                <div class="p-4 text-center">
                    <h2 class="text-lg font-semibold mb-2"><%= tache.getDescription()%></h2>
                    <p class="text-sm text-gray-500 mb-2"><%= tache.getDatedebut()%></p>
                    <p class="text-sm text-gray-500 mb-2"><%= tache.getDatefin()%></p>
                    <p class="text-sm text-gray-500 mb-2"><%= tache.getStatus()%></p>
                </div>
            </div>
            <!-- End of example card -->

            <!-- You can repeat the above card block for each project -->
        </div>
-

        <!-- You can repeat the above card block for each project -->
        </div>
    </section>
</div>
<script>
    function openForm() {
        document.getElementById("taskForm").style.display = "block";
    }

    function closeForm() {
        document.getElementById("taskForm").style.display = "none";
    }
</script>
<script src="js/jss.js"></script>
</body>

</html>