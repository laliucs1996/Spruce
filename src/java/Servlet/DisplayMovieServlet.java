/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Entity.CriticMovieReviewRating;
import Entity.Genre;
import Entity.Movie;
import Entity.MovieCast;
import Entity.MovieCrew;
import Entity.ProductionCompany;
import Entity.Trailers;
import Manager.CriticMovieReviewRatingFacade;
import Manager.MovieCastFacade;
import Manager.MovieCrewFacade;
import Manager.MovieFacade;
import Manager.PeopleMovieRatingFacade;
import Manager.TrailersFacade;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Stanl
 */
public class DisplayMovieServlet extends HttpServlet {
    
    @EJB
    private MovieFacade mf;
    
    @EJB
    private MovieCastFacade mcf;
    
    @EJB
    private MovieCrewFacade mcrf;
    
    @EJB
    private PeopleMovieRatingFacade pmrf;
    
    @EJB
    private TrailersFacade tf;
    
    @EJB
    private CriticMovieReviewRatingFacade cmrf;

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
            out.println("<title>Servlet DisplayMovieServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DisplayMovieServlet at " + request.getContextPath() + "</h1>");
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
        long movieID;
        if(request.getParameter("movie") != null)
            movieID = Integer.parseInt(request.getParameter("movie"));
        else
            movieID = (long)request.getAttribute("movieID");
        Movie movie = mf.getMovie(movieID);
        request.setAttribute("movie", movie);
        ProductionCompany[] pc = new Gson().fromJson(movie.getProductionCompanies(), ProductionCompany[].class);
        request.setAttribute("pc", pc);
        List<MovieCast> mcast = new ArrayList<MovieCast>();
        mcast = mcf.getMovieCastByMovieId(Integer.parseInt(request.getParameter("movie")));
        request.setAttribute("mcast", mcast);
        Genre[] genres = new Gson().fromJson(movie.getGenres(), Genre[].class);
        request.setAttribute("genres", genres);
        List<MovieCrew> mcrew = new ArrayList<MovieCrew>();
        mcrew = mcrf.getMovieCrewByMovieId(Integer.parseInt(request.getParameter("movie")));
        request.setAttribute("mcrew", mcrew);
        List<MovieCrew> mdirectors = new ArrayList<MovieCrew>();
        mdirectors = mcrf.getMovieDirectors(Integer.parseInt(request.getParameter("movie")));
        request.setAttribute("mdirectors", mdirectors);
        List<MovieCrew> mwriters = new ArrayList<MovieCrew>();
        mwriters = mcrf.getMovieWriters(Integer.parseInt(request.getParameter("movie")));
        request.setAttribute("mwriters", mwriters);
        Double averageRating = pmrf.getAverageRating((int)movieID);
        if(averageRating != null)
            request.setAttribute("averageRating", averageRating);
        Trailers trailer = tf.getTrailer((int)movieID);
        request.setAttribute("trailer", trailer);
        List<CriticMovieReviewRating> criticReviews = cmrf.getCriticReviewsByMovieId((int)movieID);
        request.setAttribute("criticReviews", criticReviews);
        List<Object[]> userReviews = mf.getUserReviewsByMovieId((int)movieID);
        request.setAttribute("userReviews", userReviews);
        
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/movie.jsp");
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
        long movieID;
        if(request.getParameter("movie") != null)
            movieID = Integer.parseInt(request.getParameter("movie"));
        else
            movieID = (int)request.getAttribute("movieID");
        Movie movie = mf.getMovie(movieID);
        request.setAttribute("movie", movie);
        ProductionCompany[] pc = new Gson().fromJson(movie.getProductionCompanies(), ProductionCompany[].class);
        request.setAttribute("pc", pc);
        List<MovieCast> mcast = new ArrayList<MovieCast>();
        mcast = mcf.getMovieCastByMovieId((int)movieID);
        request.setAttribute("mcast", mcast);
        Genre[] genres = new Gson().fromJson(movie.getGenres(), Genre[].class);
        request.setAttribute("genres", genres);
        List<MovieCrew> mcrew = new ArrayList<MovieCrew>();
        mcrew = mcrf.getMovieCrewByMovieId((int)movieID);
        request.setAttribute("mcrew", mcrew);
        List<MovieCrew> mdirectors = new ArrayList<MovieCrew>();
        mdirectors = mcrf.getMovieDirectors((int)movieID);
        request.setAttribute("mdirectors", mdirectors);
        List<MovieCrew> mwriters = new ArrayList<MovieCrew>();
        mwriters = mcrf.getMovieWriters((int)movieID);
        request.setAttribute("mwriters", mwriters);
        Double averageRating = pmrf.getAverageRating((int)movieID);
        if(averageRating != null)
            request.setAttribute("averageRating", averageRating);
        Trailers trailer = tf.getTrailer((int)movieID);
        request.setAttribute("trailer", trailer);
        List<CriticMovieReviewRating> criticReviews = cmrf.getCriticReviewsByMovieId((int)movieID);
        request.setAttribute("criticReviews", criticReviews);
        List<Object[]> userReviews = mf.getUserReviewsByMovieId((int)movieID);
        request.setAttribute("userReviews", userReviews);
        
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/movie.jsp");
        dispatcher.forward(request,response);
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
