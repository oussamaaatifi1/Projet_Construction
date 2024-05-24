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
import java.util.List;

@WebServlet("/taches")
public class CreateTacheServlet extends HttpServlet {
    private TacheDao tacheDao;

    public void init() {
        tacheDao = new TacheDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "new":
                showNewForm(request, response);
                break;
            case "insert":
                insertTache(request, response);
                break;
            case "delete":
                deleteTache(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "update":
                updateTache(request, response);
                break;
            default:
                listTache(request, response);
                break;
        }
    }

    private void listTache(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Tache> taches = tacheDao.getAllTaches();
        request.setAttribute("taches", taches);
        request.getRequestDispatcher("listTaches.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("createTache.jsp").forward(request, response);
    }

    private void insertTache(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String description = request.getParameter("description");
        Date datedebut = DateUtil.convertStringToSqlDate(request.getParameter("datedebut"));
        Date datefin = DateUtil.convertStringToSqlDate(request.getParameter("datefin"));
        String status = request.getParameter("status");
        int id_projet = Integer.parseInt(request.getParameter("id_projet"));

        Tache tache = new Tache();
        tache.setDescription(description);
        tache.setDatedebut(datedebut);
        tache.setDatefin(datefin);
        tache.setStatus(status);
        tache.setId_projet(id_projet);

        tacheDao.createTache(tache);
        response.sendRedirect("taches?action=list");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_tache = Integer.parseInt(request.getParameter("id_tache"));
        Tache existingTache = tacheDao.getTacheById(id_tache);
        request.setAttribute("tache", existingTache);
        request.getRequestDispatcher("editTache.jsp").forward(request, response);
    }

    private void updateTache(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id_tache = Integer.parseInt(request.getParameter("id_tache"));
        String description = request.getParameter("description");
        Date datedebut = DateUtil.convertStringToSqlDate(request.getParameter("datedebut"));
        Date datefin = DateUtil.convertStringToSqlDate(request.getParameter("datefin"));
        String status = request.getParameter("status");
        int id_projet = Integer.parseInt(request.getParameter("id_projet"));

        Tache tache = new Tache();
        tache.setId(id_tache);
        tache.setDescription(description);
        tache.setDatedebut(datedebut);
        tache.setDatefin(datefin);
        tache.setStatus(status);
        tache.setId_projet(id_projet);

        tacheDao.updateTache(tache);
        response.sendRedirect("taches?action=list");
    }

    private void deleteTache(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id_tache = Integer.parseInt(request.getParameter("id_tache"));
        tacheDao.deleteTache(id_tache);
        response.sendRedirect("taches?action=list");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
