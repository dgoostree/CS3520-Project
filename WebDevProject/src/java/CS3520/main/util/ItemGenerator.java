/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



package CS3520.main.util;
import java.io.Serializable;
import java.util.ArrayList;


/**
 *
 * @author keitheveritt
 */
public class ItemGenerator implements Serializable{
    
    public static ArrayList getItemList(String iT, String par){
        ArrayList list = new ArrayList();
        switch (iT) {
                case "mon":
                    String[] monBrands = {"ASUS", "LG", "Samsung", "ViewSonic"};
                    for(int i = 0; i < 4; i++){
                        Monitor aMon = new Monitor(iT, par, monBrands[i]);
                        list.add(aMon);
                    }   break;
                case "harddrive":
                    String[] hDBrands = {"Maxtor", "Seagate", "WD"};
                    for(int i = 0; i < 3; i++){
                        Monitor aMon = new Monitor(iT, par, hDBrands[i]);
                        list.add(aMon);
                    }   break;
                default:
                    String[] caseBrands = {"Cooler Master", "RaidMax", "Rosewill", "Thermaltake"};
                    for(int i = 0; i < 4; i++){
                        Monitor aMon = new Monitor(iT, par, caseBrands[i]);
                        list.add(aMon);
                    }   break;
            }
        return list;
    }
    
}
