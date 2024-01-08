/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.shaveen.greensupermarket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author Jude Darren Victoria
 */
public class  LoginValidation {
    
    public static boolean validateLogin(String email, String password) {
        try {
            Connection connection = Model.Connection.start();
            String query = "SELECT Pwd FROM customer WHERE Email = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, email);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()){
                        String hashedPwd = resultSet.getString("Pwd");
                        System.out.println(hashedPwd);
                        return BCrypt.checkpw(password, hashedPwd);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
}
