<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.List"%>
<%@page import="com.shaveen.greensupermarket.FetchProduct"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="Model.Product"%>
<!DOCTYPE html>
<c:set var="products" value="${requestScope.result}" />
<c:set var="search" value="${requestScope.search}" />
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Search Result</title>
    <link rel="icon" type="image/x-icon" href="favicon.ico">
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
    <link rel="stylesheet" href="card.css">
</head>
<body>
<%@ include file="header.jsp"%>
<div class="jumbotron jumbotron-fluid position-relative">
    <img
            src="assets/images/HeaderImages/Search.jpg" loading="lazy" class="img-fluid w-100"
            style="max-height: 70vh;" alt="">
    <h1
            class="display-1 fw-semibold text-white text-center position-absolute top-50 start-50 translate-middle p-3"
    >
        Search Result
    </h1>
</div>

<div class="container-fluid">
    <c:if test="${products != null}">
        <h1 class="text-center my-5">Your Searched for "${fn:escapeXml(search)}"</h1>
    </c:if>
    <div class="row gap-1">
        <c:if test="${products != null}">
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
                                    <input type="hidden" name="PID" value="${product.getProductID()}">
                                    <input type="hidden" name="itemQty" id="itemQty" value="1">
                                    <button type="submit" class="btn btn-success card-link" ${product.getStockQty()
                                    == 0 ? "disabled" : ""}>
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
        </c:if>
        <c:if test="${products == null}">
            <h1 class="text-center my-5 text-wrap">Sorry we couldn't find "${fn:escapeXml(search)}" anywhere in our
                store <i
                    class="bi bi-emoji-frown-fill"></i></h1>
        </c:if>
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
