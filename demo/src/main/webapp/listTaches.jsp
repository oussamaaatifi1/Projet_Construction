<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.construction.projetconstruction.model.Projet" %>
<%@ page import="com.construction.projetconstruction.model.Tache" %>
<%@ page import="com.construction.projetconstruction.Dao.ProjetDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.construction.projetconstruction.Dao.TacheDao" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Liste des Projets</title>
    <link rel="stylesheet" href="CSS/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<%
    String projectIdParam = request.getParameter("id_projet");
    int projectId = 0;
    if (projectIdParam != null && !projectIdParam.isEmpty()) {
        projectId = Integer.parseInt(projectIdParam);
    }

    ProjetDao projetDAO = new ProjetDao();
    Projet projet = projetDAO.getProjetById(projectId);  // Correct method to fetch a single project by ID

    TacheDao tacheDAO = new TacheDao();
    List<Tache> listeTaches = new ArrayList<>();
    for (Tache tache : tacheDAO.getAllTaches()) {
        if (tache.getId_projet() == projectId) {
            listeTaches.add(tache);
        }
    }
%>
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
            <span class="text">Gestion des Taches</span>
        </div>
        <div class="container mx-auto px-4">
            <h2 class="text-2xl font-semibold my-4">Liste des Taches</h2>
            <a href="createTache.jsp" class="bg-blue-500 text-white py-2 px-4 rounded inline-block mb-4 hover:bg-blue-600">Créer un nouveau projet</a>
            <table class="min-w-full bg-white border border-gray-300">
                <thead class="bg-blue-600 text-white">
                <tr>
                    <th class="py-2 px-4 border">Description</th>
                    <th class="py-2 px-4 border">Date de Début</th>
                    <th class="py-2 px-4 border">Date de Fin</th>
                    <th class="py-2 px-4 border">Status</th>
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
                    <td class="py-2 px-4 border"><%= tache.getDescription() %></td>
                    <td class="py-2 px-4 border"><%= tache.getDatedebut() %></td>
                    <td class="py-2 px-4 border"><%= tache.getDatefin() %></td>
                    <td class="py-2 px-4 border"><%= tache.getStatus() %></td>
                    <td class="py-2 px-4 border">
                        <a href="projets?action=edit&id=<%= tache.getId() %>" class="text-blue-500 hover:underline"><i class="fa-solid fa-pen"></i></a> |
                        <a href="projets?action=delete&id=<%= tache.getId() %>" class="text-red-500 hover:underline" onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce projet ?');"><i class="fa-solid fa-trash"></i></a>
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
    </section>
</div>
<script src="js/jss.js"></script>

</body>
</html>
