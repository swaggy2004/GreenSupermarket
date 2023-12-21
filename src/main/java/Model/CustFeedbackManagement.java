/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author DELL
 */
public class CustFeedbackManagement {
    private int FeedbackID;
    private int FeedbackRating;
//  private String FeedbackText;
    private String FeedbackTime;
    private String CName;
    public CustFeedbackManagement(){}
    
        public CustFeedbackManagement(int FeedbackID, int FeedbackRating, String CName,String FeedbackTime) {
        this.FeedbackID = FeedbackID;
        this.FeedbackRating = FeedbackRating;
//        this.FeedbackText = FeedbackText;
        this.FeedbackTime = FeedbackTime;
        this.CName = CName;

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
    
//    public String getFeedbackText() {
//        return this.FeedbackText;
//    }

//    public void setFeedbackText(String FeedbackText) {
//        this.FeedbackText = FeedbackText;
//    }
    
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

}
