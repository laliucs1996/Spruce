/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Entity.Movie;
import Entity.Tv;
import Manager.MovieFacade;
import Manager.TvFacade;
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
public class SpecificMoviesServlet extends HttpServlet {
    
    @EJB
    private MovieFacade mf;
    
    @EJB
    private TvFacade tf;

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
            out.println("<title>Servlet SpecificMoviesServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SpecificMoviesServlet at " + request.getContextPath() + "</h1>");
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
        List<Movie> movies = new ArrayList<Movie>();
        int searchChoice = Integer.parseInt(request.getParameter("searchChoice"));
        if(searchChoice == 1) {
            movies = mf.moviesComingSoon();
            request.setAttribute("searchChoice", "Coming Soon");
        }
        else if(searchChoice == 2) {
            List<Object[]> ratings = mf.getAverageMovieRatings();
            request.setAttribute("searchChoice", "Highest Rated");
            request.setAttribute("movies", ratings);
        
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/topbox2.jsp");
            dispatcher.forward(request,response);
        }
        else if(searchChoice == 3) {
            movies = mf.topBoxOfficeMovies();
            request.setAttribute("searchChoice", "Top Box Office");
        }
        else if(searchChoice == 4) {
            movies = mf.newestMovies();
            request.setAttribute("searchChoice", "Opening This Week");
        }
        else if(searchChoice == 5) {
            List<Tv> tvs = new ArrayList<Tv>();
            tvs = tf.topRatedTv();
            request.setAttribute("tvs", tvs);
            request.setAttribute("searchChoice", "Top Rated TV");
        }
        else if(searchChoice == 6) {
            List<Tv> tvs = new ArrayList<Tv>();
            tvs = tf.certifiedFreshTv();
            request.setAttribute("tvs", tvs);
            request.setAttribute("searchChoice", "Certified Fresh TV");
        }
        request.setAttribute("movies", movies);
        
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/topbox.jsp");
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
