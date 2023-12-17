/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author DELL
 */
public class ProductEdit {
    private String ProductID;
    private String ProductName;
    private int UnitQuantity;
    private float UnitPrice;
    private String ImagePath;
    private String Category;
    private String Description;
    private Boolean Visibility;

public ProductEdit(){}

public ProductEdit(String ProductID, String ProductName, int UnitQuantity, float UnitPrice, String ImagePath, String Category, String Description, Boolean Visibility)
    {
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.UnitQuantity = UnitQuantity;
        this.UnitPrice = UnitPrice;
        this.ImagePath = ImagePath;
        this.Category = Category;
        this.Description = Description;
        this.Visibility = Visibility;
        
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
    public String getCategory() {
        return this.Category;
    }

    public void setCategory(String Category) {
        this.Category = Category;
    }
    
    public String getDescription() {
        return this.Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }
    
    public Boolean getVisibility() {
        return this.Visibility;
    }

    public void setVisibility(Boolean Visibility) {
        this.Visibility = Visibility;
    }

}