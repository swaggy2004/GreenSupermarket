/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.shaveen.greensupermarket;

import java.sql.Time;
import java.util.Date;
/**
 *
 * @author Jude Darren Victoria
 */
public class OrderData {
    
    private int orderID;
    private Date orderDate;
   
    private int orderStatusPlaced;
    private int orderStatusPackaging;
    private int orderStatusDelivered;
    private Date orderStatusPackageTime;
    private Time orderStatusOrderPlacedTime;
    private Date orderStatusDeliveredTime;
    private String customerEmail;
    private int feedbackID;
<<<<<<< HEAD
    private int number_products;
    private float totalamount;
=======

>>>>>>> main
    /**
     * @return the orderID
     */
    public int getOrderID() {
        return this.orderID;
    }

    /**
     * @param orderID the orderID to set
     */
    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    /**
     * @return the orderDate
     */
    public Date getOrderDate() {
        return this.orderDate;
    }

    /**
     * @param orderDate the orderDate to set
     */
    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    /**
     * @return the deliveryDate
     */
   

    /**
     * @return the orderStatusPlaced
     */
    public int getOrderStatusPlaced() {
        return this.orderStatusPlaced;
    }

    /**
     * @param orderStatusPlaced the orderStatusPlaced to set
     */
    public void setOrderStatusPlaced(int orderStatusPlaced) {
        this.orderStatusPlaced = orderStatusPlaced;
    }

    /**
     * @return the orderStatusPackaging
     */
    public int getOrderStatusPackaging() {
        return this.orderStatusPackaging;
    }

    /**
     * @param orderStatusPackaging the orderStatusPackaging to set
     */
    public void setOrderStatusPackaging(int orderStatusPackaging) {
        this.orderStatusPackaging = orderStatusPackaging;
    }

    /**
     * @return the orderStatusDelivered
     */
    public int getOrderStatusDelivered() {
        return this.orderStatusDelivered;
    }

    /**
     * @param orderStatusDelivered the orderStatusDelivered to set
     */
    public void setOrderStatusDelivered(int orderStatusDelivered) {
        this.orderStatusDelivered = orderStatusDelivered;
    }

    /**
     * @return the orderStatusPackageTime
     */
    public Date getOrderStatusPackageTime() {
        return this.orderStatusPackageTime;
    }

    /**
     * @param orderStatusPackageTime the orderStatusPackageTime to set
     */
    public void setOrderStatusPackageTime(Date orderStatusPackageTime) {
        this.orderStatusPackageTime = orderStatusPackageTime;
    }

    /**
     * @return the orderStatusOrderPlacedTime
     */
    public Time getOrderStatusOrderPlacedTime() {
        return this.orderStatusOrderPlacedTime;
    }

    /**
     * @param orderStatusOrderPlacedTime the orderStatusOrderPlacedTime to set
     */
    public void setOrderStatusOrderPlacedTime(Time orderStatusOrderPlacedTime) {
        this.orderStatusOrderPlacedTime = orderStatusOrderPlacedTime;
    }

    /**
     * @return the orderStatusDeliveredTime
     */
    public Date getOrderStatusDeliveredTime() {
        return this.orderStatusDeliveredTime;
    }

    /**
     * @param orderStatusDeliveredTime the orderStatusDeliveredTime to set
     */
    public void setOrderStatusDeliveredTime(Date orderStatusDeliveredTime) {
        this.orderStatusDeliveredTime = orderStatusDeliveredTime;
    }

    /**
     * @return the customerEmail
     */
    public String getCustomerEmail() {
        return this.customerEmail;
    }

    /**
     * @param customerEmail the customerEmail to set
     */
    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    /**
     * @return the feedbackID
     */
    public int getFeedbackID() {
        return this.feedbackID;
    }

    /**
     * @param feedbackID the feedbackID to set
     */
    public void setFeedbackID(int feedbackID) {
        this.feedbackID = feedbackID;
    }
    
<<<<<<< HEAD
    public int getnumber_products() {
        return number_products;
    }

    /**
     * @param number_products the number of products to set
     */
    public void setnumber_products(int number_products) {
        this.number_products = number_products;
    }
    
    public float gettotalamount() {
        return totalamount;
    }

    /**
     * @param totalamount the totalamount to set
     */
    public void settotalamount(float totalamount) {
        this.totalamount = totalamount;
    
    }
=======
    
    
>>>>>>> main
}
