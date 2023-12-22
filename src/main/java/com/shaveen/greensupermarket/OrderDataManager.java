/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.shaveen.greensupermarket;

import java.util.Date;

/**
 *
 * @author Jude Darren Victoria
 */
public class OrderDataManager {
    
    private int orderId;
    private Date orderDate;
    private int orderStatusPlaced;
    private int orderStatusPackaging;
    private int orderStatusDelivered;
    private String customerEmail;
    private int feedbackId;
    private Date packageTime;
    private Date orderPlacedTime;
    private Date deliveredTime;
    private float totalPrice;

    /**
     * @return the orderStatusPlaced
     */
    public int getOrderStatusPlaced() {
        return orderStatusPlaced;
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
        return orderStatusPackaging;
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
        return orderStatusDelivered;
    }

    /**
     * @param orderStatusDelivered the orderStatusDelivered to set
     */
    public void setOrderStatusDelivered(int orderStatusDelivered) {
        this.orderStatusDelivered = orderStatusDelivered;
    }
    
    /**
     * @return the orderId
     */
    public int getOrderId() {
        return orderId;
    }

    /**
     * @param orderId the orderId to set
     */
    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    /**
     * @return the orderDate
     */
    public Date getOrderDate() {
        return orderDate;
    }

    /**
     * @param orderDate the orderDate to set
     */
    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    /**
     * @return the customerEmail
     */
    public String getCustomerEmail() {
        return customerEmail;
    }

    /**
     * @param customerEmail the customerEmail to set
     */
    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    /**
     * @return the feedbackId
     */
    public int getFeedbackId() {
        return feedbackId;
    }

    /**
     * @param feedbackId the feedbackId to set
     */
    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    /**
     * @return the packageTime
     */
    public Date getPackageTime() {
        return packageTime;
    }

    /**
     * @param packageTime the packageTime to set
     */
    public void setPackageTime(Date packageTime) {
        this.packageTime = packageTime;
    }

    /**
     * @return the orderPlacedTime
     */
    public Date getOrderPlacedTime() {
        return orderPlacedTime;
    }

    /**
     * @param orderPlacedTime the orderPlacedTime to set
     */
    public void setOrderPlacedTime(Date orderPlacedTime) {
        this.orderPlacedTime = orderPlacedTime;
    }

    /**
     * @return the deliveredTime
     */
    public Date getDeliveredTime() {
        return deliveredTime;
    }

    /**
     * @param deliveredTime the deliveredTime to set
     */
    public void setDeliveredTime(Date deliveredTime) {
        this.deliveredTime = deliveredTime;
    }

    /**
     * @return the totalPrice
     */
    public float getTotalPrice() {
        return totalPrice;
    }

    /**
     * @param totalPrice the totalPrice to set
     */
    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }
    
    
    
    
    
}
