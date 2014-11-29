/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CS3520.main.util;

import CS3520.main.UserValidation;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Keith
 */
public class DBUtil {

    public static final String username = "root";
    public static final String password = "admin";
    public static final String url = "jdbc:mysql://localhost:3306/web_dev_project";

    public static ResultSet getItems(String iT, String par) {
        ResultSet rs = null;
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            Connection connection = cp.getConnection(url, username, password);
            Statement stmt = connection.createStatement();
            rs = stmt.executeQuery("Select * from items where type = '" + iT + "' "
                    + "AND param = '" + par + "'");
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
        }
        return rs;
    }

    public static User validateLogin(String uname, String pword) {
        ResultSet rs = null;
        User user = null;
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            Connection connection = cp.getConnection(url, username, password);
            Statement stmt = connection.createStatement();
            rs = stmt.executeQuery("Select * from user_account where username = '"
                    + uname + "' AND password = '" + pword + "'");
            if (rs.next()) {//creates user object from database result set and returns the user object
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
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
        }
        return user;
    }

    public static boolean checkUnique(String aname) {
        boolean reply = false;
        ResultSet rs = null;
        try {
            ConnectionPool uc = ConnectionPool.getInstance();
            Connection uconnect = uc.getConnection(url, username, password);
            Statement ustate = uconnect.createStatement();
            rs = ustate.executeQuery("Select * from user_account where username = '"
                    + aname + "'");
            if (!rs.next()) {
                reply = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
        }
        return reply;
    }

    public static User createNewAccount(String userName, String pass, String firstName, String lastName, String email, String billingAddress,
            String mailingAddress, String phone) {

        User user = null;
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            Connection connection = cp.getConnection(url, username, password);
            String preparedQuery = "INSERT INTO user_account(username, "
                    + "password, firstname, lastname, email, billing_address, "
                    + "mailing_address, phone)" + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(preparedQuery);
            stmt.setString(1, userName);
            stmt.setString(2, pass);
            stmt.setString(3, firstName);
            stmt.setString(4, lastName);
            stmt.setString(5, email);
            stmt.setString(6, billingAddress);
            stmt.setString(7, mailingAddress);
            stmt.setString(8, phone);
            stmt.executeUpdate();
            //creates user object from database result set and returns the user object
            user = new User();
            user.setUserName(userName);
            user.setPassword(pass);
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setEmail(email);
            user.setBillingAddress(billingAddress);
            user.setMailingAddress(mailingAddress);
            user.setPhone(phone);
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
        }
        return user;
    }

    public static boolean existsAndDelete(String delName, HttpServletRequest request) {
        boolean deleted = false;
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            Connection connection = cp.getConnection(url, username, password);
            String preparedQuery = "DELETE FROM user_account " + "WHERE username = ?";
            PreparedStatement ps = connection.prepareStatement(preparedQuery);
            ps.setString(1, delName);
            int x = ps.executeUpdate();
            if (x == 1) {
                deleted = true;
                request.getSession().removeAttribute("loggedIn");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
        }
        return deleted;
    }

    public static void modifyUser(String un, String pw, String fn, String ln, String em,
            String ba, String ma, String ph, HttpServletRequest request) {

        try {

            ConnectionPool cp = ConnectionPool.getInstance();
            Connection connect = cp.getConnection(url, username, password);
            String preparedSQL = "UPDATE user_account SET password = ?, "
                    + "firstName = ?, lastName = ?, email = ?, billing_address "
                    + "= ?, mailing_address = ?, phone = ? WHERE username = ?";
            PreparedStatement ps = connect.prepareStatement(preparedSQL);
            ps.setString(1, pw);
            ps.setString(2, fn);
            ps.setString(3, ln);
            ps.setString(4, em);
            ps.setString(5, ba);
            ps.setString(6, ma);
            ps.setString(7, ph);
            ps.setString(8, un);

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
        }
    }

    public static int addToCart(String uname, int pid, int num) {

        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            Connection connection = cp.getConnection(url, username, password);
            String preparedQuery = "INSERT INTO cart_item(user_name, product_id, quantity)" + 
                    "VALUES (?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(preparedQuery);
            stmt.setString(1, uname);
            stmt.setInt(2, pid);
            stmt.setInt(3, num);
            return stmt.executeUpdate();
        }
        catch (Exception e){
            e.printStackTrace();
            return -1;
        }
    }
    
    public static int getNumberOfProductsInCart(String uname){
        ResultSet rs = null;
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            Connection connection = cp.getConnection(url, username, password);
            Statement stmt = connection.createStatement();
            rs = stmt.executeQuery("Select * from cart_item where user_name = '" + uname + "'");
            
            rs.last();
            int num = rs.getRow();
            if (num >= 0){
                return num;
            }
            else {
                return 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
            return 0;
        }
    }

}
