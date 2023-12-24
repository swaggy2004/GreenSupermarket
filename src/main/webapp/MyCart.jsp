<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/12/2023
  Time: 2:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="com.shaveen.greensupermarket.FetchProduct"%>
<%@page import="Model.Product"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="com.shaveen.greensupermarket.ShoppingCartServlet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.shaveen.greensupermarket.FetchShoppingCart"%>
<%@page import="Model.ShoppingCart"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c"%>

<%
        String customerEmail = request.getParameter("customerEmail");

        List<ShoppingCart> cartList = FetchShoppingCart.searchCart(customerEmail);
        List<Product> products = null;
        for (ShoppingCart cartItem : cartList) {
                int productId = cartItem.getPID();
                products = FetchProduct.SearchProduct(productId);
                for (Product product : products){
                    cartItem.setTotPrice(cartItem.getPQty() * product.getPrice());
                }
        }
        pageContext.setAttribute("products", products);
        pageContext.setAttribute("cartItem", cartList);
        
%>
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
            <h1 style="margin-bottom: 50px;">My Cart</h1>
            <div style="max-width: 1280px;">
                <div class="row mb-2 d-none d-lg-flex">
                    <div class="col-md-6">
                        <div class="card-body">
                            <h6>PRODUCT</h6>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="card-body">
                            <h6>UNIT PRICE</h6>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="card-body">
                            <h6>QTY</h6>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="card-body">
                            <h6>PRICE</h6>
                        </div>
                    </div>
                </div>
            </div>
            
            <c:forEach items="${products}" var="product">
                <c:forEach items="${cartItem}" var="item">
                <div class="card mb-3" style="max-width: 1280px;border-radius: 20px;">
                    <div class="row g-0">
                        <div class="col-md-2 ">
                            <img src="assets/vegi1.png" style="width: 100px; border-radius: 20px;" class="img-fluid rounded-start  " alt="...">
                        </div>
                        <div class="col-md-4 my-auto ">
                            <div class="card-body">
                                <h5>${product.getProductName()}</h5>
                            </div>
                        </div>
                        <div class="col-md-2 my-auto ">
                            <div class="card-body">
                                <h5>LKR ${product.getPrice()}</h5>
                            </div>
                        </div>
                        <div class="col-md-2 my-auto ">
                            <div class="card-body">
                                <input type="number" name="PQty" value="${item.getPQty()}">
                            </div>
                        </div>
                        <div class="col-md-1 my-auto ">
                            <div class="card-body">
                              <h5>LKR ${item.getTotPrice()}</h5>

                            </div>
                        </div>
                        <div class="col-md-1 my-auto ">
                            <div class="card-body">
                                <button type="button" class="btn-close" aria-label="Close"></button>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </c:forEach>

        </div>

    </div>
    <div class="row">
        <div class="col-md-9"></div>
        <div class="col-md-3"style="background-color:#F2F2F2;">
            <div class="row mb-3 mt-3">
                <div class="col-md-7"><b>Subtotal</b></div>
                <div class="col-md-5">LKR900</div>
            </div>
            <div class="row mb-5">
                <div class="col-md-7"><b>Delivery fee</b></div>
                <div class="col-md-5">LKR 280</div>
            </div>
            <div class="row mb-2">
                <div class="col-md-6"><h3>Total</h3></div>
                <div class="col-md-6"><h3>LKR 1180</h3></div>
            </div>
            <div class="row mb-3">
                <div class="col-md-12 ">
                    <div class="d-grid 2">
                        <button class="btn btn-primary" style="background-color: #34A853; border-color: #34A853;" type="button" data-bs-toggle="modal" data-bs-target="#myModal">CheckOut</button>
                        <div class="modal" id="myModal">
                            <div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-3 ms-auto" style="text-align: left;"><button type="button" class="btn-info" style="background-color:white; border:none;"><img src="assets/MyCartpopuparrowback.svg" style="width: 40px;border:none; " class="img-thumbnail" alt="..."></button></div>
                                                <div class="col-md-6 center"><h4 class="modal-title" style="text-align: center;">Order Placed</h4></div>
                                                <div class="col-md-3 my-auto" style="text-align: right;"><button type="button"  class="btn-close " data-bs-dismiss="modal"></button></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-12 mb-3 mt-3" style="text-align: center;"><h4 class="modal-title">Order No #123826526578612</h4></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12" style="text-align: center;"><img src="assets/MyCartpopupcheck.svg" style="width: 100px" class="rounded" alt="..."></div>
                                            </div>
                                            <div class="row mt-4">
                                                <div class="col-md-12" style="text-align: center;"><h5 class="modal-title">Success</h5></div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <div class="container">
                                            <div class="row ">
                                                <div class="col-md-12" style="text-align: center;"><div class="d-grid gap-2 col-3 mx-auto"><button type="submit" class="btn btn-primary">Submit</button></div></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
</div>
<%@ include file="footer.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
<script src="MyCartQuantityfunction.js"></script>
</body>
</html>
