/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.List;

/**
 *
 * @author Jude Darren Victoria
 */
public class OrderDetail {

    /**
     * @return the shipping
     */
    public String getShipping() {
        return shipping;
    }

    /**
     * @param shipping the shipping to set
     */
    public void setShipping(String shipping) {
        this.shipping = shipping;
    }

    /**
     * @return the tax
     */
    public String getTax() {
        return tax;
    }

    /**
     * @param tax the tax to set
     */
    public void setTax(String tax) {
        this.tax = tax;
    }
    
    private String shipping = "10.00"; // Example shipping cost
    private String tax = "5.00";
    
    private List<OrderProduct> products;
    private float total;

    /**
     * @return the products
     */
    public List<OrderProduct> getProducts() {
        return products;
    }

    /**
     * @param products the products to set
     */
    public void setProducts(List<OrderProduct> products) {
        this.products = products;
    }


    /**
     * @return the total
     */
    public float getTotal() {
        return total;
    }

    /**
     * @param total the total to set
     */
    public void setTotal(float total) {
        this.total = total;
    }
    
    
    
    
     public OrderDetail(List<OrderProduct> products, float total) {
        this.products = products;
        this.total = total;
    }
     
     public String getTotalAmountWithShippingAndTax() {
    // Calculate total including shipping and tax
    double totalAmount = total +
                        Double.parseDouble(shipping) +
                        Double.parseDouble(tax);

    // Format the total amount to a string with two decimal places
    return String.format("%.2f", totalAmount);
}

    
}
