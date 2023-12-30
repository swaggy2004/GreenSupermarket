<%@ page import="com.shaveen.greensupermarket.FetchProduct" %>
<%@page import="Model.Product"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<%
  List<Product> ProductList = FetchProduct.getTopProducts();
  pageContext.setAttribute("products", ProductList);
%>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <title>Green Supermarket</title>
  <link rel="icon" type="image/x-icon" href="favicon.ico">
  <link rel="stylesheet" href="index.CSS">
</head>
<body>
  <%@ include file="header.jsp"%>  
    
    
    
<!--Jumbotron-->
<div class="jumbotron">
  <div class="jumbotron-text">
    Unpack a world<br>of freshness in<br>every bag
    
  </div>
</div>
<!--Catory section headings-->
<div class="category-section"> 
  Category
    <div class="category-heading">
        Shop by Categories
    </div>
</div>
<!--Catory section cards-->
<div class="container">
  <div class="row justify-content-center">
    <!--card1-->
    <div class="col-lg-3 col-md-6 card-spacing">
      <a href="ProductCatalogue.jsp?category=Fruit" class="card-link text-body text-decoration-none"
         name="fruits">
        <div class="card card-custom">
          <img src="assets/images/Product-images/fresh-fruits.svg" class="card-img-top" alt="Ladies Fingers">
          <div class="card-body">
            <h5 class="card-title text-center">Fresh Fruit</h5>
          </div>
        </div>
      </a>
    </div>
    <!--card2-->
    <div class="col-lg-3 col-md-6 card-spacing">
      <a href="ProductCatalogue.jsp?category=Vegetable" class="card-link text-body text-decoration-none" name="vegetables">
      <div class="card card-custom">
        <img src="assets/images/Product-images/fresh-vegetables.svg" class="card-img-top" alt="Ladies Fingers">
        <div class="card-body">
          <h5 class="card-title text-center">Fresh vegetables</h5>
        </div>
      </div>
      </a>
    </div>
     <!--card3-->
    <div class="col-lg-3 col-md-6 card-spacing">
      <a href="ProductCatalogue.jsp?category=Protein" class="card-link text-body text-decoration-none"
         name="protein">
      <div class="card card-custom">
        <img src="assets/images/Product-images/meat-fish.svg" class="card-img-top" alt="Ladies Fingers">
        <div class="card-body">
          <h5 class="card-title text-center">Meat & Fish</h5>
        </div>
      </div>
      </a>
    </div>
     <!--card4-->
    <div class="col-lg-3 col-md-6 card-spacing">
      <a href="ProductCatalogue.jsp?category=Snacks" class="card-link text-body text-decoration-none"
         name="vegetables">
      <div class="card card-custom">
        <img src="assets/images/Product-images/snack.svg" class="card-img-top" alt="Ladies Fingers">
        <div class="card-body">
          <h5 class="card-title text-center">Snacks</h5>
        </div>
    </div>
  </a>
  </div>
</div>
</div>
<!--Featured product headings-->
<div class="products-section"> 
  PRODUCTS
    <div class="product-heading">
       Our Featured Products
    </div>
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
            <h4 class="card-title">${product.getProductName()} ${product.getUnitQty()}g</h4>
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
                  <button type="submit" ${product.getStockQty() == 0 ? "disabled" : ""} class="btn btn-success card-link">
                    <i class="bi bi-cart4"></i>
                  </button>
                </form>
              </div>
              <div class="col-3 p-0">
                <form action="AddToWishListServlet" method="post">
                  <intput type="hidden" name="PID" value="${product.getProductID()}"/>
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
<!--Featured product cards-->
<%-- <div class="container p-md-0 p-0 px-4"><!--container to hold all cards-->--%>
<%--  <div class="row m-0 p-0 justify-content-md-between">--%>
<%--    <!--Vegatable button card-->--%>
<%--    <div class="col p-0 mb-3 col-lg-2 col-md-4 col-sm-6 card-spacing2 ">--%>
<%--      <div class="card card-custom3"> --%>
<%--        <div class="card-body d-flex flex-column align-items-center ">--%>
<%--          <h5 class="card-title3 text-center">WANT TO BUY HOUSEHOLD</h5>--%>
<%--          <h5 class="card-title4 text-center">VEGETABLES?</h5>--%>
<%--          <button class="btn btn-success btn-vegetables">Vegetables  ?</button>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--    <!--card1-->--%>
<%--    <div class="col p-0 m-0 mb-3 col-lg-2 col-md-4 col-sm-6 card-spacing2">--%>
<%--      <div class="card card-custom2">--%>
<%--        <div class="heart-icon"></div>--%>
<%--        <img src="assets/images/Product-images/lettuce.svg" class="card-img-top" alt="Lettuce">--%>
<%--        <div class="card-body">--%>
<%--          <h5 class="card-title">Lettuce (100g)</h5>--%>
<%--          <h5 class="card-title2">USD 30.00</h5>--%>
<%--          <div class="circle text-center">--%>
<%--            <img src="assets/images/individual-catalogs/vegetables/cart-icon.svg" class="circle-img" alt="cart-icon">--%>
<%--          </div>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--    <!--card2-->--%>
<%--    <div class="col p-0 m-0 mb-3 col-lg-2 col-md-4 col-sm-6 card-spacing2">--%>
<%--      <div class="card card-custom2 position-relative">--%>
<%--        <div class="heart-icon"></div>--%>
<%--        <img src="assets/images/Product-images/cabbage.svg" class="card-img-top" alt="Ladies Fingers">--%>
<%--        <div class="card-body">--%>
<%--          <h5 class="card-title">cabbage(100g)</h5>--%>
<%--          <h5 class="card-title2">USD 70.00</h5>--%>
<%--          <div class="circle text-center">--%>
<%--            <img src="assets/images/individual-catalogs/vegetables/cart-icon.svg" class="circle-img" alt="cart-icon">--%>
<%--          </div>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--    <!--card3-->--%>
<%--    <div class="col p-0 m-0 mb-3 col-lg-2 col-md-4 col-sm-6 card-spacing2">--%>
<%--      <div class="card card-custom2">--%>
<%--        <div class="heart-icon"></div>--%>
<%--        <img src="assets/images/Product-images/lettuce.svg" class="card-img-top" alt="Lettuce">--%>
<%--        <div class="card-body">--%>
<%--          <h5 class="card-title">Lettuce (100g)</h5>--%>
<%--          <h5 class="card-title2">USD 30.00</h5>--%>
<%--          <div class="circle text-center">--%>
<%--            <img src="assets/images/individual-catalogs/vegetables/cart-icon.svg" class="circle-img" alt="cart-icon">--%>
<%--          </div>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--    <!--card4-->--%>
<%--    <div class="col p-0 m-0 mb-3 col-lg-2 col-md-4 col-sm-6 card-spacing2">--%>
<%--      <div class="card card-custom2">--%>
<%--        <div class="heart-icon"></div>--%>
<%--        <img src="assets/images/Product-images/lettuce.svg" class="card-img-top" alt="Lettuce">--%>
<%--        <div class="card-body">--%>
<%--          <h5 class="card-title">Lettuce (100g)</h5>--%>
<%--          <h5 class="card-title2">USD 30.00</h5>--%>
<%--          <div class="circle text-center">--%>
<%--            <img src="assets/images/individual-catalogs/vegetables/cart-icon.svg" class="circle-img" alt="cart-icon">--%>
<%--          </div>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--    </div>--%>

