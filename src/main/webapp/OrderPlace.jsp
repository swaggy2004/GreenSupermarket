<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Place Order</title>
</head>
<body>
    <%@ include file="header.jsp"%> 
    <h2>Place Your Order</h2>
    
    <form action="authorize_payment" method="post">
        
        OrderID: <input type="text" name="orderID"  id="orderID" required>
        Shipping: <input type="text" name="shipping"  id="shipping" required>
        Tax: <input type="text" name="tax"  id="tax" required>
        
        <br><br>
        
        <input type="submit" value="Place Order">
    </form>
    <%@ include file="footer.jsp"%>
</body>
</html>
