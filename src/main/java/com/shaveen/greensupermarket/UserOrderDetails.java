/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.shaveen.greensupermarket;

import Model.OrderStatusInfo;
import java.sql.*;
import java.util.Date;

/**
 *
 * @author DELL
 */
//this is used for the orderstatus.jsp page
public class UserOrderDetails {
    public static OrderStatusInfo getoOrderStatusInfoByOrderID(int OrderID) {
         try {
        var con = Model.Connection.start();

        String query = "SELECT " +
                "po.OrderID, " +
                "po.OrderStatus_OrderPlacedTime, " +
                "po.TotalPrice, " +
                "po.OrderStatus_Placed, " +
                "po.OrderStatus_Packaging, " +
                "po.OrderStatus_Delivered " +
                "FROM " +
                "placed_order po " +
                "WHERE " +
                "po.OrderID = ?";
        try (PreparedStatement statement = con.prepareStatement(query)) {
            statement.setInt(1, OrderID);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int orderId = resultSet.getInt("OrderID");
                Date orderplacedDT = resultSet.getDate("OrderStatus_OrderPlacedTime");
                float totalprice = resultSet.getFloat("TotalPrice");
                int orderstatplaced = resultSet.getInt("OrderStatus_Placed");
                int orderstatpackaging = resultSet.getInt("OrderStatus_Packaging");
                int orderstatdelivered = resultSet.getInt("OrderStatus_Delivered");

                return new OrderStatusInfo(orderId, orderplacedDT, totalprice, orderstatplaced, orderstatpackaging, orderstatdelivered);
            }
               
            }
                con.close();
            }catch(Exception e){
                System.out.println(e);
            }
           return null;
        
    }
}