<%--  </div>--%>
<%--</div>--%>
<%--<!-- section headings-->--%>
<%--<div class="products-section"> --%>
<%--  Discounts--%>
<%--   <div class="product-heading">--%>
<%--        Sale Products--%>
<%--   </div>--%>
<%--</div>--%>
<%--<div class="container discount-div">--%>
<%--  <div class="row h-100">--%>
<%--    <div class="col inner-div">--%>
<%--      <!-- Your content for the first div goes here -->--%>
<%--    </div>--%>
<%--    <div class="col inner-div">--%>
<%--      <!-- Your content for the second div goes here -->--%>
<%--    </div>--%>
<%--    <div class="col inner-div">--%>
<%--      <!-- Your content for the third div goes here -->--%>
<%--    </div>--%>
<%--    <div class="col inner-div">--%>
<%--      <!-- Your content for the fourth div goes here -->--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</div>--%>


<!--Client section headings-->
<div class="products-section"> 
   CLIENT TESTIMONIAL
    <div class="product-heading">
        What our Client Says
    </div>
</div>
<!--client section div cards-->
<div class="container">
  <div class="row justify-content-center">
    <div class="client-review">
      <img src="assets/images/Product-images/comma.svg" alt="Image 1">
      <p>Pellentesque eu nibh eget mauris congue mattis mattis nec tellus. Phasellus imperdiet elit eu magna dictum, bibendum cursus velit sodales. Donec sed neque eget</p>
      <div class="info">
        <img src="assets/images/Product-images/profile.svg" alt="Image 2">
        <div>
          <div class="name">Robert Fox</div>
          <div class="role">Customer</div>
          <div class="star"><img src="assets/images/Product-images/star-rating.svg" alt="Image 2"></div>
        </div>
      </div>
    </div>
    <div class="client-review">
      <img src="assets/images/Product-images/comma.svg" alt="Image 1">
      <p>Pellentesque eu nibh eget mauris congue mattis mattis nec tellus. Phasellus imperdiet elit eu magna dictum, bibendum cursus velit sodales. Donec sed neque eget</p>
      <div class="info">
        <img src="assets/images/Product-images/profile.svg" alt="Image 2">
        <div>
          <div class="name">Robert Fox</div>
          <div class="role">Customer</div>
          <div class="star"><img src="assets/images/Product-images/star-rating.svg" alt="Image 2"></div>
        </div>
      </div>
    </div>
    <div class="client-review">
      <img src="assets/images/Product-images/comma.svg" alt="Image 1">
      <p>Pellentesque eu nibh eget mauris congue mattis mattis nec tellus. Phasellus imperdiet elit eu magna dictum, bibendum cursus velit sodales. Donec sed neque eget</p>
      <div class="info">
        <img src="assets/images/Product-images/profile.svg" alt="Image 2">
        <div>
          <div class="name">Robert Fox</div>
          <div class="role">Customer</div>
          <div class="star"><img src="assets/images/Product-images/star-rating.svg" alt="Image 2"></div>
        </div>
      </div>
    </div>
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

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js"></script>
<%@ include file="footer.jsp"%> 
</body>
</html>