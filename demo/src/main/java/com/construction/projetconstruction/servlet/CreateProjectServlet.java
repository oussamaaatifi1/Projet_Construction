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

public class CreateProjectServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nom = request.getParameter("nom");
        String dateDebutStr = request.getParameter("dateDebut");
        String dateFinStr = request.getParameter("dateFin");
        String Description = request.getParameter("description");

        Date dateDebut = DateUtil.convertStringToSqlDate(dateDebutStr);
        Date dateFin = DateUtil.convertStringToSqlDate(dateFinStr);
        Projet projet = new Projet(nom, dateDebut, dateFin, Description);

        ProjetDao projetDao = new ProjetDao();
        boolean isCreated = projetDao.create(projet);

        if (isCreated) {
            response.sendRedirect("success.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
