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

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Cart</title>
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
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css"
    />
</head>
<body>

<%@ include file="header.jsp"%>
<main>
    <div class="container mt-5">
        <h1 class="text-center text-md-start mb-5">My Cart</h1>
        <div class="row d-md-flex mx-auto d-none d-md-flex mb-3">
            <div class="col-4 p-0">
                <h6 class="text-uppercase">Product</h6>
            </div>
            <div class="col-2 p-0">
                <h6 class="text-uppercase">Status</h6>
            </div>
            <div class="col-2 p-0">
                <h6 class="text-uppercase">Unit Price</h6>
            </div>
            <div class="col-2 p-0">
                <h6 class="text-uppercase">Quantity</h6>
            </div>
            <div class="col p-0">
                <h6 class="text-uppercase">Price</h6>
            </div>
        </div>

        <c:set var="email" value="${sessionScope.email}" />
        <c:set var="outofStock" value="0" />
        <c:set var="totalPrice" value="0.0" />
        <c:forEach var="cartItem" items="${FetchShoppingCart.searchCart(email)}">
            <c:set var="productId" value="${cartItem.PID}" />
            <c:set var="products" value="${FetchProduct.SearchProduct(productId)}" />
            <c:forEach var="product" items="${products}">
                <div
                        class="row d-md-flex m-0 border border-2 rounded-5 mb-3"
                >
                    <div class="col-md-4 p-0 mb-3 mb-md-0">
                        <div class="row m-0">
                            <div class="col col-md-4 col-5 p-0">
                                <img
                                        src="${product.getImgPath()}"
                                        alt="Carrots"
                                        srcset=""
                                        class="img-md-fluid w-100 rounded-5"
                                />
                            </div>
                            <div class="col-md-8 col-7 align-self-center p-4">
                                <h6
                                        class="text-capitalize text-center text-md-start text-break
                                        m-0">${product.productName} ${product.unitQty}g</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 p-0 align-self-md-center mb-3 mb-md-0">
                        <h6 class="text-uppercase text-center text-md-start m-0 p-2 p-md-0 ${product.stockQty > 0 ?
                    "text-success" : "text-danger"}">
                                ${product.stockQty > 0 ? "IN STOCK" : "OUT OF STOCK"}
                        </h6>
                    </div>
                    <div class="col-md-2 p-0 align-self-md-center mb-3 mb-md-0">
                        <h6 class="text-uppercase text-md-start text-center m-0 p-2 p-md-0">
                            USD <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="$" maxFractionDigits="2" />
                        </h6>
                    </div>
                    <div class="col-md-2 p-0 px-5 px-md-0 pe-md-5 align-self-center mb-3 mb-md-0">
                        <form action="ChangePqtyServlet" method="post" class="align-self-md-center my-auto">
                            <input type="hidden" name="productID" value="${product.productID}">
                            <input
                                    type="number"
                                    min="1"
                                    max="${product.stockQty}"
                                    name="PQty"
                                    id="PQty_${product.productID}"
                                    value="${cartItem.PQty}"
                                    placeholder="${cartItem.PQty}"
                                    class="form-control text-center text-md-start"
                            />
                        </form>
                    </div>
                    <div class="col p-0 align-self-center mb-3 mb-md-0">
                        <div
                                class="row m-0 text-center gap-3 gap-md-0"
                        >
                            <div class="col-12 col-md-7 p-0 m-0 align-self-center">
                                <h6 class="text-uppercase m-0 p-2 p-md-0 text-md-start text-center text-break">USD <fmt:formatNumber value="${cartItem.PQty * product.price}" type="currency" currencySymbol="$" maxFractionDigits="2" />
                            </div>
                            <div class="col text-center">
                                <form action="RemoveFromCartServlet" method="post" class="my-auto">
                                    <input type="hidden" name="productID" value="${product.productID}">
                                    <button type="submit" class="btn bg-danger" aria-label="Close">
                                        <i class="bi bi-x-lg fs-6"></i>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <c:set var="totalPrice" value="${totalPrice + (product.price * cartItem.PQty)}" />
                <c:set var="outofStock" value="${product.stockQty > 0 ? (outofStock + 0) : (outofStock + 1)}" />
            </c:forEach>
        </c:forEach>
        <div
                class="row row-cols-md-2 justify-content-center justify-content-md-end mx-auto mb-3"
        >
            <div class="col p-0 m-0 w-25">
                <h3 class="p-0 m-0 text-md-end text-center fw-bold">Total:</h3>
            </div>
            <div class="col p-0 m-0 w-25">
                <h3 class="p-0 m-0 text-md-end fw-bold">USD <fmt:formatNumber value="${totalPrice}" type="currency" currencySymbol="$" maxFractionDigits="2" /></h3>
            </div>
        </div>
        <div class="row mx-auto">
            <div class="col p-0 m-0 text-center text-md-end">
                <form id="checkoutForm" action="OrderServlet" method="post">
                    <button ${outofStock == 0 ? '' : 'disabled'} class="btn btn-success fs-2">Check Out</button>
                </form>
            </div>
        </div>
        <a href="index.jsp">
            <button type="button" class="btn btn-dark mt-3 mb-3">
                <i class="bi bi-arrow-left fs-5"> Back to Shopping</i>
            </button>
        </a>
    </div>
</main>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var quantityInputs = document.querySelectorAll('[id^="PQty_"]');

        quantityInputs.forEach(function (quantityInput) {
            quantityInput.addEventListener("change", function () {
                var currentValue = parseInt(this.value, 10);
                var maxStockQuantity = parseInt(this.getAttribute("max"), 10);

                // Check if the entered value is less than 1
                if (currentValue < 1 || isNaN(currentValue)) {
                    // Set the input value to 1
                    this.value = 1;
                }

                // Check if the entered value is greater than the stock quantity
                if (currentValue > maxStockQuantity) {
                    // Set the input value to the stock quantity
                    this.value = maxStockQuantity;
                }

                // Submit the form when the quantity changes
                this.form.submit();
            });
        });
    });
</script>
<%@ include file="footer.jsp"%>
</body>
</html>