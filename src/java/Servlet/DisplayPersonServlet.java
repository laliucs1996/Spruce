/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Entity.Movie;
import Entity.MovieCast;
import Entity.MovieCrew;
import Entity.Person;
import Manager.MovieCastFacade;
import Manager.MovieCrewFacade;
import Manager.PersonFacade;
import Manager.TVCastFacade;
import Manager.TVCrewFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Stanl
 */
public class DisplayPersonServlet extends HttpServlet {
    
    @EJB
    private PersonFacade pf;
    
    @EJB
    private MovieCastFacade mcastf;
    
    @EJB
    private MovieCrewFacade mcrewf;
    
    @EJB
    private TVCastFacade tcastf;
    
    @EJB
    private TVCrewFacade tcrewf;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DisplayPersonServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DisplayPersonServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String peopleID = request.getParameter("peopleID");
        Person p = pf.getPerson((long)Integer.parseInt(peopleID));
        request.setAttribute("person", p);
        List<Object[]> mcast = mcastf.getMovieCastByPeopleId(Integer.parseInt(peopleID));
        List<Object[]> mcrew = mcrewf.getMovieCrewByPeopleId(Integer.parseInt(peopleID));
        request.setAttribute("mcast", mcast);
        request.setAttribute("mcrew", mcrew);
        List<Object[]> tcast = tcastf.getTVCastByPeopleId(Integer.parseInt(peopleID));
        List<Object[]> tcrew = tcrewf.getTVCrewByPeopleId(Integer.parseInt(peopleID));
        request.setAttribute("tcast", tcast);
        request.setAttribute("tcrew", tcrew);
        
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/celebrity.jsp");
        dispatcher.forward(request,response);      
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
