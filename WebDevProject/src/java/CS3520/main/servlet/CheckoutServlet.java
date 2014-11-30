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
public class CheckoutServlet extends HttpServlet {

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
        if(request.getParameter("shippingMethod") == null){
            getServletContext().getRequestDispatcher("/shipping.jsp").forward(request, response);
        }
        else {
            HttpSession sess = request.getSession();
            Double subTot = (Double)sess.getAttribute("orderTotal");// get the cart's subtotal from session
            
            //break up the parameter for shipping details
            String shipParams = (String)request.getParameter("shippingMethod");
            String[] shippingDetails = shipParams.split(",");
            String shipCost = shippingDetails[0];
            String shipDays = shippingDetails[1];
            
            Double shipCostD = Double.valueOf(shipCost);
            shipCostD = Math.round(shipCostD * 100)/100.0;
            
            String finalTotal = String.format("%.2f", (shipCostD + subTot));
            
            request.getSession().setAttribute("shipCost", shipCost);
            request.getSession().setAttribute("finalTotal", finalTotal);
            request.getSession().setAttribute("shipTime", shipDays);
            
            getServletContext().getRequestDispatcher("/payment.jsp").forward(request, response);
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
