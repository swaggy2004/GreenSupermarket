
<%--
  Created by IntelliJ IDEA.
  User: Jude Darren Victoria
  Date: 06/12/2023
  Time: 07:32 pm
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.shaveen.greensupermarket.OrderDatabaseInteraction" %>
<%@ page import="com.shaveen.greensupermarket.OrderDataManager" %>
<%@ page import="java.util.List" %>
<%

String email = (String) session.getAttribute("email");
String role = (String) session.getAttribute("role");
boolean isLoggedIn =  session.getAttribute("isLoggedIn")!= null && (boolean) session.getAttribute("isLoggedIn");

if ("M".equals(role) && isLoggedIn  && email != null) {
   
%>
<html>
<head>
    <title>Order Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        /* Custom styles for the burger stack icon in mobile */
        @media (max-width: 767px) {
            .icons-container {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
        }

        /* Custom styles for desktop view */
        @media (min-width: 768px) {
            .icons-container {
                display: flex;
                justify-content: flex-start;
                align-items: center;
                margin-left: auto;
            }

            .icons-container img {
                margin-right: 5px; /* Add some space between the icons */
            }

            .icons-container img:hover {
                opacity: 0.8; /* Add a hover effect */
            }
            .nav-link{
                color:#347809 ;
            }
        }


    </style>
</head>
<body>
  
    <%
        List<OrderDataManager> orders = OrderDatabaseInteraction.getAllOrders();
        pageContext.setAttribute("orders", orders);
    %>


<nav style="background-color: #d0f288" class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#"><img style="width: 110px" alt="Navbar Logo" src="assets/NavLogo.svg"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Meats</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link active" aria-current="page" href="#">Fruits</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Vegetables</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Snacks</a>
                </li>
            </ul>
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
            <div class="icons-container"> <!-- Container for icons in mobile view -->
                <!-- Desktop icons -->
                <a class="nav-link active" aria-current="page" href="#"><img src="assets/shopping_bag.svg" alt="Cart"></a>
                <a class="nav-link active" aria-current="page" href="#"><img src="assets/favorite.svg" alt="Favorite"></a>
                <a class="nav-link active" aria-current="page" href="#"><img src="assets/person_2.svg" alt="Profile"></a>
            </div>
        </div>
    </div>
</nav>



<ul class="nav nav-tabs" style="margin-top: 1rem; ">
    <li class="nav-item" style="margin-left: 1rem;">
        <a class="nav-link "  href="ManagerDashboard.jsp">Dashboard</a>
    </li>
    <li class="nav-item">
        <a class="nav-link active" aria-current="page" href="OrderManagement.jsp">Order Management</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="FeedbackManagement.jsp">Feedback Management</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="StockManagement.jsp">Stock Management</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="LogoutServlet">Logout</a>
    </li>

</ul>






<table style="margin-top: 2rem ; margin-left: 2rem ; margin-right: 2rem;" class="table">
    <thead>
    <tr>
        <th scope="col">Order ID</th>
        <th scope="col">Status</th>
        <th scope="col">Date</th>
        <th scope="col">Total</th>
        <th scope="col">Action</th>
    </tr>
    </thead>
    <tbody>


    
            <c:forEach items="${orders}" var="order">
                    <tr>
                        <th scope="row">${order.orderId}</th>
                        <td>${order.orderStatusDelivered == 1 ? 'Delivered' : 'In Progress'}</td>
                        <td>${order.orderDate}</td>
                        <td>LKR ${order.totalPrice}</td>
                        <td><a href="IndividualOrder.jsp?orderId=${order.orderId}" class="btn btn-success">View Details</a></td>
                    </tr>
            </c:forEach>


    </tbody>
</table>


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>

</body>
</html>
<%
} else {
    // Redirect back to the login page
    response.sendRedirect("adminlogin.jsp");
}
%>