
<%@page import="com.shaveen.greensupermarket.ManagerDatabaseInteraction"%>
<%@page import="com.shaveen.greensupermarket.CFeedbackManagement"%>
<%@page import="Model.CustFeedbackManagement"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<%
    List<CustFeedbackManagement> CustFeedbackManagements = CFeedbackManagement.getCustFeedbackManagement();
    pageContext.setAttribute("CustFeedbackManagements", CustFeedbackManagements);
%>
<%

String email = (String) session.getAttribute("email");
String role = (String) session.getAttribute("role");
boolean isLoggedIn =  session.getAttribute("isLoggedIn")!= null && (boolean) session.getAttribute("isLoggedIn");

if ("M".equals(role) && isLoggedIn  && email != null) {
   
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    <style>
        .star-container {
            display: inline-block;
        }

        .star {
            color: #FFD700;
            font-size: 50px;
            transition: color 0.2s;
        }

        .rated {
            color: #FFA500;
        }
    </style>
</head>
<body>
<%--<%@ include file="header.jsp"%>--%>

<%
    int totalFeedbackCount = ManagerDatabaseInteraction.getTotalFeedbackCount();
    double averageFeedbackRating = ManagerDatabaseInteraction.getAverageFeedbackRating();

    request.setAttribute("totalFeedbackCount", totalFeedbackCount);
    request.setAttribute("averageFeedbackRating", averageFeedbackRating);
%>


<ul class="nav nav-tabs" style="margin-top: 1rem; ">
    <li class="nav-item" style="margin-left: 1rem;">
        <a class="nav-link "  href="ManagerDashboard.jsp">Dashboard</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" aria-current="page" href="OrderManagement.jsp">Order Management</a>
    </li>
    <li class="nav-item">
        <a class="nav-link active" href="FeedbackManagement.jsp">Feedback Management</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="StockManagement.jsp">Stock Management</a>
    </li>
    <li class="nav-item" >
        <form action="AdminLogoutServlet" method="post">
            <input type="hidden">
            <button class="nav-link" type="submit"><i class="bi me-2">Log-out</i></button>
        </form>
        
       
    </li>

</ul>

<div class="card order-placement" style="width: 80%; margin-top:2rem; margin-left: 10%; text-align: center">
    <div class="card-body">
        <div class="star-container" id="starContainer">
            <!-- Stars will be dynamically added here -->
        </div>
        <h3 class="card-title"> <strong>${averageFeedbackRating}/5</strong></h3>
        <p class="card-text"><small>${totalFeedbackCount} ratings</small></p>

    </div>
</div>





<table style="margin-top: 2rem ; margin-left: 2rem ; margin-right: 2rem; margin-bottom: 8rem;" class="table">
    <thead>
    <tr>
        <th scope="col">Feedback ID </th>
        <th scope="col">Rating</th>
        <th scope="col">Date</th>
        <th scope="col">Name</th>
        <th scope="col">Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${CustFeedbackManagements}" var="CustFbManagement">
    
    <tr>
        <th scope="row">${CustFbManagement.getFeedbackID()}</th>
        <td>${CustFbManagement.getFeedbackRating()}/5</td>
        <td>${CustFbManagement.getFeedbackTime()}</td>
        <td>${CustFbManagement.getCName()}</td>
        <td><a href="IndividualFeedback.jsp?feedbackID=${CustFbManagement.getFeedbackID()}"><button type="button" class="btn btn-success">View Details</button></a></td>
    </tr>
    
    </c:forEach>
    
    </tbody>
</table>

<%@ include file="footer.jsp"%>





 <%--<%@ include file="footer.jsp"%>--%>

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