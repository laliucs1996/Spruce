/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Entity.NotInterestedMovieList;
import Entity.NotInterestedTVList;
import Entity.ReportedUsers;
import Entity.User;
import Entity.WantToSeeMovieList;
import Entity.WantToSeeTVList;
import Manager.NotInterestedMovieListFacade;
import Manager.NotInterestedTVListFacade;
import Manager.ReportedUsersFacade;
import Manager.UserFacade;
import Manager.WantToSeeMovieListFacade;
import Manager.WantToSeeTVListFacade;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Larry
 */
@WebServlet(name = "DisplayUserServlet", urlPatterns = {"/DisplayUserServlet"})
public class DisplayUserServlet extends HttpServlet {

    @EJB
    private WantToSeeMovieListFacade wmf;
    
    @EJB
    private WantToSeeTVListFacade wtf;
    
    @EJB
    private NotInterestedMovieListFacade nil;
    
    @EJB
    private NotInterestedTVListFacade ntvl;
    
    @EJB
    private ReportedUsersFacade ru;
    
    @EJB
    private UserFacade uf;
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
            out.println("<title>Servlet DisplayUserServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DisplayUserServlet at " + request.getContextPath() + "</h1>");
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
            throws ServletException, IOException 
    {
        HttpSession session = request.getSession();
        int id  = (int) session.getAttribute("userid");
        List<WantToSeeMovieList> derp = new ArrayList<WantToSeeMovieList>();
        List<WantToSeeTVList> derp1 = new ArrayList<WantToSeeTVList>();
        List<NotInterestedTVList> derp2 = new ArrayList<NotInterestedTVList>();
        List<NotInterestedMovieList> derp3 = new ArrayList<NotInterestedMovieList>();
        List<ReportedUsers> derp4 = new ArrayList<ReportedUsers>();
        derp = wmf.getList(id);
        request.setAttribute("wmf", derp);
        derp1 = wtf.getList(id);
        request.setAttribute("wtf", derp1);
        derp2 = ntvl.getList(id);
        request.setAttribute("ntvl", derp2);
        derp3 = nil.getList(id);
        request.setAttribute("nil", derp3);
        derp4 = ru.getAll();
        request.setAttribute("ru", derp4);
        List<Object[]> userReviews = uf.getUserReviews(id);
        request.setAttribute("ur", userReviews);
        List<Object[]> tvReviews = uf.getUserTVReviews(id);
        request.setAttribute("tr", tvReviews);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/userpageA.jsp");
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
        HttpSession session = request.getSession();
        int id  = (int) session.getAttribute("userid");
        List<WantToSeeMovieList> derp = new ArrayList<WantToSeeMovieList>();
        List<WantToSeeTVList> derp1 = new ArrayList<WantToSeeTVList>();
        List<NotInterestedTVList> derp2 = new ArrayList<NotInterestedTVList>();
        List<NotInterestedMovieList> derp3 = new ArrayList<NotInterestedMovieList>();
        List<ReportedUsers> derp4 = new ArrayList<ReportedUsers>();
        derp = wmf.getList(id);
        request.setAttribute("wmf", derp);
        derp1 = wtf.getList(id);
        request.setAttribute("wtf", derp1);
        derp2 = ntvl.getList(id);
        request.setAttribute("ntvl", derp2);
        derp3 = nil.getList(id);
        request.setAttribute("nil", derp3);
        derp4 = ru.getAll();
        request.setAttribute("ru", derp4);
        List<Object[]> userReviews = uf.getUserReviews(id);
        request.setAttribute("ur", userReviews);
        List<Object[]> tvReviews = uf.getUserTVReviews(id);
        request.setAttribute("tr", tvReviews);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/userpageA.jsp");
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
