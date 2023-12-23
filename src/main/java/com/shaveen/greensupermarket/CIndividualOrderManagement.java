/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.shaveen.greensupermarket;

import Model.IndividualOrderManagement;
import Model.IndividualProdOrderManagement;
import java.sql.*;
import java.util.Date;
import java.util.List;
import java.util.ArrayList;

/**
 *
 * @author DELL
 */
public class CIndividualOrderManagement {
    public static IndividualOrderManagement getinfoByOrderID(int OrderID) {
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

                return new IndividualOrderManagement(orderId, orderplacedDT, totalprice, orderstatplaced, orderstatpackaging, orderstatdelivered);
            }
               
            }
                con.close();
            }catch(Exception e){
                System.out.println(e);
            }
           return null;
        
    }
    
    
    public static List<IndividualProdOrderManagement> getProdinfoByOrderID(int OrderID) {
    List<IndividualProdOrderManagement> OrderedProducts = new ArrayList<>();
    try {
        var con = Model.Connection.start();

        // Adjusted query to include OrderID parameter
        String query =  "SELECT PName, OPqty, PPrice FROM order_product WHERE OrderID = ?";
        PreparedStatement statement = con.prepareStatement(query);
        statement.setInt(1, OrderID);

        ResultSet set = statement.executeQuery();
        while (set.next()) {
            IndividualProdOrderManagement orderproductinfo = new IndividualProdOrderManagement();
            orderproductinfo.setProductQuantity(set.getInt("OPqty"));
            orderproductinfo.setProductPrice(set.getFloat("PPrice"));
            orderproductinfo.setProductName(set.getString("PName"));
            OrderedProducts.add(orderproductinfo);
        }
    } catch (SQLException exception) {
        exception.printStackTrace();
    }
    return OrderedProducts;
}
    
    public static void updateOrderStatusByOrderID(int orderId,int orderplaced,int orderpackaged,int orderdelivered ){
        String query = "UPDATE placed_order SET OrderStatus_Delivered = ?, OrderStatus_Placed = ?, OrderStatus_Packaging = ? WHERE OrderID  = ?";
        try (
             var con = Model.Connection.start();
            PreparedStatement statement = con.prepareStatement(query)) {

            statement.setInt(1,orderdelivered);
            statement.setInt(2,orderplaced);
            statement.setInt(3,orderpackaged);
            statement.setInt(4,orderId);
            
            System.out.println("Executing SQL query:"+statement.toString());
                int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) {
                    System.out.println("OrderStatus updated successfully!");
                } else {
                    System.out.println("Failed to update OrderStatus.");
                }
                con.close();

        } catch (SQLException e) {
            e.printStackTrace(); 
        }
    }
}
