/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.shaveen.greensupermarket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Jude Darren Victoria
 */
public class OrderDatabaseInteraction {
    
    public static List<OrderDataManager> getAllOrders() {
        List<OrderDataManager> orders = new ArrayList<>();
        Connection connection = Model.Connection.start();

        if (connection != null) {
            try {
                String query = "SELECT * FROM placed_order";
                try (PreparedStatement statement = connection.prepareStatement(query);
                     ResultSet resultSet = statement.executeQuery()) {

                    while (resultSet.next()) {
                        OrderDataManager order = new OrderDataManager();
                        order.setOrderId(resultSet.getInt("OrderID"));
                        order.setOrderDate(resultSet.getDate("OrderDate"));
                        order.setOrderStatusPlaced(resultSet.getInt("OrderStatus_Placed"));
                        order.setOrderStatusPackaging(resultSet.getInt("OrderStatus_Packaging"));
                        order.setOrderStatusDelivered(resultSet.getInt("OrderStatus_Delivered"));
                        order.setCustomerEmail(resultSet.getString("CEmail"));
                        order.setFeedbackId(resultSet.getInt("FeedbackID"));
                        order.setPackageTime(resultSet.getTimestamp("OrderStatus_PackageTime"));
                        order.setOrderPlacedTime(resultSet.getTimestamp("OrderStatus_OrderPlacedTime"));
                        order.setDeliveredTime(resultSet.getTimestamp("OrderStatus_DeliveredTime"));
                        order.setTotalPrice(resultSet.getFloat("TotalPrice"));

                        orders.add(order);
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                Model.Connection.end();
            }
        }

        return orders;
    }
    
}
