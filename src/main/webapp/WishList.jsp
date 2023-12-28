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
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
    String CID = (String) session.getAttribute("email");
    List<WishList> wishlist = FetchWishList.searchWishlist(CID);
    List<Product> allProducts = new ArrayList<>();

    for (WishList witem : wishlist) {
        System.out.println("Product ID = " + witem.getPID());
        List<Product> productsForItem = FetchProduct.SearchProduct(witem.getPID());
        allProducts.addAll(productsForItem);
    }

    for (Product p : allProducts) {
        System.out.println(p.getProductID());
    }

    pageContext.setAttribute("product", allProducts);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My Wishlist</title>
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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
</head>
<body style="font-family: 'Poppins', sans-serif; line-height: 1.5;">
<%@ include file="header.jsp"%>
<main>
    <div class="container mt-5">
        <h1 class="text-center text-md-start mb-5">My Wishlist</h1>
        <div class="row d-md-flex mx-auto d-none d-md-flex mb-3">
            <div class="col col-5 p-0">
                <h6 class="text-uppercase">Product</h6>
            </div>
            <div class="col col-2 p-0">
                <h6 class="text-uppercase">Status</h6>
            </div>
            <div class="col col-2 p-0">
                <h6 class="text-uppercase">Unit Price</h6>
            </div>
        </div>

        <c:forEach items="${product}" var="item">
        <div
                class="row row-cols-1 m-0 border border-2 rounded-5 mb-3"
        >
            <div class="col col-md-5 p-0 mb-3 mb-md-0">
                <div class="row m-0">
                    <div class="col-md-3 col-5 p-0">
                        <img
                                src="https://befreshcorp.net/wp-content/uploads/2017/06/product-packshot-Carrot.jpg"
                                alt="Carrots"
                                srcset=""
                                class="img-md-fluid w-100 rounded-5"
                        />
                    </div>
                    <div class="col-md-9 col-7 align-self-center p-4">
                        <h6 class="text-capitalize text-break m-0">${item.getProductName()}
                                ${item.getUnitQty()}g</h6>
                    </div>
                </div>
            </div>
            <div class="col-md-2 p-0 align-self-md-center mb-3 mb-md-0">
                <h6
                        class="text-uppercase text-center text-md-start m-0 p-2 p-md-0 ${item.getStockQty() > 0 ?
                    "text-success" : "text-danger"}"
                >
                    ${item.getStockQty() > 0 ? "In Stock" : "Out of Stock"}
                </h6>
            </div>
            <div class="col-md-2 p-0 align-self-md-center mb-3 mb-md-0">
                <h6 class="text-uppercase text-center text-md-start m-0 p-2 p-md-0">
                    USD <fmt:formatNumber value="${item.getPrice()}" type="currency" currencySymbol="$"
                                          maxFractionDigits="2" />
                </h6>
            </div>
            <div class="col-md-3 p-0 align-self-center mb-3 mb-md-0">
                <div
                        class="row row-cols-md-3 row-cols-1 m-0 text-center gap-3 gap-md-0"
                >
                    <div class="col text-center p-0 text-md-end">
                        <form action="AddToCartServlet" method="post">
                            <input type="hidden" name="PID" value="${item.getProductID()}">
                            <button type="submit" ${item.getStockQty() == 0 ? "disabled" : ""}
                                    class="btn bg-success">
                                <i class="bi bi-cart-plus-fill fs-6"></i>
                            </button>
                        </form>
                    </div>
                    <div class="col text-center p-0 text-md-end">
                        <form action="RemoveFromWishListServlet" method="post">
                            <input type="hidden" name="PID" value="${item.getProductID()}">
                            <button type="submit" class="btn bg-danger" aria-label="Close">
                                <i class="bi bi-x-lg fs-6"></i>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        </c:forEach>
        <a href="index.jsp">
            <button type="button" class="btn btn-dark mt-3 mb-3">
                <i class="bi bi-arrow-left fs-5"> Back to Shopping</i>
            </button>
        </a>
    </div>
</main>
<%@ include file="footer.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>

</body>
</html>
