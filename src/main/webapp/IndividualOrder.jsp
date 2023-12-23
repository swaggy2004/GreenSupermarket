<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<%@page import="com.shaveen.greensupermarket.CIndividualOrderManagement"%>
<%@page import="Model.IndividualOrderManagement"%>
<%@page import="Model.IndividualProdOrderManagement" %>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.DecimalFormat" %>
<%@page isELIgnored="false" %>
<%

String email = (String) session.getAttribute("email");
String role = (String) session.getAttribute("role");
boolean isLoggedIn =  session.getAttribute("isLoggedIn")!= null && (boolean) session.getAttribute("isLoggedIn");

if ("M".equals(role) && isLoggedIn  && email != null) {
   
%>
<%
    String orderIDString = request.getParameter("orderId");
    int OrderID = Integer.parseInt(orderIDString);
    
    IndividualOrderManagement corder = CIndividualOrderManagement.getinfoByOrderID(OrderID);
    
    List<IndividualProdOrderManagement> OrderedProducts = CIndividualOrderManagement.getProdinfoByOrderID(OrderID);

    
    pageContext.setAttribute("corder", corder);
    pageContext.setAttribute("OrderedProducts", OrderedProducts);
%>


<html>
<head>
    <title>Individual Order</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="IndividualOrder.css" rel="stylesheet">
</head>
<body>
<div class="card order-placement" style="width: 80%; margin-top:2rem; margin-left: 10%; text-align: center">
    <div class="card-body">
        <h5 class="card-title"style="margin-bottom: 2%">Order ${corder.getOrderId()}</h5>
        <h6 class="card-subtitle mb-2 text-body-secondary">2 Products</h6>
        <p class="card-text">${corder.getOrderPlacedDateTime()}</p>
    </div>
</div>

<div style="text-align:center;">
    <h3 style=" margin-top:5%">Order Details</h3>
    <c:forEach items="${OrderedProducts}" var="product">
    <div class="card mb-3 w-80 mx-auto" style="max-width: 540px;">
        <div class="row g-0">
            <div class="col-md-8">
                <div class="card-body">
                    <h5 class="card-title">${product.getProductName()}</h5>
                    <p class="card-text"><small class="text-body-secondary">LKR${product.getProductPrice()}</small></p>
                    <p class="card-text"><small class="text-body-secondary">Qty${product.getProductQuantity()}</small></p>
                </div>
                
            </div>
            <div class="col-md-4">
               
                <div class="card-body">
                    <h5 class="card-title">Total</h5>
                    <p class="card-text"><small class="text-body-secondary">LKR ${String.format("%.2f", product.getProductPrice() * product.getProductQuantity())}</small></p>
                </div>
            </div>
        </div>
    </div>
    </c:forEach>
  
    <div style="display: flex; justify-content: center; align-items: center;  margin: 0;">
                 <hr style="background-color: black; height: 5px; border: none; width:25%;">
    </div>



    <div class="card mb-3 w-80 mx-auto" style="max-width: 540px;">
        <div class="row g-0">
            <div class="col-md-8">
                <div class="card-body">
                    <h5 class="card-title text-start">Total</h5>
                    <h2 class="card-text text-end ">LKR ${corder.getTotalPrice()}</h2>
                </div>
            </div>
        </div>
    </div>
</div>


<h3 style=" margin-top:3%; margin-bottom:1%; text-align:center;">Update status
</h3>
<div style="display: flex; justify-content: center; align-items: center;  margin-top: 1rem; margin-bottom: 3rem;" >

    <form action="UpdateIndividualOrderStatusServlet" method="post">
        <div class="btn-group" role="group" aria-label="Outlined Checkbox Buttons" style="min-width: 520px">
            <input type="checkbox" class="btn-check" name="options-outlined-1" id="success-outlined-1" autocomplete="off" <c:if test="${corder.getOrderStatusPlaced() eq 1}">checked="checked"</c:if>>
            <label class="btn btn-outline-success" for="success-outlined-1" style="width: 100%;">
                <svg style="margin-right: 2%" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-receipt" viewBox="0 0 16 16">
                    <path d="M1.92.506a.5.5 0 0 1 .434.14L3 1.293l.646-.647a.5.5 0 0 1 .708 0L5 1.293l.646-.647a.5.5 0 0 1 .708 0L7 1.293l.646-.647a.5.5 0 0 1 .708 0L9 1.293l.646-.647a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .708 0l.646.647.646-.647a.5.5 0 0 1 .801.13l.5 1A.5.5 0 0 1 15 2v12a.5.5 0 0 1-.053.224l-.5 1a.5.5 0 0 1-.8.13L13 14.707l-.646.647a.5.5 0 0 1-.708 0L11 14.707l-.646.647a.5.5 0 0 1-.708 0L9 14.707l-.646.647a.5.5 0 0 1-.708 0L7 14.707l-.646.647a.5.5 0 0 1-.708 0L5 14.707l-.646.647a.5.5 0 0 1-.708 0L3 14.707l-.646.647a.5.5 0 0 1-.801-.13l-.5-1A.5.5 0 0 1 1 14V2a.5.5 0 0 1 .053-.224l.5-1a.5.5 0 0 1 .367-.27m.217 1.338L2 2.118v11.764l.137.274.51-.51a.5.5 0 0 1 .707 0l.646.647.646-.646a.5.5 0 0 1 .708 0l.646.646.646-.646a.5.5 0 0 1 .708 0l.646.646.646-.646a.5.5 0 0 1 .708 0l.646.646.646-.646a.5.5 0 0 1 .708 0l.646.646.646-.646a.5.5 0 0 1 .708 0l.509.509.137-.274V2.118l-.137-.274-.51.51a.5.5 0 0 1-.707 0L12 1.707l-.646.647a.5.5 0 0 1-.708 0L10 1.707l-.646.647a.5.5 0 0 1-.708 0L8 1.707l-.646.647a.5.5 0 0 1-.708 0L6 1.707l-.646.647a.5.5 0 0 1-.708 0L4 1.707l-.646.647a.5.5 0 0 1-.708 0z"/>
                    <path d="M3 4.5a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5m8-6a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5"/>
                </svg>
                Order Placed
            </label>

            <input type="checkbox"  class="btn-check" name="options-outlined-2" id="success-outlined-2" autocomplete="off"<c:if test="${corder.getOrderStatusPackaging() eq 1}">checked="checked"</c:if>>
            <label class="btn btn-outline-success" for="success-outlined-2" style="width: 100%;">
                <svg style="margin-right: 2%" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-fill" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M15.528 2.973a.75.75 0 0 1 .472.696v8.662a.75.75 0 0 1-.472.696l-7.25 2.9a.75.75 0 0 1-.557 0l-7.25-2.9A.75.75 0 0 1 0 12.331V3.669a.75.75 0 0 1 .471-.696L7.443.184l.004-.001.274-.11a.75.75 0 0 1 .558 0l.274.11.004.001 6.971 2.789Zm-1.374.527L8 5.962 1.846 3.5 1 3.839v.4l6.5 2.6v7.922l.5.2.5-.2V6.84l6.5-2.6v-.4l-.846-.339Z"/>
                </svg>
                Packaged
            </label>

            <input type="checkbox"  class="btn-check" name="options-outlined-3" id="success-outlined-3" autocomplete="off"<c:if test="${corder.getOrderStatusDelivered() eq 1}">checked="checked"</c:if>>
            <label class="btn btn-outline-success" for="success-outlined-3" style="width: 100%;">
                <svg style="margin-right: 2%" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-truck" viewBox="0 0 16 16">
                    <path d="M0 3.5A1.5 1.5 0 0 1 1.5 2h9A1.5 1.5 0 0 1 12 3.5V5h1.02a1.5 1.5 0 0 1 1.17.563l1.481 1.85a1.5 1.5 0 0 1 .329.938V10.5a1.5 1.5 0 0 1-1.5 1.5H14a2 2 0 1 1-4 0H5a2 2 0 1 1-3.998-.085A1.5 1.5 0 0 1 0 10.5zm1.294 7.456A1.999 1.999 0 0 1 4.732 11h5.536a2.01 2.01 0 0 1 .732-.732V3.5a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5v7a.5.5 0 0 0 .294.456M12 10a2 2 0 0 1 1.732 1h.768a.5.5 0 0 0 .5-.5V8.35a.5.5 0 0 0-.11-.312l-1.48-1.85A.5.5 0 0 0 13.02 6H12zm-9 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2m9 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2"/>
                </svg>
                Delivered
            </label>


        </div>
        <div style="display: flex; justify-content: space-between; margin-top: 1rem;">
            <a href="OrderManagement.jsp"><button type="button" class="btn btn-back" >Back</button></a>
             
            <input type="hidden" name="orderId" value="${corder.getOrderId()}">
            <button type="submit" class="btn btn-update">Update</button>
            
        </div>

    </form>
</div>


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