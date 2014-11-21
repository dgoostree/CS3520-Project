/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CS3520.main;

import CS3520.main.util.DBUtil;
import CS3520.main.util.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Keith
 */
public class UserValidation {
    static boolean status = false;
    public static boolean isValid(String username, String password, HttpServletRequest request){
       
       User account = DBUtil.validateLogin(username, password);
       if(account!=null){
           status = true;
           request.getSession().setAttribute("user", account);
            boolean loggedIn = true; 
            HttpSession sess = request.getSession();
            sess.setAttribute("loggedIn", loggedIn);
            
            String userName = (String)request.getParameter("userName");
            sess.setAttribute("userName", userName );
       }
        return status;
    }
    public static boolean isNew(String username, HttpServletRequest request){
        return DBUtil.checkUnique(username); 
    }
}
