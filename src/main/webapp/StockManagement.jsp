<%@page import="com.shaveen.greensupermarket.PStockManagement"%>
<%@page import="Model.ProductStock"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<%@page import="java.util.List"%>
<%

String email = (String) session.getAttribute("email");
String role = (String) session.getAttribute("role");
boolean isLoggedIn =  session.getAttribute("isLoggedIn")!= null && (boolean) session.getAttribute("isLoggedIn");

if ("M".equals(role) && isLoggedIn  && email != null) {
   
%>
<!doctype html>
<%
     List<ProductStock> ProductStocks = PStockManagement.getProductStock();
    pageContext.setAttribute("ProductStocks", ProductStocks);
%>
<html>
<head>
    <title>Stock Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
   
</head>
<body>
<%--<%@ include file="header.jsp"%>--%> 


<ul class="nav nav-tabs" style="margin-top: 1rem; ">
    <li class="nav-item" style="margin-left: 1rem;">
        <a class="nav-link "  href="ManagerDashboard.jsp">Dashboard</a>
    </li>
    <li class="nav-item">
        <a class="nav-link " aria-current="page" href="OrderManagement.jsp">Order Management</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="FeedbackManagement.jsp">Feedback Management</a>
    </li>
    <li class="nav-item">
        <a class="nav-link active" href="StockManagement.jsp">Stock Management</a>
    </li>
    <li class="nav-item" >
        <form action="AdminLogoutServlet" method="post">
            <input type="hidden">
            <button class="nav-link" type="submit"><i class="bi me-2">Log-out</i></button>
        </form>
        
       
    </li>

</ul>

<div class="row justify-content-end" style="margin-top: 2rem">
    <!-- Select Box 1 -->
    

    <!-- Select Box 2 -->
    

    <!-- Empty Space -->
    <div class="col-md-3 mb-3"></div>

    <!-- Search Box -->
    <form action="StockSearchServlet" method="get">
    <div class="col-md-3 mb-3" style="padding-right: 2rem;">

        <div class="input-group" style="margin-left: 2rem ;">
            <input type="text" class="form-control" id="searchBox" name="searchBox" placeholder="Search Products" aria-label="Search" aria-describedby="button-addon">
            <button class="btn btn-outline-secondary" type="submit"  id="button-addon">Search</button>
        </div>
    </div>
    </form>
</div>


    <c:if test="${not empty searchResults}">
        <h3>Search Results:</h3>
        <table style="margin-top: 2rem ; margin-left: 2rem ; margin-right: 2rem;" class="table">
            <!-- Table structure for search results -->
            <thead>
                <tr>
                    <th scope="col">Product ID</th>
                    <th scope="col">Stock Status</th>
                    <th scope="col">Name</th>
                    <th scope="col">Stock Count</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${searchResults}" var="searchResult">
                    <!-- Code to display each search result -->
            <form action="PStockQtyUpdateServlet" method="Post">
                <tr>
                    <th scope="row">${searchResult.getProductID()}</th>
                    <td>
                        <c:choose>
                            <c:when test="${searchResult.getStockQty() eq 0}">
                                Out of Stock
                            </c:when>
                            <c:when test="${searchResult.getStockQty() lt 15}">
                                Running Out
                            </c:when>
                            <c:otherwise>
                                In Stock
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${searchResult.getProductName()}</td>
                    <td>
                        <div class="input-group w-auto  align-items-center">
                            <input type="number" min="0" step="1" id="PQty" value="${searchResult.getStockQty()}" name="stock_count" class="quantity-field border-0 text-center ">
                            <input type="hidden" name="productId" value="${searchResult.getProductID()}">
                            <button type="submit" class="text-uppercase btn btn-success btn-sm ">Update Stock</button>
                        </div>
                    </td>


                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>


    <h3 style="margin-left: 2rem ;">All Results</h3>
    <table style="margin-top: 2rem ; margin-left: 2rem ; margin-right: 2rem;" class="table">
        <thead>
        <tr>
            <th scope="col">Product ID</th>
            <th scope="col">Stock Status</th>
            <th scope="col">Name</th>
            <th scope="col">Stock Count</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${ProductStocks}" var="ProductSt">
        <form action="PStockQtyUpdateServlet" method="Post">
        <tr>
            <th scope="row">${ProductSt.getProductID()}</th>
            <td>
                <c:choose>
                    <c:when test="${ProductSt.getStockQty() eq 0}">
                        Out of Stock
                    </c:when>
                    <c:when test="${ProductSt.getStockQty() lt 15}">
                        Running Out
                    </c:when>
                    <c:otherwise>
                        In Stock
                    </c:otherwise>
                </c:choose>
            </td>
            <td>${ProductSt.getProductName()}</td>
            <td>
                <div class="input-group w-auto  align-items-center">
                    <input type="number" min="0" step="1" id="PQty" value="${ProductSt.getStockQty()}" name="stock_count" class="quantity-field border-0 text-center ">
                    <input type="hidden" name="productId" value="${ProductSt.getProductID()}">
                    <button type="submit" class="text-uppercase btn btn-success btn-sm ">Update Stock</button>
                </div>
            </td>


        </tr>
        </form>
        </c:forEach>

        </tbody>
    </table>
    
    


<script>
      document.addEventListener("DOMContentLoaded", function () {
        var quantityInput = document.getElementById("PQty");

        quantityInput.addEventListener("change", function () {
          var currentValue = parseInt(this.value, 10);

          // Check if the entered value is less than 1
          if (currentValue < 1 || isNaN(currentValue)) {
            // Set the input value to 1
            this.value = 1;
          }
        });
      });
    </script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>

<%@ include file="footer.jsp"%>
</body>
</html>
<%
} else {
    // Redirect back to the login page
    response.sendRedirect("adminlogin.jsp");
}
%>