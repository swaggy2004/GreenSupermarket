/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.shaveen.greensupermarket;

import Model.Connection;
import Model.WishList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Shaveen
 */
public class FetchWishList {
    public static List<WishList> searchWishlist(String CEmail) throws SQLException{
        List<WishList> wishList = new ArrayList<>();
        try(var connection = Model.Connection.start();
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM wishlist WHERE CEmail = ?")) {
                statement.setString(1, CEmail);
                try(ResultSet resultSet = statement.executeQuery()){
                    while(resultSet.next()){
                        WishList witem = new WishList();
                        witem.setCEmail(resultSet.getString("CEmail"));
                        witem.setPID(resultSet.getInt("ProductID"));
                        wishList.add(witem);
                    }
                }
        }   
        return wishList;
    }
    
    public static void insertToWishList(String CEmail, int PID) throws SQLException{
        try (var connection = Model.Connection.start();
            PreparedStatement statement = connection.prepareStatement("INSERT INTO wishlist (CEmail, ProductID) VALUES(?, ?)")){
            statement.setString(1, CEmail);
            statement.setInt(2, PID);
            statement.executeUpdate();
        }
        catch(Exception e){
            e.printStackTrace();
            throw e;
        }
    }
}
