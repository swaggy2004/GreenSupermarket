/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.shaveen.greensupermarket;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import paypalpayment.OrderDAO;
import paypalpayment.PlainTextEmailSender;
import jakarta.servlet.annotation.WebServlet;

/**
 *
 * @author Jude Darren Victoria
 */
@WebServlet(name = "DeleteOrderServlet", urlPatterns = {"/DeleteOrderServlet"})
public class DeleteOrderServlet extends HttpServlet {

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
            out.println("<title>Servlet DeleteOrderServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteOrderServlet at " + request.getContextPath() + "</h1>");
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
            // Get the order ID from the request
            String orderID = request.getParameter("orderId");
            int orderId = Integer.parseInt(orderID);

            // Delete the order
            OrderDAO.deleteOrder(orderId);
            
            String customerEmail = (String) request.getSession().getAttribute("email");
            
            sendOrderCancellationEmail(orderId, customerEmail);

            // Redirect to a confirmation page or handle as needed
            response.sendRedirect("UserDashboard.jsp");
        } catch (Exception e) {
            // Handle exceptions
        }
        
               
    }
    
    
     public void sendOrderCancellationEmail(int orderNumber,String customerEmail) {
                String host = "smtp-relay.brevo.com";
                String port = "587";
                String mailFrom = "greensupermarketa@gmail.com";
                String password = "IaWxFzTVJm7bKQ49";

                // Outgoing message information
                String subject = "Order Cancellation - Order No " + orderNumber;
                String message = "We regret to inform you that your order with Order Number " + orderNumber + " has been canceled. " + "\n\n\n"
                        + "If you have any questions or concerns, please contact our customer support. "
                        + "We apologize for any inconvenience this may have caused.";

                PlainTextEmailSender mailer = new PlainTextEmailSender();

                try {
                    mailer.sendPlainTextEmail(host, port, mailFrom, password, customerEmail,
                            subject, message);
                    System.out.println("Cancellation Email sent.");
                } catch (Exception ex) {
                    System.out.println("Failed to send cancellation email.");
                    ex.printStackTrace();
                }
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
