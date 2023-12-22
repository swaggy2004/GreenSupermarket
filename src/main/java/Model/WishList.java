/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Shaveen
 */
public class WishList {
    private String CEmail;
    private int PID;
    
    public void WishList(){};
    
    public void WishList(String CEamil, int PID){
        this.CEmail = CEmail;
        this.PID = PID;
    }

    public String getCEmail() {
        return this.CEmail;
    }

    public void setCEmail(String CEmail) {
        this.CEmail = CEmail;
    }

    public int getPID() {
        return this.PID;
    }

    public void setPID(int PID) {
        this.PID = PID;
    }
    
    
}
