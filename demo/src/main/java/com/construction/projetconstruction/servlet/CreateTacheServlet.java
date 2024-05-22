package com.construction.projetconstruction.servlet;

import com.construction.projetconstruction.Dao.TacheDao;
import com.construction.projetconstruction.model.Tache;
import com.construction.projetconstruction.util.DateUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.sql.Date;

public class CreateTacheServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer les paramètres du formulaire
        String status = request.getParameter("status");
        String dateDebutStr = request.getParameter("dateDebut");
        String dateFinStr = request.getParameter("dateFin");
        String description = request.getParameter("description");

        Date dateDebut = DateUtil.convertStringToSqlDate(dateDebutStr);
        Date dateFin = DateUtil.convertStringToSqlDate(dateFinStr);

        Tache tache = new Tache(status, dateDebut, dateFin, description);

        // Utiliser TacheDao pour créer la tâche
        TacheDao tacheDao = new TacheDao();
        boolean isCreated = tacheDao.create(tache);

        if (isCreated) {
            // Rediriger vers une page de succès
            response.sendRedirect("success.jsp");
        } else {
            // Rediriger vers une page d'erreur
            response.sendRedirect("error.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
