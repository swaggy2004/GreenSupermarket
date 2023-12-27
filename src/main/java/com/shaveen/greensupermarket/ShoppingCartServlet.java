/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.shaveen.greensupermarket;

import Model.Product;
import Model.ShoppingCart;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Shaveen
 */

public class ShoppingCartServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ShoppingCartServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShoppingCartServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String customerEmail = request.getParameter("customerEmail");

        if (customerEmail != null && !customerEmail.isEmpty()) {
            List<ShoppingCart> cartList = null;
            try {
                // Search for items in the shopping cart based on customer email
                cartList = FetchShoppingCart.searchCart(customerEmail);
            } catch (SQLException ex) {
                Logger.getLogger(ShoppingCartServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
                List<Product> products = null;
            for (ShoppingCart cartItem : cartList) {
                int productId = cartItem.getPID();
                products = FetchProduct.SearchProduct(productId);
            }

            // Store the productList in request attribute
            request.setAttribute("products", products);

            // Forward the request to MyCart.jsp for display
            request.getRequestDispatcher("/MyCart.jsp").forward(request, response);
        } else {
            // Handle the case where customerEmail is not provided
            response.getWriter().println("Customer email not provided.");
        }
    }
}
