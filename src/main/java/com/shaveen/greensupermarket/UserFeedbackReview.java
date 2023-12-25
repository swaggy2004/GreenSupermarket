/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.shaveen.greensupermarket;

import java.sql.*;
/**
 *
 * @author DELL
 */
public class UserFeedbackReview {

   // Your method to insert feedback
   public static void insertFeedback(int orderID, int ratingVal, String writtenReview)
            throws SQLException {
        Connection con = Model.Connection.start();

        // Insert into feedback table
        String feedbackQuery = "INSERT INTO feedback (FeedbackRating, FeedbackText) VALUES (?, ?)";
        try (PreparedStatement feedbackStatement = con.prepareStatement(feedbackQuery, PreparedStatement.RETURN_GENERATED_KEYS)) {
            feedbackStatement.setInt(1, ratingVal);
            feedbackStatement.setString(2, writtenReview);
            feedbackStatement.executeUpdate();

            // Retrieve the auto-generated feedback ID
            int feedbackID;
            try (var generatedKeys = feedbackStatement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    feedbackID = generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Failed to retrieve generated feedback ID.");
                }
            }

            // Update placed_order table with the generated FeedbackID for the specified OrderID
            String orderUpdateQuery = "UPDATE placed_order SET FeedbackID = ? WHERE OrderID = ?";
            try (PreparedStatement orderUpdateStatement = con.prepareStatement(orderUpdateQuery)) {
                orderUpdateStatement.setInt(1, feedbackID);
                orderUpdateStatement.setInt(2, orderID);
                orderUpdateStatement.executeUpdate();
            }
        }
    }
}
