/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.shaveen.greensupermarket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static java.lang.System.out;

/**
 *
 * @author Jude Darren Victoria
 */
public class UserDatabaseInteraction {
        public static UserData getUserData(String email) {
        // Connect to the database
        try (Connection connection = Model.Connection.start()) {
            String query = "SELECT * FROM customer WHERE Email = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, email);

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        // Retrieve user data from the result set
                        UserData userData = new UserData();
                        userData.setEmail(resultSet.getString("Email"));
                        userData.setFullName(resultSet.getString("FullName"));
                        userData.setPhoneNumber(resultSet.getString("PhoneNumber"));
                        userData.setAvatarPath(resultSet.getString("AvatarPath"));
                        userData.setBA_Adress(resultSet.getString("BA_Address"));
                        userData.setBA_Region(resultSet.getString("BA_Region"));
                        userData.setBA_City(resultSet.getString("BA_City"));
                        userData.setBA_ZipCode(resultSet.getString("BA_ZipCode"));
                        userData.setBA_PhoneNumber(resultSet.getString("BA_PhoneNumber"));
                        userData.setSA_Adress(resultSet.getString("SA_Address"));
                        userData.setSA_Region(resultSet.getString("SA_Region"));
                        userData.setSA_City(resultSet.getString("SA_City"));
                        userData.setSA_ZipCode(resultSet.getString("SA_ZipCode"));
                        userData.setSA_PhoneNumber(resultSet.getString("SA_PhoneNumber"));
                        // Retrieve other fields as needed

                        return userData;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void updateUserData(String email,  String fullName, String phoneNumber) {
        // Connect to the database and update user data
        try (Connection connection = Model.Connection.start()) {
            String query = "UPDATE customer SET FullName = ?, PhoneNumber = ? WHERE Email = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, fullName);
                preparedStatement.setString(2, phoneNumber);
                preparedStatement.setString(3, email);

                // Execute the update query
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static boolean validateUserPassword(String email, String currentPassword) {
        try (Connection connection = Model.Connection.start()) {
            String query = "SELECT Pwd FROM customer WHERE Email = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, email);

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        // Retrieve stored password from the result set
                        String storedPassword = resultSet.getString("Pwd");

                        // Compare stored password with the provided current password
                        return currentPassword.equals(storedPassword);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void updateUserPassword(String email, String newPassword) {
        // Connect to the database and update user password
        try (Connection connection = Model.Connection.start()) {
            String query = "UPDATE customer SET Pwd = ? WHERE Email = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, newPassword);
                preparedStatement.setString(2, email);

                // Execute the update query
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    
     public static void deleteUserAccount(String email) {
        // Connect to the database and delete the user account
        try (Connection connection = Model.Connection.start()) {
            String query = "DELETE FROM customer WHERE Email = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, email);

                // Execute the delete query
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
     
     
    public static int getTotalOrdersCount(String email) {
        int totalOrdersCount = 0;

        try (Connection connection = Model.Connection.start();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT COUNT(*) FROM placed_order WHERE CEmail = ?")) {

            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                totalOrdersCount = resultSet.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exceptions appropriately
        }

        return totalOrdersCount;
    }
    
    
    public static int getCompletedOrdersCount(String email) {
        int completedOrdersCount = 0;

        try (Connection connection = Model.Connection.start();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT COUNT(*) FROM placed_order WHERE CEmail = ? AND OrderStatus_Delivered = 1")) {

            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                completedOrdersCount = resultSet.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exceptions appropriately
        }

        return completedOrdersCount;
    }
    
    
    public static List<OrderData> getAllOrders(String userEmail) {
        List<OrderData> orderList = new ArrayList<>();
        Connection connection = Model.Connection.start();

        try {
            String query = "SELECT * FROM placed_order WHERE CEmail = ?";

            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, userEmail);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {

                        OrderData order = new OrderData();
                        order.setOrderID(resultSet.getInt("OrderID"));
                        order.setOrderDate(resultSet.getDate("OrderDate"));                    
                        order.setOrderStatusPlaced(resultSet.getInt("OrderStatus_Placed"));
                        order.setOrderStatusPackaging(resultSet.getInt("OrderStatus_Packaging"));
                        order.setOrderStatusDelivered(resultSet.getInt("OrderStatus_Delivered"));
                        order.setOrderStatusPackageTime(resultSet.getTimestamp("OrderStatus_PackageTime"));
                        order.setOrderStatusOrderPlacedTime(resultSet.getTime("OrderStatus_OrderPlacedTime"));
                        order.setOrderStatusDeliveredTime(resultSet.getTimestamp("OrderStatus_DeliveredTime"));
                        order.setCustomerEmail(resultSet.getString("CEmail"));
                        order.setFeedbackID(resultSet.getInt("FeedbackID"));

                        System.out.println("OrderID: " + order.getOrderID());
                        System.out.println("OrderDate: " + order.getOrderDate());
                       


                        orderList.add(order);
                    }
                }
            }
        } catch (SQLException e) {

            e.printStackTrace();
            // Handle exception


        }



        // Close connection if needed

        
        return orderList;
    }
    
   
    
    
    
   
}
