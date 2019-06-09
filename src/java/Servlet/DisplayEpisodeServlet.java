/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Entity.TVEpisode;
import Entity.TVEpisodePK;
import Entity.Tv;
import Manager.TVEpisodeFacade;
import Manager.TvFacade;
import java.io.IOException;
import java.io.PrintWriter;
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
public class DisplayEpisodeServlet extends HttpServlet {
    
    @EJB
    private TVEpisodeFacade tvef;
    
    @EJB 
    private TvFacade tvf;

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
            out.println("<title>Servlet DisplayEpisodeServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DisplayEpisodeServlet at " + request.getContextPath() + "</h1>");
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
        int episodeNo = Integer.parseInt(request.getParameter("episodeNo"));
        int seasonID = Integer.parseInt(request.getParameter("seasonID"));
        int televisionID = Integer.parseInt(request.getParameter("televisionID"));
        String genres = request.getParameter("genres");
        String networks = request.getParameter("networks");
        TVEpisodePK tvePK = new TVEpisodePK(episodeNo, seasonID, televisionID);
        TVEpisode ep = tvef.getTVEpisode(tvePK);
        request.setAttribute("ep", ep);
        request.setAttribute("genres", genres);
        request.setAttribute("networks", networks);
        Tv tv = tvf.getTv(televisionID);
        request.setAttribute("tv", tv);
        List<TVEpisode> episodes = tvef.getTVEpisodes(televisionID, seasonID);
        request.setAttribute("episodes", episodes);
        
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/episodes.jsp");
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
