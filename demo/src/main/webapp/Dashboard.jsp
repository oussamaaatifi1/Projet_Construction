<%@ page import="com.construction.projetconstruction.model.Projet" %>
<%@ page import="java.util.List" %>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<div class="left">
    <div class="sidebar close">
        <div class="logo-details">
            <span class="logo_name"><img src="media/logo Construction.png" alt=""></span>
        </div>
        <ul class="nav-links">
            <li>
                <a href="Dashboard.jsp">
                    <i class='bx bx-grid-alt' ></i>
                    <span class="link_name">Dashboard</span>
                </a>
            </li>
            <li>
                <a href="projets">
                    <i class="fa-solid fa-diagram-project"></i>
                    <span class="link_name">Projet</span>
                </a>
            </li>
            <li>
                <a href="listTaches.jsp">
                    <i class="fa-solid fa-list-check"></i>
                    <span class="link_name">Taches</span>
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
            <span class="text">Dashboard</span>
        </div>
        <!-- Task cards section -->
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4 mt-8">
            <% List<Projet> projets = (List<Projet>) request.getAttribute("projets");
                if (projets != null && !projets.isEmpty()) {
                    for (Projet projet : projets) { %>
            <!-- Task card -->
            <div class="bg-white border border-gray-200 rounded-lg shadow-sm">
                <div class="p-4">
                    <h2 class="text-lg font-semibold mb-2"><%= projet.getDescription() %></h2>
                    <p class="text-sm text-gray-500 mb-2">Start Date: <%= projet.getDateDebut() %></p>
                    <p class="text-sm text-gray-500 mb-2">End Date: <%= projet.getDateFin() %></p>
                    <p class="text-sm text-gray-500 mb-2">Status: <%= projet.getNom() %></p>
                </div>
            </div>
            <!-- End of task card -->
            <% }
            } %>
        </div>
    </section>
</div>
<script src="js/jss.js"></script>
</body>
</html>
