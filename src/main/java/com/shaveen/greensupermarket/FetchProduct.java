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
                if(resultSet.getBoolean("Visibility")){
                    Product product = new Product();
                    product.setProductID(resultSet.getInt("ProductID"));
                    product.setProductName(resultSet.getString("Name"));
                    product.setUnitQty(resultSet.getInt("UnitQty"));
                    product.setStockQty(resultSet.getInt("StockQty"));
                    product.setCategory(resultSet.getString("Category"));
                    product.setDescription(resultSet.getString("Description"));
                    product.setVisibility(resultSet.getBoolean("Visibility"));
                    product.setPrice(resultSet.getFloat("UnitPrice"));
                    product.setImgPath(resultSet.getString("ImagePath"));
                    products.add(product);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }
    
    public static List<Product> SearchProduct(int PID) {
        List<Product> products = new ArrayList<>();
        try (Connection connection = Model.Connection.start();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM product WHERE ProductID = ?")) {
            statement.setInt(1, PID);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    if(resultSet.getBoolean("Visibility")) {
                        Product product = new Product();
                        product.setProductID(resultSet.getInt("ProductID"));
                        product.setProductName(resultSet.getString("Name"));
                        product.setUnitQty(resultSet.getInt("UnitQty"));
                        product.setStockQty(resultSet.getInt("StockQty"));
                        product.setCategory(resultSet.getString("Category"));
                        product.setDescription(resultSet.getString("Description"));
                        product.setVisibility(resultSet.getBoolean("Visibility"));
                        product.setPrice(resultSet.getFloat("UnitPrice"));
                        product.setImgPath(resultSet.getString("ImagePath"));
                        products.add(product);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately in a production environment
        }
        return products;
    }
    
    public static List<Product> SearchProduct(String category) {
        List<Product> products = new ArrayList<>();
        try (Connection connection = Model.Connection.start();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM product WHERE Category = ?")) {
            statement.setString(1, category);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    if(resultSet.getBoolean("Visibility")){
                        Product product = new Product();
                        product.setProductID(resultSet.getInt("ProductID"));
                        product.setProductName(resultSet.getString("Name"));
                        product.setUnitQty(resultSet.getInt("UnitQty"));
                        product.setStockQty(resultSet.getInt("StockQty"));
                        product.setCategory(resultSet.getString("Category"));
                        product.setDescription(resultSet.getString("Description"));
                        product.setVisibility(resultSet.getBoolean("Visibility"));
                        product.setPrice(resultSet.getFloat("UnitPrice"));
                        product.setImgPath(resultSet.getString("ImagePath"));
                        products.add(product);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately in a production environment
        }
        return products;
    }
    
    public static Product searchProduct(int PID) {
        try (Connection connection = Model.Connection.start()){
            String query = "SELECT * FROM product WHERE ProductID = ?";
            try (PreparedStatement statement = connection.prepareStatement(query)){
                statement.setInt(1, PID);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        if (resultSet.getBoolean("Visibility")){
                            Product product = new Product();
                            product.setProductID(resultSet.getInt("ProductID"));
                            product.setProductName(resultSet.getString("Name"));
                            product.setUnitQty(resultSet.getInt("UnitQty"));
                            product.setStockQty(resultSet.getInt("StockQty"));
                            product.setCategory(resultSet.getString("Category"));
                            product.setDescription(resultSet.getString("Description"));
                            product.setVisibility(resultSet.getBoolean("Visibility"));
                            product.setPrice(resultSet.getFloat("UnitPrice"));
                            product.setImgPath(resultSet.getString("ImagePath"));
                            return product;
                        }
                    }
                }
            }
        }
        catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately in a production environment
        }
        return null;
    }

    public static List<Product> getTopProducts() {
        List<Product> productList = new ArrayList<>();
        try (Connection connection = Model.Connection.start()) {
            String query = "SELECT * FROM Product LIMIT 10";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        if(resultSet.getBoolean("Visibility")){
                            Product product = new Product();
                            product.setProductID(resultSet.getInt("ProductID"));
                            product.setProductName(resultSet.getString("Name"));
                            product.setUnitQty(resultSet.getInt("UnitQty"));
                            product.setStockQty(resultSet.getInt("StockQty"));
                            product.setCategory(resultSet.getString("Category"));
                            product.setDescription(resultSet.getString("Description"));
                            product.setVisibility(resultSet.getBoolean("Visibility"));
                            product.setPrice(resultSet.getFloat("UnitPrice"));
                            product.setImgPath(resultSet.getString("ImagePath"));
                            productList.add(product);
                        }
                    }
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }

    public static List<Product> SearchResult(String SearchResult) {
        List<Product> products = new ArrayList<>();
        try (Connection connection = Model.Connection.start();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM product WHERE Name LIKE ?")) {
            statement.setString(1, "%" + SearchResult + "%");
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    if(resultSet.getBoolean("Visibility")){
                        Product product = new Product();
                        product.setProductID(resultSet.getInt("ProductID"));
                        product.setProductName(resultSet.getString("Name"));
                        product.setUnitQty(resultSet.getInt("UnitQty"));
                        product.setStockQty(resultSet.getInt("StockQty"));
                        product.setCategory(resultSet.getString("Category"));
                        product.setDescription(resultSet.getString("Description"));
                        product.setVisibility(resultSet.getBoolean("Visibility"));
                        product.setPrice(resultSet.getFloat("UnitPrice"));
                        product.setImgPath(resultSet.getString("ImagePath"));
                        products.add(product);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately in a production environment
        }
        return products;
    }
}