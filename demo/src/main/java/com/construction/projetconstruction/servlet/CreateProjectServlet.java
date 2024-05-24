package com.construction.projetconstruction.servlet;

import com.construction.projetconstruction.Dao.ProjetDao;
import com.construction.projetconstruction.model.Projet;
import com.construction.projetconstruction.util.DateUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet("/projets")
public class CreateProjectServlet extends HttpServlet {
    private ProjetDao projetDao;

    public void init() {
        projetDao = new ProjetDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "new":
                showNewForm(request, response);
                break;
            case "insert":
                insertProjet(request, response);
                break;
            case "delete":
                deleteProjet(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "update":
                updateProjet(request, response);
                break;
            default:
                listProjet(request, response);
                break;
        }
    }

    private void listProjet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Projet> projets = projetDao.getAllProjets();
        request.setAttribute("projets", projets);
        request.getRequestDispatcher("listProjets.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("createProjet.jsp").forward(request, response);
    }

    private void insertProjet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nom = request.getParameter("nom");
        String description = request.getParameter("description");
        Date dateDebut = DateUtil.convertStringToSqlDate(request.getParameter("dateDebut"));
        Date dateFin = DateUtil.convertStringToSqlDate(request.getParameter("dateFin"));
        double budget = Double.parseDouble(request.getParameter("budget"));

        Projet projet = new Projet();
        projet.setNom(nom);
        projet.setDescription(description);
        projet.setDateDebut(dateDebut);
        projet.setDateFin(dateFin);
        projet.setBudget(budget);

        projetDao.createProjet(projet);
        response.sendRedirect("projets?action=list");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Projet existingProjet = projetDao.getProjetById(id);
        request.setAttribute("projet", existingProjet);
        request.getRequestDispatcher("editProjet.jsp").forward(request, response);
    }

    private void updateProjet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nom = request.getParameter("nom");
        String description = request.getParameter("description");
        Date dateDebut = DateUtil.convertStringToSqlDate(request.getParameter("dateDebut"));
        Date dateFin = DateUtil.convertStringToSqlDate(request.getParameter("dateFin"));
        double budget = Double.parseDouble(request.getParameter("budget"));


        Projet projet = new Projet();
        projet.setId_projet(id);
        projet.setNom(nom);
        projet.setDescription(description);
        projet.setDateDebut(dateDebut);
        projet.setDateFin(dateFin);
        projet.setBudget(budget);

        projetDao.updateProjet(projet);
        response.sendRedirect("projets?action=list");
    }

    private void deleteProjet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        projetDao.deleteProjet(id);
        response.sendRedirect("projets?action=list");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
