/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author DELL
 */
public class OrderProductNew {
    private int ProductID;
    private String PName;
    private int OPqt;
    private float PPrice;
    
    /**
     * Default constructor for OrderProduct.
     */
    public OrderProductNew() {
        // Default constructor
    }

    /**
     * Parameterized constructor for OrderProduct.
     * 
     * @param ProductID  The ID of the product.
     * @param PName       The PName of the product.
     * @param OPqt   The OPqt of the product.
     * @param PPrice  The unit price of the product.
     */
    public OrderProductNew(int ProductID, String PName, int OPqt, float PPrice) {
        this.ProductID = ProductID;
        this.PName = PName;
        this.OPqt = OPqt;
        this.PPrice = PPrice;
    }

    /**
     * @return the ProductID
     */
    public int getProductId() {
        return this.ProductID;
    }

    /**
     * @param ProductID the ProductID to set
     */
    public void setProductId(int ProductID) {
        this.ProductID = ProductID;
    }

    /**
     * @return the PName
     */
    public String getName() {
        return this.PName;
    }

    /**
     * @param PName the PName to set
     */
    public void setName(String PName) {
        this.PName = PName;
    }

    /**
     * @return the OPqt
     */
    public int getQuantity() {
        return this.OPqt;
    }

    /**
     * @param OPqt the OPqt to set
     */
    public void setQuantity(int OPqt) {
        this.OPqt = OPqt;
    }

    /**
     * @return the PPrice
     */
    public float getUnitPrice() {
        return this.PPrice;
    }

    /**
     * @param PPrice the PPrice to set
     */
    public void setUnitPrice(float PPrice) {
        this.PPrice = PPrice;
    }
}
