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
                    cartDetail.setCartID(resultSet.getInt("CartID"));
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
}

    
//    public static List<ShoppingCart> searchCart(String CEmail) throws SQLException{
//        List<ShoppingCart> cart = new ArrayList<>();
//        try{
//            var connection = Model.Connection.start();
//            String query = "SELECT * FROM shopping_cart WHERE CEmail = ?";
//            try(PreparedStatement preparedstatement = connection.prepareStatement(query)){
//                preparedstatement.setString(1, CEmail);
//                ResultSet resultSet = preparedstatement.executeQuery();
//                while(resultSet.next()){
//                    ShoppingCart CartDetail = new ShoppingCart();
//                    CartDetail.setCartID(resultSet.getInt("CartID"));
//                    CartDetail.setPID(resultSet.getInt("Product_ID"));
//                    CartDetail.setPQty(resultSet.getInt("PQty"));
//                    CartDetail.setCEmail(CEmail);
//
//                    cart.add(CartDetail);
//                }
//            }
//        }
//        catch (SQLException e){
//        }
//        return cart;
//    }
