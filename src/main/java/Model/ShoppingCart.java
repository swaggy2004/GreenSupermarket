/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.List;

/**
 *
 * @author Shaveen
 */
public class ShoppingCart {
    private int CartID;
    private int ProductQty;
    public ShoppingCart(){};
    public ShoppingCart(int CartID, int ProductQty){
       this.CartID = CartID;
       this.ProductQty = ProductQty;
    }
    public int getCartID() {
        return CartID;
    }

    public void setCartID(int CartID) {
        this.CartID = CartID;
    }

    public int getProductQty() {
        return ProductQty;
    }

    public void setProductQty(int ProductQty) {
        this.ProductQty = ProductQty;
    }
}
