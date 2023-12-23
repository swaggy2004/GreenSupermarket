/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;



/**
 *
 * @author DELL
 */
public class IndividualProdOrderManagement {
     
    private int ProductQuantity;
    private String ProductName;
    private float ProductPrice;
    
    public IndividualProdOrderManagement(){} 
    
    public IndividualProdOrderManagement(String ProductName,float ProductPrice,int ProductQuantity){
    
    
    this.ProductQuantity = ProductQuantity;
    this.ProductName = ProductName;
    this.ProductPrice = ProductPrice;
       
    } 


public int getProductQuantity() {
    return this.ProductQuantity;
}

public void setProductQuantity(int ProductQuantity) {
    this.ProductQuantity = ProductQuantity;
}

public String getProductName() {
    return this.ProductName;
}

public void setProductName(String ProductName) {
    this.ProductName = ProductName;
}

public float getProductPrice() {
    return this.ProductPrice;
}

public void setProductPrice(float ProductPrice) {
    this.ProductPrice = ProductPrice;
}


}
