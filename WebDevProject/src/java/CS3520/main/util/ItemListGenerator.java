/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



package CS3520.main.util;
import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;


/**
 *
 * @author keitheveritt
 */
public class ItemListGenerator implements Serializable{
    
    public static ArrayList getItemList(String iT, String par) throws SQLException{
        ArrayList list = new ArrayList();
        ResultSet rs = DBUtil.getItems(iT, par);
        while(rs.next()){
            Item item = new Item();
            item.setBrand(rs.getString("brand"));
            item.setParam(rs.getString("param"));
            item.setImage(rs.getString("image"));
            item.setItemType(rs.getString("type"));
            item.setItem_number(rs.getInt("item_number"));
            item.setPrice(rs.getDouble("price"));
            list.add(item);
        }
        
        return list;
    }
    
    public static int getOrderHistoryCount(){
        Random r = new Random();
        return r.nextInt(25);
    }
    
    
    
}
