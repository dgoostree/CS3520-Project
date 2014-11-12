/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CS3520.main.util;

import java.util.Random;
import java.io.Serializable;
/**
 *
 * @author Keith
 */

public class Monitor implements Serializable{
    public Monitor(String iT, String par, String name){
        Random r = new Random();
        double tmp = r.nextInt(101);
        price = (Double.toString(tmp+=r.nextDouble()));
        setType(iT);
        setPar(par);
        setBrand(name);
    }
    
    public void setType(String s){
        itemType = s;
    }
    
    public void setPar(String s){
        param = s;
    }
    
    public void setBrand(String s){
        name = s;
    }
    
    public String getType(){
        return itemType;
    }
    
    public String getParam(){
        return param;
    }
    
    public String getParamToString(){
        if( itemType.equals("monitor")){
            return param + " inch";
        }
        else if( itemType.equals("hard-drive")){
            return param + " GB";
        }
        else {
            return param ;
        }
    }
    
    public String getName(){
        return name;
    }
    
    private String itemType;
    private String param;
    private String name;
    private String price;
}
