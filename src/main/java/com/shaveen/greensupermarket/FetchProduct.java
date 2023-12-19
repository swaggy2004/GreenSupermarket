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
                product.setProductID(resultSet.getString("ProductID"));
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
}