<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.shaveen.greensupermarket.ManagerDatabaseInteraction" %>
<%@ page isELIgnored="false" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="jakarta.servlet.*,jakarta.servlet.http.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%

String email = (String) session.getAttribute("email");
String role = (String) session.getAttribute("role");
boolean isLoggedIn =  session.getAttribute("isLoggedIn")!= null && (boolean) session.getAttribute("isLoggedIn");

if ("M".equals(role) && isLoggedIn  && email != null) {
   
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manager Dashboard</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="ManagerDashboard.css" rel="stylesheet">
    
</head>
<body>
    <%  
        int totalOrderCount = ManagerDatabaseInteraction.getTotalOrderCount();
        int totalFeedbackCount = ManagerDatabaseInteraction.getTotalFeedbackCount();
        double averageFeedbackRating = ManagerDatabaseInteraction.getAverageFeedbackRating();
        int TotalProductCount = ManagerDatabaseInteraction.getTotalProductCount();
        int getTotalCustomerCount = ManagerDatabaseInteraction.getTotalCustomerCount();

        // Set these values in request attributes
        request.setAttribute("totalOrderCount", totalOrderCount);
        request.setAttribute("totalFeedbackCount", totalFeedbackCount);
        request.setAttribute("averageFeedbackRating", averageFeedbackRating);
        request.setAttribute("TotalProductCount", TotalProductCount);
        request.setAttribute("getTotalCustomerCount", getTotalCustomerCount);

        
    %>
<%@ include file="header.jsp"%> 


<ul class="nav nav-tabs" style="margin-top: 1rem; ">
    <li class="nav-item" style="margin-left: 1rem;">
        <a class="nav-link active "  href="ManagerDashboard.jsp">Dashboard</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" aria-current="page" href="OrderManagement.jsp">Order Management</a>
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


<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-3 mb-4">
            <div class="card statcard">
                <div class="card-body text-left">
                    <h5 class="card-title">Total Number of Orders</h5>
                    <p class="card-stat">${totalOrderCount}</p>
                </div>
            </div>
        </div>

        <div class="col-md-3 mb-4">
            <div class="card statcard">
                <div class="card-body text-left">
                    <h5 class="card-title">Feedbacks Received</h5>
                    <p class="card-stat">${totalFeedbackCount}</p>
                </div>
            </div>
        </div>

        <div class="col-md-3 mb-4">
            <div class="card statcard">
                <div class="card-body text-left">
                    <h5 class="card-title">Overall Rating</h5>
                    <p class="card-stat">${averageFeedbackRating}/5</p>
                </div>
            </div>
        </div>
    </div>
</div>
                
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-3 mb-4">
            <div class="card statcard">
                <div class="card-body text-left">
                    <h5 class="card-title">Number of Products in system</h5>
                    <p class="card-stat">${TotalProductCount}</p>
                </div>
            </div>
        </div>

        <div class="col-md-3 mb-4">
            <div class="card statcard">
                <div class="card-body text-left">
                    <h5 class="card-title">Number of Users in system</h5>
                    <p class="card-stat">${getTotalCustomerCount}</p>
                </div>
            </div>
        </div>
    </div>
</div>




<div class="container mt-5">
    <div class="row">

        <!-- First Column -->
<!--        <div class="col-md-6">
            <h3 style="text-align: center">Top Sold Products</h3>
            <div class="card mb-3" style="max-width: 540px;">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="assets/corn.jpg" style="width: 100px" class="img-fluid rounded-start" alt="...">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title">Sweet Corn</h5>
                            <p class="card-text"><small class="text-body-secondary">USD 372</small></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card mb-3" style="max-width: 540px;">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="assets/corn.jpg" style="width: 100px" class="img-fluid rounded-start" alt="...">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title">Sweet Corn</h5>
                            <p class="card-text"><small class="text-body-secondary">USD 372</small></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card mb-3" style="max-width: 540px;">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="assets/corn.jpg" style="width: 100px" class="img-fluid rounded-start" alt="...">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title">Sweet Corn</h5>
                            <p class="card-text"><small class="text-body-secondary">USD 372</small></p>
                        </div>
                    </div>
                </div>
            </div>

             Add more cards as needed 
        </div>-->

        <!-- Second Column -->
<!--        <div class="col-md-6">

            <h3 style="text-align: center">Top on Wishlist</h3>
            <div class="card mb-3" style="max-width: 540px;">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="assets/corn.jpg" style="width: 100px" class="img-fluid rounded-start" alt="...">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title">Sweet Corn</h5>
                            <p class="card-text"><small class="text-body-secondary">USD 372</small></p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card mb-3" style="max-width: 540px;">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="assets/corn.jpg" style="width: 100px" class="img-fluid rounded-start" alt="...">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title">Sweet Corn</h5>
                            <p class="card-text"><small class="text-body-secondary">USD 372</small></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card mb-3" style="max-width: 540px;">
                <div class="row g-0">
                    <div class="col-md-4">
                        <img src="assets/corn.jpg" style="width: 100px" class="img-fluid rounded-start" alt="...">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title">Sweet Corn</h5>
                            <p class="card-text"><small class="text-body-secondary">USD 372</small></p>
                        </div>
                    </div>
                </div>
            </div>

             Add more cards as needed 
        </div>-->
    </div>
</div>





<%@ include file="footer.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>
<%
} else {
    // Redirect back to the login page
    response.sendRedirect("adminlogin.jsp");
}
%>