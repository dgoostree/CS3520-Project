/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CS3520.main.util;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Keith
 */
public class ConnectionPool {
    private static ConnectionPool cp = null;
    private ConnectionPool(){
        
    }
    public static ConnectionPool getInstance(){
        if(ConnectionPool.cp==null){
            cp = new ConnectionPool();
        }
        return ConnectionPool.cp;
    }
    
    public Connection getConnection(String url, String username, String password){
        Connection connection = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection=DriverManager.getConnection(url,username,password);
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return connection;
    }
    
    void closeConnection(Connection connection){
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
