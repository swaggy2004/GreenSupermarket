/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Jude Darren Victoria
 */
public class OrderProduct {

    private int productId;
    private String name;
    private int quantity;
    private float unitPrice;
    
    /**
     * Default constructor for OrderProduct.
     */
    public OrderProduct() {
        // Default constructor
    }

    /**
     * Parameterized constructor for OrderProduct.
     * 
     * @param productId  The ID of the product.
     * @param name       The name of the product.
     * @param quantity   The quantity of the product.
     * @param unitPrice  The unit price of the product.
     */
    public OrderProduct(int productId, String name, int quantity, float unitPrice) {
        this.productId = productId;
        this.name = name;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
    }

    /**
     * @return the productId
     */
    public int getProductId() {
        return productId;
    }

    /**
     * @param productId the productId to set
     */
    public void setProductId(int productId) {
        this.productId = productId;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the quantity
     */
    public int getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    /**
     * @return the unitPrice
     */
    public float getUnitPrice() {
        return unitPrice;
    }

    /**
     * @param unitPrice the unitPrice to set
     */
    public void setUnitPrice(float unitPrice) {
        this.unitPrice = unitPrice;
    }
}
