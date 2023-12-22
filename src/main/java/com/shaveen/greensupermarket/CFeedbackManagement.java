/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.shaveen.greensupermarket;

import Model.CustFeedbackManagement;
import java.sql.*;
import java.util.*;
/**
 *
 * @author DELL
 */
public class CFeedbackManagement {
    public static List<CustFeedbackManagement> getCustFeedbackManagement(){
    List<CustFeedbackManagement> CustFeedbackManagements = new ArrayList<>();
     try{
      var con = Model.Connection.start();
      
//      String query = "SELECT FeedbackID , FeedbackRating, FeedbackText, FeedbackTime  from feedback";
        String query = "SELECT f.FeedbackID, f.FeedbackRating, f.FeedbackText, f.FeedbackTime, c.FullName " +
               "FROM feedback f " +
               "JOIN  placed_order po ON f.FeedbackID = po.FeedbackID " +
               "JOIN customer c ON po.CEmail = c.Email";
        PreparedStatement statement= con.prepareStatement(query);
      
      
      ResultSet set = statement.executeQuery();
      while(set.next()){
        CustFeedbackManagement custfeedbackmanagement = new CustFeedbackManagement();
        custfeedbackmanagement.setFeedbackID(set.getInt("FeedbackID"));
        custfeedbackmanagement.setFeedbackRating(set.getInt("FeedbackRating"));
//        custfeedbackmanagement.setFeedbackText(set.getString("FeedbackText"));
        custfeedbackmanagement.setFeedbackTime(set.getString("FeedbackTime"));
        custfeedbackmanagement.setCName(set.getString("FullName"));
        CustFeedbackManagements.add(custfeedbackmanagement);
      }
     }
      
     catch(SQLException exception){
      exception.printStackTrace();
     }
     return CustFeedbackManagements;
    }
}
