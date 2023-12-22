/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.shaveen.greensupermarket;

import Model.IndividualFeedbackManagement;
import java.sql.*;

/**
 *
 * @author DELL
 */

public class CIndividualFeedbackManagement {
    public static IndividualFeedbackManagement getinfoByFeedbackID(String feedbackID) {
        try {
            var con = Model.Connection.start();
            
            String query = "SELECT " +
                    "c.FullName, " +
                    "c.AvatarPath, " +
                    "po.OrderID, " +
                    "f.FeedbackID, " +
                    "f.FeedbackRating, " +
                    "f.FeedbackText, " +
                    "f.FeedbackTime " +
               "FROM " +
                    "customer c " +
               "JOIN " +
                    "placed_order po ON c.Email = po.CEmail " +
               "JOIN " +
                    "feedback f ON po.FeedbackID = f.FeedbackID " +
               "WHERE " +
                    "f.FeedbackID = ?";
            try (PreparedStatement statement = con.prepareStatement(query)) {
                statement.setString(1, feedbackID);
                ResultSet resultSet = statement.executeQuery();
                if (resultSet.next()) {
                    int feedbackId = resultSet.getInt("FeedbackID");
                    int feedbackRating = resultSet.getInt("FeedbackRating");
                    String cName = resultSet.getString("FullName");
                    String feedbackTime = resultSet.getString("FeedbackTime");
                    String feedbackText = resultSet.getString("FeedbackText");
                    int orderId = resultSet.getInt("OrderID");
                    String cAvatar = resultSet.getString("AvatarPath");
                    
                    
            
                    return new IndividualFeedbackManagement(feedbackId, feedbackRating, cName, feedbackTime,feedbackText,orderId,cAvatar);
                } 
               
            }
            
                con.close();
            }catch(Exception e){
                System.out.println(e);
            }
           return null;
        
    }
}
