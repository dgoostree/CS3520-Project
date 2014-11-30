/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CS3520.main.util;

import CS3520.main.CartItem;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Darren
 */
public abstract class CartUtil {
    public static void populateCartContents(HttpServletRequest request, HttpServletResponse response){
        String currentUser = (String) request.getSession().getAttribute("userName");
        ResultSet rs = DBUtil.getCartContents(currentUser);
        double orderTotal = 0;
        ArrayList<CartItem> cartContents = new ArrayList<CartItem>();

        try {
            if (!rs.next()) { //if the result set is empty
                request.getSession().removeAttribute("cartContents"); //remove any prior versions of users cart
            } else {  //otherwise we're in business
                rs.beforeFirst(); //set the cursor to before first element

                while (rs.next()) {
                    CartItem item = new CartItem();
                    item.setItemNumber(rs.getInt("item_number")); //populate our new item from the db
                    item.setBrand(rs.getString("brand"));
                    item.setParam(rs.getString("param"));
                    item.setType(rs.getString("type"));
                    int quan = rs.getInt("quantity");
                    item.setQuantity(quan);
                    double prc = rs.getDouble("price");
                    prc = quan * prc;
                    orderTotal += prc;
                    item.setPrice(prc);
                    cartContents.add(item); //add to the list
                }
                rs.close();
                request.getSession().setAttribute("orderTotal", orderTotal);  //add list to request object
                request.getSession().setAttribute("cartContents", cartContents);  //add list to request object

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    
}
