/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CS3520.main.servlet;

import CS3520.main.util.CartUtil;
import CS3520.main.util.DBUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Darren
 */
public class UpdateCart extends HttpServlet {

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

        String username = (String) request.getSession().getAttribute("userName"); //get username
        String[] quans = request.getParameterValues("cartItemQuantity");
        String[] itemNos = request.getParameterValues("cartItemNumber");

        ArrayList<String> toBeDeleted = new ArrayList<>();
        ArrayList<String> updatedProdNo = new ArrayList();
        ArrayList<String> updatedQuantities = new ArrayList<>();
        
        for (int i = 0; i < quans.length; i++) {
            if (quans[i].equals("") || (Integer.valueOf(quans[i]) < 1)) {//if blank or negative
                toBeDeleted.add(itemNos[i]);                            //add to the list of those pending removal
            }
            else{                           //otherwise we add it to the lists pending update
                updatedProdNo.add(itemNos[i]);
                updatedQuantities.add(quans[i]);
            }
        }
        if (toBeDeleted.size() > 0) {
            DBUtil.removeItemsFromCart(username, toBeDeleted);//remove items if any are pending delete
        }
        
        if (updatedProdNo.size() > 0){
            DBUtil.updateCartContents(username, updatedProdNo, updatedQuantities);
        }

        CartUtil.populateCartContents(request, response);
        request.getSession().setAttribute("cartCount", DBUtil.getNumberOfProductsInCart(username));
        getServletContext().getRequestDispatcher("/view_cart.jsp").forward(request, response);

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
