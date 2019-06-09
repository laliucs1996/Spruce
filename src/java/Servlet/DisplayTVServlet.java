/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Entity.Genre;
import Entity.Network;
import Entity.TVCast;
import Entity.TVEpisode;
import Entity.TVSeason;
import Entity.Tv;
import Manager.PeopleTVRatingFacade;
import Manager.TVCastFacade;
import Manager.TVEpisodeFacade;
import Manager.TVSeasonFacade;
import Manager.TvFacade;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Stanl
 */
@WebServlet(name = "DisplayTVServlet", urlPatterns = {"/DisplayTVServlet"})
public class DisplayTVServlet extends HttpServlet {
    
    @EJB
    private TvFacade tf;
    
    @EJB
    private TVSeasonFacade tsf;
    
    @EJB
    private TVEpisodeFacade tef;
    
    @EJB
    private PeopleTVRatingFacade ptvrf;
    
    @EJB
    private TVCastFacade tcf;

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
            out.println("<title>Servlet DisplayTVServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DisplayTVServlet at " + request.getContextPath() + "</h1>");
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
        int televisionID = Integer.parseInt(request.getParameter("televisionID"));
        int seasonNo = 1;
        if(request.getParameter("seasonNo") != null)
            seasonNo = Integer.parseInt(request.getParameter("seasonNo"));
        Tv tv = tf.getTv(televisionID);
        request.setAttribute("tv", tv);
        Genre[] genres = new Gson().fromJson(tv.getGenre(), Genre[].class);
        request.setAttribute("genres", genres);
        Network[] networks = new Gson().fromJson(tv.getNetworks(), Network[].class);
        request.setAttribute("networks", networks);
        List<TVSeason> tvSeasons = new ArrayList<TVSeason>();
        tvSeasons = tsf.getTVSeasons(televisionID);
        request.setAttribute("seasons", tvSeasons);
        int seasonId = 0;
        for(int i = 0; i < tvSeasons.size(); i++) {
            if(tvSeasons.get(i).getSeasonNo().intValue() == seasonNo)
                seasonId = tvSeasons.get(i).getTvSeasonID().intValue();
        }
        List<TVEpisode> tvEpisodes = new ArrayList<TVEpisode>();
        tvEpisodes = tef.getTVEpisodes(televisionID, seasonId);
        request.setAttribute("episodes", tvEpisodes);
        Double averageRating = ptvrf.getAverageRating(televisionID);
        if(averageRating != null)
            request.setAttribute("averageRating", averageRating);
        List<Object[]> userReviews = tf.getUserReviews(televisionID);
        request.setAttribute("userReviews", userReviews);
        List<TVCast> tvCast = tcf.getTVCastByTVId(televisionID);
        request.setAttribute("tvCast", tvCast);
        
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/tv.jsp");
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
        int televisionID;
        if(request.getParameter("televisionID") != null)
            televisionID = Integer.parseInt(request.getParameter("televisionID"));
        else
            televisionID = (int)request.getAttribute("tvId");
        int seasonNo = 1;
        if(request.getParameter("seasonNo") != null)
            seasonNo = Integer.parseInt(request.getParameter("seasonNo"));
        Tv tv = tf.getTv(televisionID);
        request.setAttribute("tv", tv);
        Genre[] genres = new Gson().fromJson(tv.getGenre(), Genre[].class);
        request.setAttribute("genres", genres);
        Network[] networks = new Gson().fromJson(tv.getNetworks(), Network[].class);
        request.setAttribute("networks", networks);
        List<TVSeason> tvSeasons = new ArrayList<TVSeason>();
        tvSeasons = tsf.getTVSeasons(televisionID);
        request.setAttribute("seasons", tvSeasons);
        int seasonId = 0;
        for(int i = 0; i < tvSeasons.size(); i++) {
            if(tvSeasons.get(i).getSeasonNo().intValue() == seasonNo)
                seasonId = tvSeasons.get(i).getTvSeasonID().intValue();
        }
        List<TVEpisode> tvEpisodes = new ArrayList<TVEpisode>();
        tvEpisodes = tef.getTVEpisodes(televisionID, seasonId);
        request.setAttribute("episodes", tvEpisodes);
        Double averageRating = ptvrf.getAverageRating(televisionID);
        if(averageRating != null)
            request.setAttribute("averageRating", averageRating);
        List<Object[]> userReviews = tf.getUserReviews(televisionID);
        request.setAttribute("userReviews", userReviews);
        List<TVCast> tvCast = tcf.getTVCastByTVId(televisionID);
        request.setAttribute("tvCast", tvCast);
        
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/tv.jsp");
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
