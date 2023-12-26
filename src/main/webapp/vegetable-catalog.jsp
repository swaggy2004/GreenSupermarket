<%@page import="java.util.List"%>
<%@page import="com.shaveen.greensupermarket.FetchProduct"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<%@page import="Model.Product"%>
<!DOCTYPE html>
<c:set var="category" value="${param.category}" />
<c:if test="${not empty category}">
    <c:set var="products" value="${FetchProduct.SearchProduct(category)}" />
    <c:set var="products" scope="page" value="${products}" />
</c:if>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate">
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv="Expires" content="0">

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <title>Vegetable Catalogue</title>
  <link rel="stylesheet" href="vegetables.CSS">
</head>
<body>
    <%@ include file="header.jsp"%> 
      <div class="jumbotron d-none d-sm-block">
        <div class="jumbotron-text">
         <br><br> Vegetables
        </div>
      </div>
      <br>
      <div class="container">
        <div class="justify-content-center d-flex flex-row flex-wrap">

            <c:forEach items="${products}" var="product">
                <div class="col-lg-3 col-md-6 card-spacing" onclick="submitProductForm('${product.getProductID()}')">
                    <form id="productForm_${product.getProductID()}" action="ProductDetail.jsp" method="post">
                        <input type="hidden" name="PID" value="${product.getProductID()}">
                    </form>
                    <div class="card card-custom">
                        <img src="assets/images/individual-catalogs/vegetables/img1.svg" class="card-img-top" alt="Product Image">
                        <div class="card-body">
                            <h5 class="card-title1">${product.getProductName()} ${product.getUnitQty()}g</h5>
                            <h5 class="card-title2">USD ${product.getPrice()}</h5>
                            <div class="circle">
                                <img src="assets/images/individual-catalogs/vegetables/cart-icon.svg" class="circle-img" alt="cart-icon">
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
      </div> 
<%@ include file="footer.jsp"%>
    <script>
        function submitCartForm(productID) {
            var form = document.getElementById("addToCartForm_" + productID);
            form.submit();
        }
    </script>
    <script>
        function submitProductForm(productId) {
            // Get the form associated with the clicked product ID
            var form = document.getElementById("productForm_" + productId);

            // Submit the form
            form.submit();
        }
    </script>

</body>
</html>