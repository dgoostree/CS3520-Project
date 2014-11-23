/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CS3520.main.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Darren
 */
public class InitializeParameters extends HttpServlet {

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
            
        HttpSession sess = request.getSession();
        
        
        //
        // Everything here will eventually be replaced with database queries for the information
        String[] productNames = {"Monitors", "Hard-drives", "Cases", "Memory"};
        sess.setAttribute("productNames", productNames);
        
        String[] productValues = {"mon", "harddrive", "case", "memory"};
        sess.setAttribute("productValues", productValues);
        
        String[] parameterLabel = { "Size", "Capacity", "Color", "Capacity"};
        sess.setAttribute("parameterLabel", parameterLabel);
        
        String[] icons = {"/images/monIcon.jpg", "/images/hdIcon.jpg", "/images/caseIcon.jpg", "/images/memIcon.jpg"};
        sess.setAttribute("icons", icons);
        
        
        String[][] parameterNames = new String[][]{ {"17 inch", "21 inch", "24 inch", "27 inch"},
                {"500GB", "1TB", "2TB", "3TB"},
                {"White", "Black", "Gunmetal", "Red"},
                {"4GB", "8GB", "16GB", "32GB"}};
        sess.setAttribute("parameterNames", parameterNames);
        
        String[][] parameterValues = new String[][] {
            {"17", "21", "24", "27"},
            {"500", "1", "2", "3"},
            {"White", "Black", "Gunmetal", "Red"},
            {"4","8","16","32"}
        };
        sess.setAttribute("parameterValues", parameterValues);
        
        
        
        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);        
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
        processRequest(request, response);
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
