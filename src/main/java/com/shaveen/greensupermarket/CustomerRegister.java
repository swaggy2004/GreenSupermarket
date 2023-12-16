/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.shaveen.greensupermarket;

import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Jude Darren Victoria
 */
public class CustomerRegister {
    public int addAccount(String Fullname, String Email, String pno, String password)  {
        try {
            var con = Model.Connection.start();
            
            String query = "INSERT INTO Customer(FullName,Email,PhoneNumber,Pwd) VALUES (?, ?, ?, ?)";
            try (PreparedStatement statement = con.prepareStatement(query)) {
                statement.setString(1, Fullname);
                statement.setString(2, Email);
                statement.setString(3, pno);
                statement.setString(4, password);

                int rowsInserted = statement.executeUpdate();
                con.close();
                if (rowsInserted > 0) {
                    System.out.println("Account added successfully!");
                    return 0;
                } else {
                    System.out.println("Failed to add account.");
                    return -1;
                }
                
            } catch (SQLException e) {
                // Re-throw the SQLException to be caught in the calling method (servlet)
                
                return -2;
            } catch (Exception e) {
                return -3;
            }
        } catch (Exception e) {
            return -4;
        }
    }
}
