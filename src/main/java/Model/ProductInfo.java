/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author DELL
 */
public class ProductInfo {
    private String ProductID;
    private String ProductName;
    private int UnitQuantity;
    private float UnitPrice;
    private String ImagePath; 
    
    
    
    public ProductInfo(){}
   
    public ProductInfo(String ProductID, String ProductName, int UnitQuantity, float UnitPrice, String ImagePath)
    {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.UnitQuantity = UnitQuantity;
        this.UnitPrice = UnitPrice;
        this.ImagePath = ImagePath;
        
    }

    public String getProductID() {
        return this.ProductID;
    }

    public void setProductID(String ProductID) {
        this.ProductID = ProductID;
    }

    public String getProductName() {
        return this.ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

     public int getUnitQuantity() {
        return this.UnitQuantity;
    }

    public void setUnitQuantity(int UnitQuantity) {
        this.UnitQuantity = UnitQuantity;
    }
    
    public float getUnitPrice() {
        return this.UnitPrice;
    }

    public void setUnitPrice(float UnitPrice) {
        this.UnitPrice = UnitPrice;
    }
     public String getImagePath() {
        return this.ImagePath;
    }

    public void setImagePath(String ImagePath) {
        this.ImagePath = ImagePath;
    }
}
