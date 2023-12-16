/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.shaveen.greensupermarket;

import java.sql.*;
import Model.Product;
import java.util.*;

/**
 *
 * @author Shaveen
 */
public class FetchProduct {
    public List<Product> getProduct(){
        List<Product> products = new ArrayList<>();
        try {
        Connection con = Model.Connection.start();
        String query = "SELECT ProductID, Name, UnitQty, StockQty, Category, Visibility, UnitPrice, Description FROM product";
        try (PreparedStatement statement = con.prepareCall(query)){
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                String ProductID = resultSet.getString("ProductID");
                String ProductName = resultSet.getString("Name");
                int units = resultSet.getInt("UnitQty");
                int stock = resultSet.getInt("StockQty");
                String category = resultSet.getString("Category");
                Boolean visibitlity = resultSet.getBoolean("Visibility");
                float price = resultSet.getFloat("UnitPrice");
                String description = resultSet.getString("Description");
                
                Product item = new Product();
                item.setProductName(ProductName);
                item.setProductID(ProductID);
                item.setPrice(price);
                item.setVisibility(visibitlity);
                item.setUnitQty(units);
                item.setStockQty(stock);
                item.setCategory(category);
                item.setDescription(description);
                
                products.add(item);
                }
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return products;
    }
  
}
