/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.shaveen.greensupermarket;

import Model.ProductStock;
import java.sql.*;
import java.util.*;

/**
 *
 * @author DELL
 */
public class PStockManagement {
    public static List<ProductStock> getProductStock(){
    List<ProductStock> ProductStocks = new ArrayList<>();
     try{
      var con = Model.Connection.start();
      
      String query = "SELECT ProductID, Name, StockQty from product";
      PreparedStatement statement= con.prepareStatement(query);
      
      
      ResultSet set = statement.executeQuery();
      while(set.next()){
        ProductStock productstocks = new ProductStock();
        productstocks.setProductID(set.getString("ProductID"));
        productstocks.setProductName(set.getString("Name"));
        productstocks.setStockQty(set.getInt("StockQty"));
        ProductStocks.add(productstocks);
      }
     }
      
     catch(SQLException exception){
      exception.printStackTrace();
     }
     return ProductStocks;
    }
    
    public void updateProductStockQtyById(String productId,int stockquantity) {
        
        try {
            var con = Model.Connection.start();
            
            String query = "UPDATE product SET StockQty=? WHERE ProductID = ?";
            try (PreparedStatement statement = con.prepareStatement(query)) {
                statement.setInt(1, stockquantity);
                statement.setString(2, productId);
                
                System.out.println("Executing SQL query:"+statement.toString());
                int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) {
                    System.out.println("Product Stock updated successfully!");
                } else {
                    System.out.println("Failed to update Product Stock.");
                }
                con.close();
            }
            catch(Exception e){
                System.out.println(e);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}