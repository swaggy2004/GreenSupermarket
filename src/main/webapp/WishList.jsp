<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/12/2023
  Time: 2:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="com.shaveen.greensupermarket.FetchProduct"%>
<%@page import="Model.Product"%>
<%@page import="com.shaveen.greensupermarket.FetchWishList"%>
<%@page import="Model.WishList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c"%>

<%
    String CID = (String) session.getAttribute("email");
    List<WishList> wishlist = FetchWishList.searchWishlist(CID);
    List<Product> product = null;
    for( WishList witem : wishlist){
        product = FetchProduct.SearchProduct(witem.getPID());
    }
    pageContext.setAttribute("product", product);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<%@ include file="header.jsp"%> 

<div class="container mt-5">
    <div class="row">


        <div class="col-md-12">
            <h1 style="margin-bottom: 50px;">My Wishlist</h1>
            <div style="max-width: 1280px;">
                <div class="row mb-2 d-none d-lg-flex">
                    <div class="col-md-5">
                        <div class="card-body">
                            <h6>PRODUCT</h6>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="card-body">
                            <h6>PRICE</h6>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="card-body">
                            <h6>Stock Status</h6>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card-body">
                            <h6></h6>
                        </div>
                    </div>
                </div>
            </div>
            
            <c:forEach items= "${product}" var="item">
                <div class="card mb-3" style="max-width: 1280px;border-radius: 20px;">
                <div class="row g-0">
                    <div class="col-md-2">
                        <img src="assets/vegi1.png" style="width: 100px" class="img-fluid rounded-start" alt="...">
                    </div>
                    <div class="col-md-3 my-auto ">
                        <div class="card-body">
                            <h5>${item.getProductName()}</h5>
                        </div>
                    </div>
                    <div class="col-md-2 my-auto ">
                        <div class="card-body">
                            <h5>${item.getPrice()}</h5>
                        </div>
                    </div>
                    <div class="col-md-2 my-auto ">
                        <div class="card-body">
                            <button type="button" class="btn btn-info btn-sm">${item.getStockQty() > 0 ? "In Stock" : "Out of Stock"}</button>
                        </div>
                    </div>
                     <form action="AddToCartServlet" method="post">
                        <!-- Include the product ID as a hidden input field -->
                        <input type="hidden" name="PID" value="${item.getProductID()}">
                        <div class="col-md-2 my-auto">
                            <div class="card-body">
                                <button type="submit" class="btn btn-warning" 
                                        ${item.getStockQty() == 0 ? 'disabled' : ''}>
                                    Add to cart
                                </button>
                            </div>
                        </div>
                    </form>
                    <div class="col-md-1 my-auto ">
                        <div class="card-body">
                            <button type="button" class="btn-close" aria-label="Close"></button>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
            <div class="row ">
                <div class="col-md-2"><button type="button" class="btn btn-outline-dark"  style="background-color: #ffffff;
                    border-color: #34A853;"><img src="assets/MyCartArrowLeft.svg">&nbsp;Continue shopping</button></div>
                <div class="col-md-8"></div>
            </div>

        </div>

    </div>
</div>
<%@ include file="footer.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>

</body>
</html>
