/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.shaveen.greensupermarket;

import Model.ManagerAccount;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.*;
/**
 *
 * @author Shaveen
 */
public class ManageConnection {
    
//    public void SetResponse(HttpServletResponse response){
//        
//    }
    public List<ManagerAccount> getAccounts() {
        List<ManagerAccount> accounts = new ArrayList<>();

        try {
            Connection con = Model.Connection.start();

            String query = "SELECT Email, Type, Fname, Lname FROM manager";
            try (PreparedStatement statement = con.prepareStatement(query)) {
                ResultSet resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    String email = resultSet.getString("Email");
                    String role = resultSet.getString("Type");
                    String fname = resultSet.getString("Fname");
                    String lname = resultSet.getString("Lname");

                    ManagerAccount account = new ManagerAccount(fname, lname, email, role);
                    accounts.add(account);
                }
            }
        } catch (Exception e) {
            // Ignore
            e.printStackTrace(); // Handle the exception appropriately in a real application
        }

        return accounts;
    }
    public void addAccount(String fullName, String email, String pwd, String role) {
        try {
            var con = Model.Connection.start();
            
            String[] parts = fullName.split(" ");
            String fname = parts[0];
            String lname = parts[1];
            String query = "INSERT INTO manager(Email, Pwd, Type, Fname, Lname) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement statement = con.prepareStatement(query)) {
                statement.setString(1, email);
                statement.setString(2, pwd);
                statement.setString(3, role);
                statement.setString(4, fname);
                statement.setString(5, lname);

                int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) {
                    System.out.println("Account added successfully!");
                } else {
                    System.out.println("Failed to add account.");
                }
                con.close();
            }
            catch(Exception e){
                System.out.println(e);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    
}
