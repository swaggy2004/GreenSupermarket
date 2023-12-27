/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.time.LocalDateTime;
import java.util.Date;

/**
 *
 * @author Shaveen
 */
public class Order {
    private int OrderID; 
    private Date OrderDate = new Date();
    private Boolean StatusPlaced;
    private Boolean StatusPackaging;
    private Boolean StatusDelivered;
    private static String CEmail;
    private int FeedbackID;
    private LocalDateTime OrderPackagedTime = LocalDateTime.now();
    private LocalDateTime OrderPlacedTime = LocalDateTime.now();
    private LocalDateTime OrderDeliveredTime = LocalDateTime.now();
    private float TotalPrice;
    
    public Order(){}

    public int getOrderID() {
        return this.OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public Date getOrderDate() {
        return this.OrderDate;
    }

    public void setOrderDate(Date OrderDate) {
        this.OrderDate = OrderDate;
    }

    public Boolean getStatusPlaced() {
        return this.StatusPlaced;
    }

    public void setStatusPlaced(Boolean StatusPlaced) {
        this.StatusPlaced = StatusPlaced;
    }

    public Boolean getStatusPackaging() {
        return StatusPackaging;
    }

    public void setStatusPackaging(Boolean StatusPackaging) {
        this.StatusPackaging = StatusPackaging;
    }

    public Boolean getStatusDelivered() {
        return this.StatusDelivered;
    }

    public void setStatusDelivered(Boolean StatusDelivered) {
        this.StatusDelivered = StatusDelivered;
    }

    public String getCEmail() {
        return this.CEmail;
    }

    public void setCEmail(String CEmail) {
        this.CEmail = CEmail;
    }

    public int getFeedbackID() {
        return this.FeedbackID;
    }

    public void setFeedbackID(int FeedbackID) {
        this.FeedbackID = FeedbackID;
    }

    public LocalDateTime getOrderPackagedTime() {
        return this.OrderPackagedTime;
    }

    public void setOrderPackagedTime(LocalDateTime OrderPackagedTime) {
        this.OrderPackagedTime = OrderPackagedTime;
    }

    public LocalDateTime getOrderPlacedTime() {
        return this.OrderPlacedTime;
    }

    public void setOrderPlacedTime(LocalDateTime OrderPlacedTime) {
        this.OrderPlacedTime = OrderPlacedTime;
    }

    public LocalDateTime getOrderDeliveredTime() {
        return this.OrderDeliveredTime;
    }

    public void setOrderDeliveredTime(LocalDateTime OrderDeliveredTime) {
        this.OrderDeliveredTime = OrderDeliveredTime;
    }

    public float getTotalPrice() {
        return this.TotalPrice;
    }

    public void setTotalPrice(float TotalPrice) {
        this.TotalPrice = TotalPrice;
    }
    
    
}
