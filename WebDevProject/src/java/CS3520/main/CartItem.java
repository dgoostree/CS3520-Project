/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CS3520.main;

import java.io.Serializable;

/**
 *
 * @author Darren
 */
public class CartItem implements Serializable {
    private int itemNumber;
    private String brand;
    private String param;
    private String type;
    private int quantity;
    private double price;
    
    public CartItem(){
        
    }
    public int getItemNumber() {
        return itemNumber;
    }

    public void setItemNumber(int itemNumber) {
        this.itemNumber = itemNumber;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getParam() {
        return param;
    }
    
    public String getParamFormatted(){
        if (type.equals("Monitor")){
            return (param + " inch");
        }
        else if (type.equals("Memory")){
            return (param + "GB");
        }
        else if (type.equals("Hard-drive")){
            if(Integer.valueOf(param) > 100){
                return (param + "GB");
            }
            else {
                return (param + "TB");
            }
        }
        else {
            return param;
        }
    }

    public void setParam(String param) {
        this.param = param;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
