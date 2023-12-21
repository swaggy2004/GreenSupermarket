/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author DELL
 */
public class IndividualFeedbackManagement {
    private int FeedbackID;
    private int FeedbackRating;
    private String FeedbackText;
    private String FeedbackTime;
    private String CName;
    private int OrderID;
    private String CAvatar;
    
    
    
    public IndividualFeedbackManagement(){}
    
        public IndividualFeedbackManagement(int FeedbackID, int FeedbackRating, String CName,String FeedbackTime,String FeedbackText,int OrderID,String CAvatar) {
        this.FeedbackID = FeedbackID;
        this.FeedbackRating = FeedbackRating;
        this.FeedbackText = FeedbackText;
        this.FeedbackTime = FeedbackTime;
        this.CName = CName;
        this.OrderID = OrderID;
        this.CAvatar = CAvatar;

        }
        
    public int getFeedbackID() {
        return this.FeedbackID;
    }

    public void setFeedbackID(int FeedbackID) {
        this.FeedbackID = FeedbackID;
    }
    
    public int getFeedbackRating() {
        return this.FeedbackRating;
    }

    public void setFeedbackRating(int FeedbackRating) {
        this.FeedbackRating = FeedbackRating;
    }
    
    public String getFeedbackText() {
        return this.FeedbackText;
    }

    public void setFeedbackText(String FeedbackText) {
        this.FeedbackText = FeedbackText;
    }
    
    public String getFeedbackTime() {
        return this.FeedbackTime;
    }

    public void setFeedbackTime(String FeedbackTime) {
        this.FeedbackTime = FeedbackTime;
    }
    
    public String getCName() {
        return this.CName;
    }

    public void setCName(String CName) {
        this.CName = CName;
    }
    
    public int getOrderID() {
        return this.OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }
    
    public String getCAvatar() {
        return this.CAvatar;
    }

    public void setCAvatar(String CAvatar) {
        this.CAvatar = CAvatar;
    }
  
}
