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
}
