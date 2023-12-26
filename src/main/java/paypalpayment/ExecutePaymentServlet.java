/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package paypalpayment;

import Model.EOrderDetail;
import Model.OrderProduct;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;


import com.paypal.api.payments.*;
import com.paypal.base.rest.PayPalRESTException;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Jude Darren Victoria
 */
@WebServlet("/execute_payment")
public class ExecutePaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

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
            out.println("<title>Servlet ExecutePaymentServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ExecutePaymentServlet at " + request.getContextPath() + "</h1>");
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
        
        String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");
 
        try {
            PaymentServices paymentServices = new PaymentServices();
            Payment payment = paymentServices.executePayment(paymentId, payerId);
             
            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);
             
            request.setAttribute("payer", payerInfo);
            request.setAttribute("transaction", transaction); 
            
//            HttpSession session = request.getSession();
            
            HttpSession session = request.getSession();
            
            Integer orderId = (Integer) session.getAttribute("orderID");

        // Debugging: Print orderId to console
        System.out.println("orderId from session: " + orderId);
        
       
         

        OrderDAO.updateOrderStatusPlaced(orderId);
        
        EOrderDetail orderDetails = OrderDAO.getOrderDetails(orderId);
        
            
            
                   int orderNumber = orderId;
                   String orderDate = orderDetails.getOrderDate();
                   String customerEmail = orderDetails.getCustomerEmail();
                   float totalPrice = orderDetails.getTotalPrice();
        
            
            
                   String host = "smtp-relay.brevo.com";
                   String port = "587";
                   String mailFrom = "greensupermarketa@gmail.com";
                   String password = "IaWxFzTVJm7bKQ49";

                   // outgoing message information
                   
                   String subject = "Order Confirmation - Order No" + orderNumber ;
                   String message = "Thank you for choosing Green Supermarket for your recent purchase! " +
                "We are thrilled to confirm that your order has been successfully received and is currently being processed.\n\n\n" +
                "Order Number: " + orderNumber + "\n" +
                " Order Date: " + orderDate + "\n" +
                "Total Price: " + totalPrice + "\n" +
                "Customer Email: " +customerEmail  ;
                   
                   
                   PlainTextEmailSender mailer = new PlainTextEmailSender();

                   try {
                       mailer.sendPlainTextEmail(host, port, mailFrom, password, customerEmail,
                               subject, message);
                       System.out.println("Email sent.");
                   } catch (Exception ex) {
                       System.out.println("Failed to sent email.");
                       ex.printStackTrace();
                   }
                       
            request.getRequestDispatcher("receipt.jsp").forward(request, response);
             
        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            request.getRequestDispatcher("Error.jsp").forward(request, response);
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
