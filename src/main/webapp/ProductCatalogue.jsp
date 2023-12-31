<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.List"%>
<%@page import="com.shaveen.greensupermarket.FetchProduct"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="Model.Product"%>
<!DOCTYPE html>
<c:set var="category" value="${param.category}" />
<c:if test="${not empty category}">
    <c:set var="products" value="${FetchProduct.SearchProduct(category)}" />
    <c:set var="products" scope="page" value="${products}" />
</c:if>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>${category} Catalogue</title>
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
<div class="jumbotron jumbotron-fluid position-relative">
    <img
            src="assets/images/HeaderImages/${category}.jpg" loading="lazy" class="img-fluid w-100"
            style="max-height: 80vh;" alt="">
    <h1
            class="display-1 fw-semibold text-white text-center position-absolute top-50 start-50 translate-middle p-3"
    >
        ${category}s
    </h1>
</div>

<div class="container-fluid">
    <div class="row gap-1">
        <c:forEach items="${products}" var="product">
            <div
                    class="card border border-2 p-3 text-center mx-auto mt-4 mb-4"
                    style="width: 19.9rem"  onclick="redirectToServlet('ProductDetail.jsp',
                    '${product.getProductID()}');"
            >
                <img
                        src="${product.getImgPath()}"
                        class="card-img-top rounded-2"
                        style="border: 2px solid green"
                />
                <div class="card-body">
                    <h4 class="card-title text-capitalize">${product.getProductName()} ${product.getUnitQty()}g</h4>
                </div>
                <div class="card-body pb-0 pt-0 px-auto">
                    <div class="row justify-content-center text-center">
                        <div class="col-6 p-0 align-self-center">
                            <p class="d-inline fs-5">USD <fmt:formatNumber value="${product.getPrice()}" type="currency"
                                                                           currencySymbol="$"
                                                                           maxFractionDigits="2" /></p>
                        </div>
                        <div class="col-3 p-0">
                            <form action="AddToCartServlet" method="post">
                                <input type="hidden" name="itemQty" id="itemQty" value="1">
                                <input type="hidden" name="PID" value="${product.getProductID()}">
                                <button type="submit" ${product.getStockQty() == 0 ? "disabled" : ""}
                                        class="btn btn-success card-link">
                                    <i class="bi bi-cart4"></i>
                                </button>
                            </form>
                        </div>
                        <div class="col-3 p-0">
                            <form action="AddToWishListServlet" method="post">
                                <input type="hidden" name="PID" value="${product.getProductID()}"/>
                                <button type="submit" class="btn btn-danger card-link">
                                    <i class="bi bi-heart-fill"></i>
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<script>
    function redirectToServlet(url, productID) {
        // Construct the final URL with the Product ID
        var finalURL = url + '?PID=' + encodeURIComponent(productID);

        // Redirect to the final URL
        window.location.href = finalURL;
    }
</script>
<%@ include file="footer.jsp"%>
</body>
</html>
