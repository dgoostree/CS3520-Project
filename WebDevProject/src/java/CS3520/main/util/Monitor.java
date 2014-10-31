/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CS3520.main.util;

/**
 *
 * @author Keith
 */
public class Monitor {
    public Monitor(String iT, String par, String name){
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
    
    public String getName(){
        return name;
    }
    
    private String itemType;
    private String param;
    private String name;
}
