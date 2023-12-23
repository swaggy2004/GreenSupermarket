/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
/**
 *
 * @author Shaveen
 */
public class Connection {
   static java.sql.Connection con;
   
   private static final String CONNECTION_URL = "jdbc:mysql://localhost:3306/greensupermarket";
   private static final String USERNAME = "root";
   private static final String PASSWORD = "";
   
   public static java.sql.Connection tryGetConnection(){
       try{
           if (!con.isClosed()) return con;
       }
       catch (Exception e){
           return null;
       }
       return null;
   }
   public static java.sql.Connection start(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
            return con;
       }
       catch (Exception e){
           return null;
       }
   }
   
   public static void end(){
       try{       
           if (!con.isClosed());
            con.close();
       }
       catch (Exception ex)
       {
           // ignored
       }
   }
}
