/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;
import java.util.Date;
/**
 *
 * @author DELL
 */
public class IndividualOrderManagement {
    private int OrderId;
    private Date OrderPlacedDateTime;
    private float TotalPrice;
    private int OrderStatusPlaced;
    private int OrderStatusPackaging;
    private int OrderStatusDelivered;
    
public IndividualOrderManagement(){}  
    
public IndividualOrderManagement(int OrderId,Date OrderPlacedDateTime,float TotalPrice,int OrderStatusPlaced,int OrderStatusPackaging,int OrderStatusDelivered){
    
    this.OrderId = OrderId;
    this.OrderPlacedDateTime = OrderPlacedDateTime;
    this.TotalPrice = TotalPrice;
    this.OrderStatusPlaced = OrderStatusPlaced;
    this.OrderStatusPackaging = OrderStatusPackaging;
    this.OrderStatusDelivered = OrderStatusDelivered;     
    } 

public int getOrderId() {
    return this.OrderId;
}

public void setOrderId(int orderId) {
    this.OrderId = OrderId;
}

public Date getOrderPlacedDateTime() {
    return this.OrderPlacedDateTime;
}

public void setOrderPlacedDateTime(Date OrderPlacedDateTime) {
    this.OrderPlacedDateTime = OrderPlacedDateTime;
}



public float getTotalPrice() {
    return this.TotalPrice;
}

public void setTotalPrice(float TotalPrice) {
    this.TotalPrice = TotalPrice;
}

public int getOrderStatusPlaced() {
    return this.OrderStatusPlaced;
}

public void setOrderStatusPlaced(int OrderStatusPlaced) {
    this.OrderStatusPlaced = OrderStatusPlaced;
}

public int getOrderStatusPackaging() {
    return this.OrderStatusPackaging;
}

public void setOrderStatusPackaging(int OrderStatusPackaging) {
    this.OrderStatusPackaging = OrderStatusPackaging;
}

public int getOrderStatusDelivered() {
    return this.OrderStatusDelivered;
}

public void setOrderStatusDelivered(int OrderStatusDelivered) {
    this.OrderStatusDelivered = OrderStatusDelivered;
}   
}
