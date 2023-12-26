<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/12/2023
  Time: 2:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.shaveen.greensupermarket.FetchProduct"%>
<%@page import="jakarta.servlet.*, jakarta.servlet.http.*"%>
<%@page import="Model.Product"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.shaveen.greensupermarket.FetchShoppingCart"%>
<%@page import="Model.ShoppingCart"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous"
    />
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"
    ></script>
</head>
<body>
<%--<%@ include file="header.jsp"%>--%>
<div class="container mt-5">
    <h1 class="text-center text-md-start mb-5">My Cart</h1>
    <div class="row row-cols-4 d-md-flex mx-auto d-none d-md-flex">
        <div class="col p-0">
            <h6 class="text-uppercase">Product</h6>
        </div>
        <div class="col p-0">
            <h6 class="text-uppercase">Unit Price</h6>
        </div>
        <div class="col p-0">
            <h6 class="text-uppercase">Quantity</h6>
        </div>
        <div class="col p-0">
            <h6 class="text-uppercase">Price</h6>
        </div>
    </div>

    <c:set var="email" value="${sessionScope.email}" />
    <c:set var="totalPrice" value="0.0" />
    <c:forEach var="cartItem" items="${FetchShoppingCart.searchCart(email)}">
        <c:set var="productId" value="${cartItem.PID}" />
        <c:set var="products" value="${FetchProduct.SearchProduct(productId)}" />
        <c:forEach var="product" items="${products}">
            <div
                    class="row row-cols-1 row-cols-md-4 m-0 border border-2 rounded-5 mb-3"
            >
                <div class="col p-0">
                    <div class="row row-cols-2 m-0">
                        <div class="col p-0">
                            <img
                                    src="https://befreshcorp.net/wp-content/uploads/2017/06/product-packshot-Carrot.jpg"
                                    alt="Carrots"
                                    srcset=""
                                    class="img-md-fluid w-100 rounded-5"
                            />
                        </div>
                        <div class="col align-self-center p-4">
                            <h6
                                    class="text-capitalize text-break m-0">${product.productName}</h6>
                        </div>
                    </div>
                </div>
                <div class="col p-0 align-self-md-center">
                    <h6 class="text-uppercase text-md-start text-center m-0 p-2 p-md-0">
                        USD <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="$" maxFractionDigits="2" />
                    </h6>
                </div>
                <div class="col p-0 px-5 px-md-0 pe-md-5 align-self-center">
                    <form action="ChangePqtyServlet" method="post">
                        <input type="hidden" name="productID" value="${product.productID}">
                        <input
                            type="number"
                            min="1"
                            name="PQty"
                            id="PQty"
                            value="${cartItem.PQty}"
                            placeholder="${cartItem.PQty}"
                            class="form-control text-center text-md-start"
                        />
                    </form>
                </div>
                <div class="col p-0 align-self-center">
                    <div
                            class="row row-cols-md-2 row-cols-1 m-0 text-center text-md-start"
                    >
                        <div class="col p-0 m-0 align-self-center">
                            <h6 class="text-uppercase m-0 p-2 p-md-0 text-start">USD <fmt:formatNumber value="${cartItem.PQty * product.price}" type="currency" currencySymbol="$" maxFractionDigits="2" />
                        </div>
                        <div class="col p-0 text-center align-self-center">
                            <button
                                    type="button"
                                    class="btn-close p-2 p-md-0"
                                    aria-label="Close"
                            ></button>
                        </div>
                    </div>
                </div>
            </div>
            <c:set var="totalPrice" value="${totalPrice + (product.price * cartItem.PQty)}" />
        </c:forEach>
    </c:forEach>
    <div class="row row-cols-md-2 justify-content-center justify-content-md-end mx-auto mb-5">
        <div class="col p-0 m-0 w-25">
            <h3 class="p-0 m-0 text-md-end text-center fw-bold">Total:</h3>
        </div>
        <div class="col p-0 m-0 w-25">
            <h3 class="p-0 m-0 text-md-center fw-bold">USD <fmt:formatNumber value="${totalPrice}" type="currency"
                                                                             currencySymbol="$" maxFractionDigits="2" /></h3>
        </div>
    </div>
</div>
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
    
    quantityInput.addEventListener("change", function () {
        this.form.submit();
    });
</script>
</body>
</html>
