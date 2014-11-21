/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CS3520.main.util;

import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Keith
 */
public class DBUtil {
    public static final String username = "root";
    public static final String password = "admin";
    public static final String url = "jdbc:mysql://localhost:3306/web_dev_project";
    
    public static ResultSet getUserAccounts(){
        ResultSet rs = null;
        try{
            ConnectionPool cp = ConnectionPool.getInstance();
            Connection connection = cp.getConnection(url,username,password);
            Statement stmt = connection.createStatement();
            rs=stmt.executeQuery("Select * from user_account");
        }
        catch(Exception e){
            e.printStackTrace();
            System.err.println(e.getMessage());
        }
        return rs;
    }
    
    public static User validateLogin(String uname, String pword){
        ResultSet rs = null;
        User user = null;
        try{
            ConnectionPool cp = ConnectionPool.getInstance();
            Connection connection = cp.getConnection(url, username, password);
            Statement stmt = connection.createStatement();
            rs = stmt.executeQuery("Select * from user_account where username = '" 
                + uname + "' AND password = '" + pword + "'");
            if(rs.next()){//creates user object from database result set and returns the user object
                user = new User();
                user.setUserName(rs.getString("userName"));
                user.setPassword(rs.getString("password"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setEmail(rs.getString("email"));
                user.setBillingAddress(rs.getString("billing_address"));
                user.setMailingAddress(rs.getString("mailing_address"));
                user.setPhone(rs.getString("phone"));
            }
        }
        catch(Exception e){
            e.printStackTrace();
            System.err.println(e.getMessage());
        }
        return user;
    }
}
