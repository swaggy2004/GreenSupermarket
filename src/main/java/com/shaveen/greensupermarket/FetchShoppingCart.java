/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.shaveen.greensupermarket;

import Model.ShoppingCart;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Shaveen
 */
public class FetchShoppingCart {
    public static List<ShoppingCart> searchCart(String CEmail) throws SQLException {
        List<ShoppingCart> cart = new ArrayList<>();

        try (var connection = Model.Connection.start();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM shopping_cart WHERE CEmail = ?")) {

            preparedStatement.setString(1, CEmail);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    ShoppingCart cartDetail = new ShoppingCart();
                    cartDetail.setPID(resultSet.getInt("Product_ID"));
                    cartDetail.setPQty(resultSet.getInt("PQty"));
                    cartDetail.setCEmail(CEmail);

                    cart.add(cartDetail);
                }
            }
        } catch (SQLException e) {
            // Handle the exception or log it appropriately
            e.printStackTrace();
            throw e; // Re-throw the exception to propagate it up the call stack
        }

        return cart;
    }
    
    public static void insertToCart(String CEmail, int PID, int PQty) throws SQLException{
        try (var connection = Model.Connection.start();
            PreparedStatement statement = connection.prepareStatement("INSERT INTO shopping_cart (CEmail, PQty, Product_ID) VALUES(?, ?, ?)")){
            statement.setString(1, CEmail);
            statement.setInt(2, PQty);
            statement.setInt(3, PID);
            statement.executeUpdate();
        }
        catch(Exception e){
            e.printStackTrace();
            throw e;
        }
    }

    public static void increaseQty(String CEmail, int PQty, int PID) {
        try (var connection = Model.Connection.start();
             PreparedStatement statement = connection.prepareStatement(
                     "UPDATE shopping_cart SET PQty = ? WHERE CEmail = ? AND Product_ID = ?;")) {
            statement.setInt(1, PQty);
            statement.setString(2, CEmail);
            statement.setInt(3, PID);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deleteProduct(String CEmail, int PID){
        try (var connection = Model.Connection.start();
             PreparedStatement statement = connection.prepareStatement(
                     "DELETE FROM shopping_cart WHERE CEmail = ? AND Product_ID = ?;")) {
            statement.setString(1, CEmail);
            statement.setInt(2, PID);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void deleteCart(String CEmail){
        try (var connection = Model.Connection.start();
                PreparedStatement statement = connection.prepareStatement(
                        "DELETE FROM shopping_cart WHERE CEmail = ?")){
            statement.setString(1, CEmail);
            statement.executeUpdate();
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}

