/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.shaveen.greensupermarket;

import Model.ManagerAccount;
import Model.EditAccountAdmin;
import Model.ProductInfo;
import Model.ProductEdit;
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
    /*public List<ManagerAccount> getAccounts() {
        List<ManagerAccount> accounts = new ArrayList<>();

        try {
            Connection con = Model.Connection.start();

            String query = "SELECT Email, Type, FullName, FROM manager";
            try (PreparedStatement statement = con.prepareStatement(query)) {
                ResultSet resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    String email = resultSet.getString("Email");
                    String role = resultSet.getString("Type");
                    String fullname = resultSet.getString("FullName");
                    

                    ManagerAccount account = new ManagerAccount(fullname,email,role);
                    accounts.add(account);
                }
            }
        } catch (Exception e) {
            // Ignore
            e.printStackTrace(); // Handle the exception appropriately in a real application
        }

        return accounts;
    }*/
    
    public static List<ManagerAccount> getManagerAccounts(){
    List<ManagerAccount> ManagerAccounts = new ArrayList<>();
     try{
      var con = Model.Connection.start();
      
      String query = "SELECT Email, Type, FullName from manager";
      PreparedStatement statement= con.prepareStatement(query);
      
      
      ResultSet set = statement.executeQuery();
      while(set.next()){
        ManagerAccount manageraccount = new ManagerAccount();
        manageraccount.setEmail(set.getString("Email"));
        manageraccount.setType(set.getString("Type"));
        manageraccount.setFullName(set.getString("FullName"));
        ManagerAccounts.add(manageraccount);
      }
     }
      
     catch(SQLException exception){
      exception.printStackTrace();
     }
     return ManagerAccounts;
    }
        
    public void addAccount(String FullName, String Email, String Pwd, String Role) {
        try {
            var con = Model.Connection.start();
            
           
            String query = "INSERT INTO manager(Email, Pwd, Type, FullName) VALUES (?, ?, ?, ?)";
            try (PreparedStatement statement = con.prepareStatement(query)) {
                statement.setString(1, Email);
                statement.setString(2, Pwd);
                statement.setString(3, Role);
                statement.setString(4, FullName);
               

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
    
    public static void deleteAccountByEmail(String email) {
        String query = "DELETE FROM manager WHERE Email = ?";
        try (
             var con = Model.Connection.start();
            PreparedStatement statement = con.prepareStatement(query)) {

            statement.setString(1, email);
            int rowsDeleted = statement.executeUpdate();
                if (rowsDeleted < 10) {
                    System.out.println("Account deleted successfully!");
                } else {
                    System.out.println("Failed to delete account.");
                }
                con.close();

        } catch (SQLException e) {
            e.printStackTrace(); 
        }
    }
    
    
    
    /*Below code is to get the relavant persons data from the database to display in the edit account*/
        public static EditAccountAdmin getAdmaccountByemail(String admaccemail) {
        try {
            var con = Model.Connection.start();
            
            String query = "SELECT Email,Pwd, Type, FullName FROM manager WHERE Email = ?";
            try (PreparedStatement statement = con.prepareStatement(query)) {
                statement.setString(1, admaccemail);
                ResultSet resultSet = statement.executeQuery();
                if (resultSet.next()) {
                    String email = resultSet.getString("Email");
                    String password = resultSet.getString("Pwd");
                    String type = resultSet.getString("Type");
                    String fullname = resultSet.getString("FullName");
                    
                    
            
                    return new EditAccountAdmin(fullname, email, type, password);
                } 
               
            }
                con.close();
            }catch(Exception e){
                System.out.println(e);
            }
           return null;
        
    }
    
        public void editAccount(String FullName,String Email, String Pwd, String Role) {
        try {
            var con = Model.Connection.start();
            
            String query = "UPDATE manager SET Pwd = ?, Type = ?, FullName = ? WHERE Email = ?";
            try (PreparedStatement statement = con.prepareStatement(query)) {
                statement.setString(1, Pwd);
                statement.setString(2, Role);
                statement.setString(3, FullName);
                statement.setString(4, Email);
                
             
                System.out.println("Executing SQL query:"+statement.toString());
                int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) {
                    System.out.println("Account updated successfully!");
                } else {
                    System.out.println("Failed to update Account.");
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
    
           
    public void updateAccount(String FullName,String Email, String Pwd, String Role){
        try{
            var con = Model.Connection.start();
            
            String query = "UPDATE manager SET Pwd=?, Type=?, FullName=? WHERE Email=?";
            
            try(PreparedStatement statement = con.prepareStatement(query)){
                 statement.setString(1, Pwd);
                    statement.setString(2, Role);
                    statement.setString(3, FullName);
                    statement.setString(4, Email);
                
                int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) {
                    System.out.println("Account Updated successfully!");
                } else {
                    System.out.println("Failed to Update account.");
                }
                con.close();
            }

        } catch( Exception e){
          System.out.println(e);     
        }
    }
    
    
     /* below code for product*/
    
    
    

    public void addProduct( String ProductName, String ProductCategory, Boolean Visibility, String Description, float UnitPrice, int UnitQuantity, String DbFileName) {
        try {
            var con = Model.Connection.start();
            
            String query = "INSERT INTO product(Name, Category, Visibility, Description, UnitQty, UnitPrice, ImagePath, StockQty) VALUES ( ?, ?, ?, ?, ?, ?, ?, 0)";
            try (PreparedStatement statement = con.prepareStatement(query)) {
                
                statement.setString(1, ProductName);
                statement.setString(2, ProductCategory);
                statement.setBoolean(3, Visibility);
                statement.setString(4, Description);
                 statement.setInt(5, UnitQuantity);
                 statement.setFloat(6, UnitPrice);
                statement.setString(7, DbFileName); 
                
                
                
     
                System.out.println("Executing SQL query:"+statement.toString());
                int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) {
                    System.out.println("Product added successfully!");
                } else {
                    System.out.println("Failed to add product.");
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
    
    public void editProduct(String ProductID, String ProductName, String ProductCategory, Boolean Visibility, String Description, float UnitPrice, int UnitQuantity, String DbFileName) {
        try {
            var con = Model.Connection.start();
            
            String query = "UPDATE product SET Name = ?, Category = ?, Visibility = ?, Description = ?, UnitQty = ?, UnitPrice = ?, ImagePath = ?, StockQty=0 WHERE ProductID = ?";
            try (PreparedStatement statement = con.prepareStatement(query)) {
                statement.setString(1, ProductName);
                statement.setString(2, ProductCategory);
                statement.setBoolean(3, Visibility);
                statement.setString(4, Description);
                statement.setInt(5, UnitQuantity);
                statement.setFloat(6, UnitPrice);
                statement.setString(7, DbFileName); 
                statement.setString(8, ProductID);
                
                
                
                
                 
                 
 
                System.out.println("Executing SQL query:"+statement.toString());
                int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) {
                    System.out.println("Product updated successfully!");
                } else {
                    System.out.println("Failed to update product.");
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
    
    public static void deleteProductByProductID(String productId) {
        String query = "DELETE FROM product WHERE  ProductID = ?";
        try (
             var con = Model.Connection.start();
            PreparedStatement statement = con.prepareStatement(query)) {

            statement.setString(1, productId);
            int rowsDeleted = statement.executeUpdate();
                if (rowsDeleted < 10) {
                    System.out.println("Product deleted successfully!");
                } else {
                    System.out.println("Failed to delete Product.");
                }
                con.close();

        } catch (SQLException e) {
            e.printStackTrace(); 
        }
    }
    
    
    
    /*Below is the method for the display product*/
    public static List<ProductInfo> getProductsinfo(){
        List<ProductInfo> Productsinfo = new ArrayList<>();
     try{
      var con = Model.Connection.start();
      
      String query = "SELECT Name,UnitQty,UnitPrice,ImagePath,ProductID from product";
      PreparedStatement statement= con.prepareStatement(query);
      
      
      ResultSet set = statement.executeQuery();
      while(set.next()){
        ProductInfo productinfo = new ProductInfo();
        productinfo.setProductName(set.getString("Name"));
        productinfo.setUnitQuantity(set.getInt("UnitQty"));
        productinfo.setUnitPrice(set.getFloat("UnitPrice"));
        productinfo.setImagePath(set.getString("ImagePath"));
        productinfo.setProductID(set.getString("ProductID"));
        Productsinfo.add(productinfo);
      }
     }
      
     catch(SQLException exception){
      exception.printStackTrace();
     }
     return Productsinfo;
    }
    
    
    
        public static ProductEdit getProductById(String productId) {
        try {
            var con = Model.Connection.start();
            
            String query = "SELECT ProductID,Name, Category, Visibility, Description, UnitQty, UnitPrice, ImagePath FROM product WHERE ProductID = ?";
            try (PreparedStatement statement = con.prepareStatement(query)) {
                statement.setString(1, productId);
                ResultSet resultSet = statement.executeQuery();
                if (resultSet.next()) {
                    String productID = resultSet.getString("ProductID");
                    String name = resultSet.getString("Name");
                    String category = resultSet.getString("Category");
                    Boolean visibitlity = resultSet.getBoolean("Visibility");
                    String description = resultSet.getString("Description");
                    int unitqty = resultSet.getInt("UnitQty");
                    float price = resultSet.getFloat("UnitPrice");
                    String imgpath = resultSet.getString("ImagePath");
                    
            
                    return new ProductEdit(productID, name, unitqty, price, imgpath, category, description, visibitlity);
                } 
               
            }
                con.close();
            }catch(Exception e){
                System.out.println(e);
            }
           return null;
        
    }
    
    
}
