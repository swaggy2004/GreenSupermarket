<%--
  Created by IntelliJ IDEA.
  User: Jude Darren Victoria
  Date: 06/12/2023
  Time: 07:32 pm
  To change this template use File | Se
ttings | File Templates.
--%>

<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="jakarta.servlet.http.HttpServletResponse" %>
<%@page import="com.shaveen.greensupermarket.UserDatabaseInteraction" %>
<%@page import="com.shaveen.greensupermarket.OrderData" %>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.shaveen.greensupermarket.UserData" %>
<%@page import="com.shaveen.greensupermarket.UserDatabaseInteraction" %>
<%@page isELIgnored="false" %>
<%@page import="java.io.*,java.util.*" %>
<%@page import="jakarta.servlet.*,jakarta.servlet.http.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>


<html>
<head>
    <title>User Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    
</head>
<body>
    <%@ include file="header.jsp"%> 
    
    <%
    String email = (String) session.getAttribute("email");
    boolean isLoggedIn = session.getAttribute("isLoggedIn") != null && (boolean) session.getAttribute("isLoggedIn");

    if (email == null || !isLoggedIn) {
                
        %>
        <script>
            window.location.href = "<%=request.getContextPath()%>/login.jsp";
        </script>
        <%
    } else {
        // Retrieve user data
        UserData userData = UserDatabaseInteraction.getUserData(email);
        
        int totalOrdersCount = UserDatabaseInteraction.getTotalOrdersCount(email);
//        int totalProductsCount = UserDatabaseInteraction.getTotalProductCount(email);
        
        int completedOrdersCount = UserDatabaseInteraction.getCompletedOrdersCount(email);
        
        userData.setTotalOrders(totalOrdersCount);
//        OrderData.setnumber_products(totalProductsCount);
        userData.setCompletedOrders(completedOrdersCount);
        
        // Set user data as an attribute in the request
        request.setAttribute("userData", userData);
        
        List<OrderData> orderList = UserDatabaseInteraction.getAllOrders(email);
        pageContext.setAttribute("orderList", orderList);
    }
%>






<h1 style="margin-top: 1rem ; margin-left:3rem; margin-right:3rem; ">Hello ${userData.getFullName()}</h1>
<p style="width: 30%; margin-left:3rem;">From your account dashboard. you can easily check & view your Recent Orders,
    manage your Shipping and Billing Addresses and edit your Password and Account Details.</p>

<div class="row" style="margin: 2rem 2rem 0 2rem; " >
    <div class="col" style="margin-top: 2rem;">
        <div class="card" style="min-height: 340px">
            <div class="card-header">
                Featured
            </div>
            <div class="card-body ">
                <h3 class="card-title">${userData.getFullName()}</h3>
                <p class="card-text">Email : ${userData.getEmail()}</p>
                <p class="card-text">Phone: : ${userData.getPhoneNumber()}</p>
                <a href="UserSettings.jsp" class="btn btn-success">Edit account</a>
            </div>
        </div>
    </div>
    <div class="col" style="margin-top: 2rem">
        <div class="col">
            <div class="card" style="min-height: 340px">
                <div class="card-header">
                    Address
                </div>
                <div class="card-body ">

                    <p class="card-text"> Address Line : ${userData.getSA_Adress()}  </p>
                    <p class="card-text"> City :  ${userData.getSA_City()}   </p>
                    <p class="card-text"> Zipcode :  ${userData.getSA_ZipCode()} </p>
                    <p class="card-text"> Country : ${userData.getSA_Region()}</p>
                    <p class="card-text">Phone Number: ${userData.getSA_PhoneNumber()}</p>
                    <p class="card-text">Email :  ${userData.getEmail()} </p>
                    <a href="UserSettings.jsp" class="btn btn-success">Edit address</a>
                </div>
            </div>
        </div>
    </div>
    
    
    <button class="btn btn-update" style="margin-top: 2rem; background-color: red;" onclick="logout()">Logout from Account</button>
    
    
    
    
    <div class="col" style="margin-top: 2rem">
        <div class="vstack gap-3">
            <div class="bg-light border">
                <div class="card statcard" style="max-height: 100px">
                    <div class="card-body text-left">
                        <h5 class="card-title">Total Orders</h5>
                        <p class="card-stat">${userData.getTotalOrders()}</p>
                    </div>
                </div>
            </div>
            <div class="bg-light border">
                <div class="card statcard">
                    <div class="card-body text-left" style="max-height: 100px">
                        <h5 class="card-title">Completed Orders</h5>
                        <p class="card-stat">${userData.getCompletedOrders()}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>




<table style="margin-top: 2rem ; margin-left: 3rem ; margin-right: 2rem;" class="table">
    <thead>
    <tr>
        <th scope="col">Order ID</th>
        <th scope="col">Status</th>
        <th scope="col">Date</th>
        <th scope="col">No of Products</th>
        <th scope="col">Total</th>
        <th scope="col">Action</th>
        
    </tr>
    </thead>
    <tbody>
        
        <c:forEach items="${orderList}" var="order" >
                <tr>
                    <th scope="row">${order.getOrderID()}</th>
                    <td>${order.getOrderStatusDelivered() == 1 ? 'Delivered' : 'In Progress'}</td>
                    <td>${order.getOrderDate()}</td>
                    <td>${order.getnumber_products()}</td>
                    <td>${String.format("%.2f",order.gettotalamount())}</td>
                    <td><a href="OrderStatus1.jsp?orderId=${order.getOrderID()}" class="btn btn-success">View Details</a></td>
                </tr>

        </c:forEach>
    

    </tbody>
</table>


 <script>
  function logout() {
        window.location.href = "<%=request.getContextPath()%>/LogoutServlet";
  }
</script>  

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>

</body>
</html>
