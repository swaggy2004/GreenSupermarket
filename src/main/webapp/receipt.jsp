<%-- 
    Document   : receipt.jsp
    Created on : 22 Dec 2023, 00:42:19
    Author     : Jude Darren Victoria
--%>
<%@page import="paypalpayment.OrderDAO"%>
<%@page import="Model.OrderProductNew"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>

<!DOCTYPE html>
<%
    Integer orderID = (Integer) session.getAttribute("orderID");

    // Ensure orderID is not null (add your logic to handle null or invalid orderID)
    if (orderID == null) {
        // Handle the case where orderID is not available in the session
        // You may redirect the user to an error page or perform some other action
        response.sendRedirect("error.jsp");
    }
    
    List<OrderProductNew> orderProductsnew = OrderDAO.getOrderProductsByOrderID(orderID);
    pageContext.setAttribute("orderProductsnew", orderProductsnew);
    
    OrderDAO.updateProductStockQuantity(orderID);
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Receipt</title>
    <style type="text/css">
        table { border: 0; }
        table td { padding: 5px; }
    </style>
</head>
<body>
    <c:set var="orderID" value="${sessionScope.orderID}" />
    <%@ include file="header.jsp"%> 
<div align="center">
    <h1 class="mt-4 text-wrap">Payment Done. Thank you for purchasing our products</h1>
    <br/>
    <h2>Receipt Details:</h2>
    <table border="1">
        <tr>
            <td><b>Merchant:</b></td>
            <td>Green SuperMarket</td>
        </tr>
        <tr>
            <td colspan="2"><b>Payers Details</b></td>
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
            <td><b>Description:</b></td>
            <td>${transaction.description}</td>
        </tr>
        <tr>
            <td><b>Products:</b></td>
            <td>
                <table>
                    <tr>
                        <th>Name</th>
                        <th>Quantity</th>
                        <th>Unit Price</th>
                        <th>Subtotal</th>
                    </tr>
                    <c:forEach items="${orderProductsnew}" var="product">
                        <tr>
                            <td>${product.getName()}</td>
                            <td>${product.getQuantity()}</td>
                            <td>${product.getUnitPrice()} USD</td>
                            <td>${String.format("%.2f", product.getQuantity() * product.getUnitPrice())} USD</td>
                        </tr>
                    </c:forEach>

                </table>
            </td>
        </tr>
        <tr>
            <td><b>Shipping:</b></td>
            <td>$ 1</td>
        </tr>
    </table>
    <a class="btn btn-success my-4" href="OrderStatus1.jsp?orderId=${orderID}" >View Details</a>
</div>
<%@ include file="footer.jsp"%>
        
</body>
</html>