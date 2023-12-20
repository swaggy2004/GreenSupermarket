/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.shaveen.greensupermarket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Jude Darren Victoria
 */
public class ManagerDatabaseInteraction {
    
     public static int getTotalOrderCount() {
        int totalCount = 0;
        Connection connection = Model.Connection.start();
        if (connection != null) {
            try {
                String query = "SELECT COUNT(*) AS TotalCount FROM placed_order";
                try (PreparedStatement statement = connection.prepareStatement(query);
                     ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        totalCount = resultSet.getInt("TotalCount");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                Model.Connection.end();
            }
        }
        return totalCount;
    }
     
     public static int getTotalFeedbackCount() {
        int totalCount = 0;
        Connection connection = Model.Connection.start();
        if (connection != null) {
            try {
                String query = "SELECT COUNT(*) AS TotalCount FROM feedback";
                try (PreparedStatement statement = connection.prepareStatement(query);
                     ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        totalCount = resultSet.getInt("TotalCount");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                Model.Connection.end();
            }
        }
        return totalCount;
    }
     
     
     public static double getAverageFeedbackRating() {
        double averageRating = 0.0;
        Connection connection = Model.Connection.start();
        if (connection != null) {
            try {
                String query = "SELECT AVG(FeedbackRating) AS AverageRating FROM feedback";
                try (PreparedStatement statement = connection.prepareStatement(query);
                     ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        averageRating = resultSet.getDouble("AverageRating");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
               Model.Connection.end();
            }
        }
        return averageRating;
    }
     
     public static int getTotalProductCount() {
    int totalCount = 0;
    Connection connection = Model.Connection.start();
    if (connection != null) {
        try {
            String query = "SELECT COUNT(*) AS TotalCount FROM product";
            try (PreparedStatement statement = connection.prepareStatement(query);
                 ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    totalCount = resultSet.getInt("TotalCount");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Model.Connection.end();
        }
    }
    return totalCount;
}

public static int getTotalCustomerCount() {
    int totalCount = 0;
    Connection connection = Model.Connection.start();
    if (connection != null) {
        try {
            String query = "SELECT COUNT(*) AS TotalCount FROM customer";
            try (PreparedStatement statement = connection.prepareStatement(query);
                 ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    totalCount = resultSet.getInt("TotalCount");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Model.Connection.end();
        }
    }
    return totalCount;
}

     
     
     
    
}
