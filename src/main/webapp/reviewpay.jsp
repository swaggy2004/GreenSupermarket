<%-- 
    Document   : reviewpay
    Created on : 21 Dec 2023, 23:51:48
    Author     : Jude Darren Victoria
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Review</title>
    <style type="text/css">
        table { border: 0; }
        table td { padding: 5px; }
    </style>
</head>
<body>
    <%
    
    // Get the orderId from the session
        
        Integer orderId = (Integer) session.getAttribute("orderID");

        // Debugging: Print orderId to console
        System.out.println("orderId from session: " + orderId);
    
    
    
    %>
    <%@ include file="header.jsp"%> 
    <div align="center">
        <h1 style="margin-top:2rem; margin-bottom:1rem ">Please Review Before Paying</h1>
        <form action="execute_payment" method="post">
            <table>
                <!-- Transaction Details -->
                <tr>
                    <td colspan="2"><b>Transaction Details:</b></td>
                    <td>
                        <input type="hidden" name="paymentId" value="${param.paymentId}" />
                        <input type="hidden" name="PayerID" value="${param.PayerID}" />
                    </td>
                </tr>
                <tr>
                    <td>Description:</td>
                    <td>${transaction.description}</td>
                </tr>
                <tr>
                    <td>Subtotal:</td>
                    <td>${transaction.amount.details.subtotal} USD</td>
                </tr>
                <tr>
                    <td>Shipping:</td>
                    <td>${transaction.amount.details.shipping} USD</td>
                </tr>              
                <tr>
                    <td>Total:</td>
                    <td>${transaction.amount.total} USD</td>
                </tr>

                <!-- Payer Information -->
                <tr><td><br/></td></tr>
                <tr>
                    <td colspan="2"><b>Payer Information:</b></td>
                </tr>
                <tr>
                    <td>First Name:</td>
                    <td>${payer.firstName}</td>
                </tr>
                <tr>
                    <td>Last Name:</td>
                    <td>${payer.lastName}</td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td>${payer.email}</td>
                </tr>

                <!-- Shipping Address -->
                <tr><td><br/></td></tr>
                <tr>
                    <td colspan="2"><b>Shipping Address:</b></td>
                </tr>
                <tr>
                    <td>Recipient Name:</td>
                    <td>${shippingAddress.recipientName}</td>
                </tr>
                <tr>
                    <td>Line 1:</td>
                    <td>${shippingAddress.line1}</td>
                </tr>
                <tr>
                    <td>City:</td>
                    <td>${shippingAddress.city}</td>
                </tr>
                <tr>
                    <td>Country Code:</td>
                    <td>${shippingAddress.countryCode}</td>
                </tr>
                <tr>
                    <td>Postal Code:</td>
                    <td>${shippingAddress.postalCode}</td>
                </tr>
                <tr>
                    <td colspan="2"></td>
                </tr>

                <!-- Submit Button -->
                <tr>
                    <td colspan="2" align="center">
                        <input style="margin:2rem" class="btn btn-success" type="submit" value="Pay Now" />
                    </td>
                </tr>
                
            </table>
                <p style="text-align: center; color:red;">The attached receipt above is final, covering all charges you are subject to.<br> Kindly note, payments are non-refundable after paid even on post-cancellation.</p>
        </form>
    </div>
    <%@ include file="footer.jsp"%>
</body>
</html>
