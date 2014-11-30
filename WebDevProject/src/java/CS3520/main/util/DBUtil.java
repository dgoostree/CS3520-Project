/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CS3520.main.util;

import CS3520.main.CartItem;
import CS3520.main.UserValidation;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;
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
            //stmt.close();
            //connection.close();
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
            //rs.close();
            //connection.close();
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
            //ustate.close();
            //uconnect.close();
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

            //stmt.close();
            //connection.close();
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
            ps.close();
            connection.close();
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
            ps.close();
            connect.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
        }
    }

    public static int addToCart(String uname, int pid, int num) {

        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            Connection connection = cp.getConnection(url, username, password);
            String preparedQuery = "INSERT INTO cart_item(user_name, product_id, quantity)"
                    + "VALUES (?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(preparedQuery);
            stmt.setString(1, uname);
            stmt.setInt(2, pid);
            stmt.setInt(3, num);
            int result = stmt.executeUpdate();
            stmt.close();
            connection.close();
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }

    }

    public static int getNumberOfProductsInCart(String uname) {
        ResultSet rs = null;
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            Connection connection = cp.getConnection(url, username, password);
            Statement stmt = connection.createStatement();
            rs = stmt.executeQuery("Select * from cart_item where user_name = '" + uname + "'");

            rs.last();
            int num = rs.getRow();

            stmt.close();
            connection.close();

            if (num >= 0) {
                return num;
            } else {
                return 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
            return 0;
        }
    }

    public static ResultSet getCartContents(String uname) {
        ResultSet rs = null;
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            Connection connection = cp.getConnection(url, username, password);
            Statement stmt = connection.createStatement();
            rs = stmt.executeQuery("SELECT item_number, brand, param, type, quantity, price FROM items, cart_item "
                    + "WHERE user_name = '" + uname + "' AND item_number=product_id");
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
        }
        return rs;
    }

    public static void removeItemsFromCart(String uname, ArrayList<String> products) {
        int count = products.size();

        try {

            ConnectionPool cp = ConnectionPool.getInstance();
            Connection connection = cp.getConnection(url, username, password);
            String query;
            PreparedStatement ps = null;

            for (int i = 0; i < count; i++) {
                query = "DELETE FROM cart_item " + "WHERE user_name = ? AND product_id = ?";
                ps = connection.prepareStatement(query);
                ps.setString(1, uname);
                ps.setInt(2, Integer.valueOf(products.get(i)));
                ps.executeUpdate();
            }

            ps.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void updateCartContents(String uname, ArrayList<String> prodNos, ArrayList<String> quantities) {
        int count = prodNos.size();

        try {

            ConnectionPool cp = ConnectionPool.getInstance();
            Connection connection = cp.getConnection(url, username, password);
            String query;
            PreparedStatement ps = null;

            for (int i = 0; i < count; i++) {
                query = "UPDATE cart_item SET quantity = ? WHERE user_name = ? AND product_id = ?";
                ps = connection.prepareStatement(query);
                ps.setInt(1, Integer.valueOf(quantities.get(i)));
                ps.setString(2, uname);
                ps.setInt(3, Integer.valueOf(prodNos.get(i)));
                ps.executeUpdate();
            }

            ps.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();

        }
    }

    public static int addToHistory(int orderNumber, String uname, ArrayList<CartItem> purchasedItems) {

        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            Connection connection = cp.getConnection(url, username, password);
            String preparedQuery;
            PreparedStatement stmt;
            int result = 0;
            int size = purchasedItems.size();
            for (int i = 0; i < size; i++) {
                preparedQuery = "INSERT INTO history_item(order_number, user_id, product_number, quantity)"
                        + "VALUES (?, ?, ?, ?)";
                stmt = connection.prepareStatement(preparedQuery);

                CartItem current = purchasedItems.get(i);

                stmt.setInt(1, orderNumber);
                stmt.setString(2, uname);
                stmt.setInt(3, current.getItemNumber());
                stmt.setInt(4, current.getQuantity());
                result = stmt.executeUpdate();
            }
            //stmt.close();
            connection.close();
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }

    }

    public static void emptyUserCart(String uname) {
        ConnectionPool cp = ConnectionPool.getInstance();
        Connection connection = cp.getConnection(url, username, password);

        try {
            String query = "DELETE FROM cart_item WHERE user_name = '" + uname + "'";
            Statement stmt = connection.createStatement();
            stmt.executeUpdate(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
