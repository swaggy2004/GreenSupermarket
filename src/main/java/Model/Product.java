/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Shaveen
 */
public class Product {
    private String ProductID;
    private String ProductName;
    private int UnitQty; 
    private int StockQty;
    private float Price;
    private String Category;
    private Boolean Visibility;
    private String Description;
    
    public void Product() {}
    
    public void Product(String ProductID, String ProductName, int UnitQty, int StockQty, String Category, Boolean Visibility, String Description, float Price){
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.UnitQty = UnitQty;
        this.StockQty = StockQty;
        this.Category = Category;
        this.Visibility = Visibility;
        this.Description = Description;
        this.Price = Price;
    }

    public float getPrice() {
        return this.Price;
    }

    public void setPrice(float Price) {
        this.Price = Price;
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

    public int getUnitQty() {
        return this.UnitQty;
    }

    public void setUnitQty(int UnitQty) {
        this.UnitQty = UnitQty;
    }

    public int getStockQty() {
        return this.StockQty;
    }

    public void setStockQty(int StockQty) {
        this.StockQty = StockQty;
    }

    public String getCategory() {
        return this.Category;
    }

    public void setCategory(String Category) {
        this.Category = Category;
    }

    public Boolean getVisibility() {
        return this.Visibility;
    }

    public void setVisibility(Boolean Visibility) {
        this.Visibility = Visibility;
    }

    public String getDescription() {
        return this.Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }
}
