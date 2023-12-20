/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author DELL
 */
public class ProductStock {
    
    private String ProductID;
    private String ProductName;
    private int StockQty;
    
    public  ProductStock() {}
    
    public  ProductStock(String ProductID, String ProductName, int StockQty){
        this.ProductID = ProductID;
        this.ProductName = ProductName;
        this.StockQty = StockQty;
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

    
    public int getStockQty() {
        return this.StockQty;
    }

    public void setStockQty(int StockQty) {
        this.StockQty = StockQty;
    }

}
