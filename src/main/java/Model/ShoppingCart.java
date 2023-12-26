/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;
/**
 *
 * @author Shaveen
 */
public class ShoppingCart {
    private int PQty;
    private int PID;
    private String CEmail;
    private float totPrice;
    
    public ShoppingCart(){};
    
    public ShoppingCart(int PQty, int PID, String CEmail){
       this.PQty = PQty;
       this.PID = PID;
       this.CEmail = CEmail;
    }

    public float getTotPrice() {
        return this.totPrice;
    }

    public void setTotPrice(float totPrice) {
        this.totPrice = totPrice;
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

    public int getPQty() {
        return this.PQty;
    }

    public void setPQty(int ProductQty) {
        this.PQty = ProductQty;
    }
}
