/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CS3520.main.servlet;

import CS3520.main.CartItem;
import CS3520.main.util.CartUtil;
import CS3520.main.util.DBUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Darren
 */
public class CompleteCheckout extends HttpServlet {

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
        
        //to inform user of credit card error
        /*if(request.getSession().getAttribute("orderEmptyFields") == null){
            request.getSession().setAttribute("orderEmptyFields", "Complete all fields to continue");
        }
        else {
            request.getSession().removeAttribute("orderEmptyFields");
        } */
        
        //
        // In a live environment this would store the users data and print a more comprehensive order summary
        
        
        //generate random order number
        Random rand = new Random();
        int orderNumber = rand.nextInt(10000) + 1;
        
        String shipTimeStr = (String)request.getSession().getAttribute("shipTime");
        int shipTimeInt = Integer.valueOf(shipTimeStr);
        request.setAttribute("deliveryTimeStart", shipTimeInt);
        shipTimeInt += 3;
        request.setAttribute("deliveryTimeEnd", shipTimeInt);
        request.setAttribute("orderNumber", orderNumber);
        
        //remove the cart items from the data store, cart should now be empty
        ArrayList<CartItem> purchasedItems = (ArrayList<CartItem>)request.getSession().getAttribute("cartContents");
        String user = (String)request.getSession().getAttribute("userName");
        DBUtil.addToHistory(orderNumber, user, purchasedItems);
        DBUtil.emptyUserCart(user);
        CartUtil.populateCartContents(request, response);
        request.getSession().setAttribute("cartCount", DBUtil.getNumberOfProductsInCart(user));
        getServletContext().getRequestDispatcher("/orderConfirmation.jsp").forward(request, response);
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
