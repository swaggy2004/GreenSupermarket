/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.shaveen.greensupermarket;

import java.util.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import Model.Product;
import Model.ShoppingCart;
import java.sql.PreparedStatement;
import java.sql.SQLException;
/**
 *
 * @author Shaveen
 */
public class FetchProduct {
    public static List<Product> SearchProduct(){
        List <Product> products = new ArrayList<>();
        try {
            var connection = Model.Connection.start();
            String query = "SELECT * FROM product";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            while(resultSet.next()){
                Product product = new Product();
                product.setProductID(resultSet.getInt("ProductID"));
                product.setProductName(resultSet.getString("Name"));
                product.setUnitQty(resultSet.getInt("UnitQty"));
                product.setStockQty(resultSet.getInt("StockQty"));
                product.setCategory(resultSet.getString("Category"));
                product.setDescription(resultSet.getString("Description"));
                product.setVisibility(resultSet.getBoolean("Visibility"));
                product.setPrice(resultSet.getFloat("UnitPrice"));
                products.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }
    
    public static List<Product> SearchProduct(int PID) {
        List <Product> products = new ArrayList<>();

        try (Connection connection = Model.Connection.start();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM product WHERE ProductID = ?")) {
            statement.setInt(1, PID);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Product product = new Product();
                    product.setProductID(resultSet.getInt("ProductID"));
                    product.setProductName(resultSet.getString("Name"));
                    product.setUnitQty(resultSet.getInt("UnitQty"));
                    product.setStockQty(resultSet.getInt("StockQty"));
                    product.setCategory(resultSet.getString("Category"));
                    product.setDescription(resultSet.getString("Description"));
                    product.setVisibility(resultSet.getBoolean("Visibility"));
                    product.setPrice(resultSet.getFloat("UnitPrice"));
                    products.add(product);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately in a production environment
        }
        return products;
    }

}