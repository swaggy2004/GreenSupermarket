/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.shaveen.greensupermarket;

import Model.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import java.sql.PreparedStatement;

/**
 *
 * @author Shaveen
 */
public class OrderCustomerDAO {
    public static int insertOrderDetails(String CEmail, float totPrice) throws Exception {
    try (var connection = Model.Connection.start();
         PreparedStatement statement = connection.prepareStatement("INSERT INTO placed_order (CEmail, TotalPrice) VALUES(?, ?)", Statement.RETURN_GENERATED_KEYS)) {
        statement.setString(1, CEmail);
        statement.setFloat(2, totPrice);

        int affectedRows = statement.executeUpdate();

        if (affectedRows > 0) {
            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int lastOrderId = generatedKeys.getInt(1);
                    System.out.println("Last inserted OrderID: " + lastOrderId);
                    
                    // Now you can use lastOrderId in subsequent statements...
                    insertProductsIntoOrder(lastOrderId, CEmail);
                    return lastOrderId;
                } else {
                    System.out.println("No generated keys returned.");
                }
            }
        } else {
            System.out.println("Insert into placed_order failed, no rows affected.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        throw e;
    }
        return 0;
}

    private static void insertProductsIntoOrder(int lastOrderId, String CEmail) {
    try (var connection = Model.Connection.start();
            PreparedStatement productStatement = connection.prepareStatement(
            "INSERT INTO order_product (OrderID, ProductID, PName, OPqty, PPrice) " +
                    "SELECT ?, sp.Product_ID, p.Name, sp.PQty, p.UnitPrice " +
                    "FROM shopping_cart sp " +
                    "JOIN product p ON sp.Product_ID = p.ProductID " +
                    "WHERE sp.CEmail = ?")) {
        productStatement.setInt(1, lastOrderId);
        productStatement.setString(2, CEmail);
        productStatement.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
        // Handle the exception or throw it as needed
    }
}
}
