/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CS3520.main.servlet;

import CS3520.main.CartItem;
import CS3520.main.util.CartUtil;
import CS3520.main.util.DBUtil;
import CS3520.main.util.ItemListGenerator;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Darren
 */
public class OrderHistoryServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String uname = (String) request.getSession().getAttribute("userName");//get username 
        ResultSet orderNumberRS = DBUtil.getUniqueOrderNumbers(uname); //get unique order numbers for that username
        ResultSet orderContents;
        ArrayList<String> orders = new ArrayList<>();
        ArrayList<ArrayList<CartItem>> orderContent = new ArrayList<>();
        
        
        try {
            while (orderNumberRS.next()) {
                String orderNum = orderNumberRS.getString("order_number");
                orders.add(orderNum); //populate the order number arraylist
                
               orderContent.add(CartUtil.populateHistoryList(DBUtil.getItemsPerOrder(uname, orderNum), request)); //build arraylist for current order
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        request.setAttribute("orderContent", orderContent);
        request.setAttribute("orderNumbers", orders);
        getServletContext().getRequestDispatcher("/orderHistory.jsp").forward(request, response);

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
