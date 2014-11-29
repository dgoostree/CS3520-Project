/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CS3520.main.util;


import java.io.Serializable;
/**
 *
 * @author Keith
 */

public class Item implements Serializable{
    private String itemType;
    private String param;
    private String brand;
    private String image;
    private int item_number;
    private double price;
    
    public Item(String iT, String par, String name, String im, int num, double pr){
        this.itemType = iT;
        this.param = par;
        this.brand = name;
        this.image = im;
        this.item_number = num;
        this.price = pr;
    }
    
    public Item(){
        this.brand = "";
        this.image = "";
        this.itemType = "";
        this.item_number = 0;
        this.param = "";
        this.price = 0.00;
    }
    
    
    public String getItemType(){
        return itemType;
    }
    
    public String getParam(){
        return param;
    }
    
    public String getParamToString(){
        if( itemType.equals("Monitor")){
            return param + " inch";
        }
        else if( itemType.equals("Hard-drive")){
            return param + " GB";
        }
        else if(itemType.equals("Memory")){
            return param + " GB";
        }
        else {
            return param ;
        }
    }
    
    public String getBrand(){
        return brand;
    }
    
    public String getImage(){
        return image;
    }
    
    public int getItem_number(){
        return item_number;
    }
    
    public double getPrice(){
        return price;
    }
    
    public void setItemType(String s){
        itemType = s;
    }
    
    public void setParam(String s){
        param = s;
    }
    
    public void setBrand(String s){
        brand = s;
    }
    
    public void setImage(String s){
        image = s;
    }
    
    public void setItem_number(int i){
        item_number = i;
    }
    
    public void setPrice(double d){
        price = d;
    }
}
