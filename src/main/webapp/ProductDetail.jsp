<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/12/2023
  Time: 2:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="com.shaveen.greensupermarket.FetchProduct"%>
<%@page import="Model.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c"%>

<%
        String ProductID = (String) request.getParameter("PID");
        int PID = Integer.parseInt(ProductID);

        // Call the SearchProduct method to retrieve a list of products
        Product product = FetchProduct.searchProduct(PID);

        // Set the productList as an attribute in the page context
        pageContext.setAttribute("product", product);     
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="ProductDetails.css">
    <title class="text-capitalize">${product.getProductName()}</title>
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
<div class="container p-4 my-5">
    <div class="row border border-4 rounded-3 p-3">
        <div class="col col-md-6 col-12">
            <img
                    src="${product.getImgPath()}"
                    alt=""
                    class="img-fluid rounded-3"
            />
        </div>
        <div class="col col-12 col-md-6">
            <h3 class="my-3 text-capitalize">Product Name: ${product.getProductName()}</h3>
            <h6 class="my-3 text-capitalize ${product.getStockQty() == 0 ? "text-danger": "text-success"}">
                [${product.getStockQty() == 0 ? "Out of Stock": "In Stock"}]</h6>
            <h5 class="my-3">Product Quantity: ${product.getUnitQty()}g </h5>
            <h5 class="">Product Description</h5>
            <p class="d-block" style="text-align: justify;">
                ${product.getDescription()}
            </p>
            <h5 class="my-3">Product Category: ${product.getCategory()}</h5>
            <h5 class="my-3">
                <form action="AddToCartServlet" method="post" class="d-inline">
                <label for="itemQty" class="form-label d-inline">Quantity:</label>
                <input
                        type="number"
                        name="itemQty"
                        id="itemQty"
                        placeholder="1"
                        value="1"
                        min="1"
                        max="${product.getStockQty()}"
                        class="form-control w-25 d-inline"
                />
            </h5>


                <input type="hidden" name="PID" value="${product.getProductID()}">
                <button type="submit" ${product.getStockQty() > 0 ? '' : 'disabled'} class="btn btn-success">
                    <i class="bi bi-cart-plus"></i>
                </button>
            </form>
            <form action="AddToWishListServlet" method="post" class="d-inline">
                <input type="hidden" name="PID" value="${product.getProductID()}">
                <button
                        type="submit"
                        value="Add to Cart"
                        class="btn btn-danger inline"
                >
                    <i class="bi bi-heart-fill"></i>
                </button>
            </form>
        </div>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        var quantityInput = document.getElementById('itemQty');

        if (quantityInput) {
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
        }
    });
</script>


<%@ include file="footer.jsp"%>
</body>
</html>
