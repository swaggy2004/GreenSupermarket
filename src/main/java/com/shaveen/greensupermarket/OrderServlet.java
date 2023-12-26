/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.shaveen.greensupermarket;

import Model.Order;
import Model.Product;
import Model.ShoppingCart;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Shaveen
 */
public class OrderServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            HttpSession session = request.getSession();
            String email = (String) session.getAttribute("email");

            if (email != null) {
                List<ShoppingCart> cart = FetchShoppingCart.searchCart(email);
                float totPrice = 0;

                for (ShoppingCart item : cart) {
                    int productId = item.getPID();
                    System.out.println("ProductID = " + productId);
                    Product product = FetchProduct.searchProduct(productId);
                    System.out.println("Product = " + product.getProductName());
                    totPrice += item.getPQty() * product.getPrice();
                }

                // Create an order and set customer details
                Order order = new Order();
                order.setCEmail(email);
                order.setTotalPrice(totPrice);

                // Insert order details into the database and retrieve the order ID
                int orderID = 0;
                try {
                    orderID = OrderCustomerDAO.insertOrderDetails(order);
                } catch (Exception ex) {
                    Logger.getLogger(OrderServlet.class.getName()).log(Level.SEVERE, null, ex);
                }

                // Set the order ID in the session attribute
                session.setAttribute("orderID", orderID);
                System.out.println("Order ID stored in session: " + session.getAttribute("orderID"));
                
//
//                // Redirect to a confirmation page or do further processing
//                response.sendRedirect("orderConfirmation.jsp");  // Adjust the URL accordingly

            } else {
//                // Handle the case where the email is not set in the session
//                // You might want to redirect the user to a login page or take appropriate action
//                response.sendRedirect("login.jsp");  // Adjust the URL accordingly
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderServlet.class.getName()).log(Level.SEVERE, null, ex);
//            // Handle the SQL exception appropriately (e.g., display an error message)
//            response.sendRedirect("error.jsp");  // Adjust the URL accordingly
        }
        
        response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/authorize_payment"));
    }


    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
