/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Jude Darren Victoria
 */
public class EOrderDetail {
    
    
    private String orderDate;
    private String customerEmail;
    private float totalPrice;

    public EOrderDetail(String orderDate, String customerEmail, float totalPrice) {
        this.orderDate = orderDate;
        this.customerEmail = customerEmail;
        this.totalPrice = totalPrice;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public float getTotalPrice() {
        return totalPrice;
    }
}

