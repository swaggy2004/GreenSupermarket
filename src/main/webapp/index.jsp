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
  <link rel="stylesheet" href="index.css">
</head>
<body>
  <%@ include file="header.jsp"%>
  <div
          class="container-fluid w-100 p-0"
          style="
        background-image: url(assets/images/IndexPage/indexpageimage.png);
        background-size: cover;
        background-position: center;
        height: 36rem;
      "
  >
    <h1 class="display-1 fw-bold text-dark text-md-start col-md-7 position-relative" style="top: 25%">
      Unpack a world of Freshness in every bag
    </h1>
  </div>

  <div class="container mt-5 mb-5">
    <h2 class="display-4 text-center m-5">Shop by Category</h2>
    <div class="row p-0 gap-3">
      <div class="col p-0">
          <a href="ProductCatalogue.jsp?category=Fruit" class="text-decoration-none">
              <div class="card mx-auto" style="width: 18rem; height: 18rem">
          <img
                  src="assets/images/IndexPage/Fruit.png"
                  alt="Fruits"
                  class="card-img-top img-fluid position-absolute"
          />
          <h3
                  class="card-title text-center position-relative fw-semibold"
                  style="top: 80%"
          >
            Fruits
          </h3>
        </div>
          </a>
      </div>
      <div class="col p-0">
          <a href="ProductCatalogue.jsp?category=Vegetable" class="text-decoration-none">
              <div class="card mx-auto" style="width: 18rem; height: 18rem">
          <img
                  src="assets/images/IndexPage/Vegetable.png"
                  alt="Vegetables"
                  class="card-img-top img-fluid position-absolute"
          />
          <h3
                  class="card-title text-center position-relative fw-semibold"
                  style="top: 80%"
          >
            Vegetables
          </h3>
        </div>
          </a>
      </div>
      <div class="col p-0">
          <a href="ProductCatalogue.jsp?category=Protein" class="text-decoration-none">
              <div class="card mx-auto" style="width: 18rem; height: 18rem">
          <img
                  src="assets/images/IndexPage/Meat.png"
                  alt="Meat and Fish"
                  class="card-img-top img-fluid position-absolute"
          />
          <h3
                  class="card-title text-center position-relative fw-semibold"
                  style="top: 80%"
          >
            Meat & Fish
          </h3>
        </div>
          </a>
      </div>
      <div class="col p-0">
          <a href="ProductCatalogue.jsp?category=Fruit" class="text-decoration-none">
              <div class="card mx-auto" style="width: 18rem; height: 18rem">
          <img
                  src="assets/images/IndexPage/Snack.png"
                  alt="Snack items"
                  class="card-img-top img-fluid position-absolute"
          />
          <h3
                  class="card-title text-center position-relative fw-semibold"
                  style="top: 80%"
          >
            Snacks
          </h3>
        </div>
          </a>
      </div>
    </div>
  </div>
<!--Featured product headings-->
  <h2 class="display-4 text-center m-5">Our Featured Products</h2>
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
                  <input type="hidden" name="PID" value="${product.getProductID()}">
                  <input type="hidden" name="itemQty" id="itemQty" value="1">
                  <button type="submit" ${product.getStockQty() == 0 ? "disabled" : ""} class="btn btn-success card-link">
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

  <div class="products-section mt-4">
      <h1 class="display-4 text-center m-5">CLIENT TESTIMONIAL</h1>
      <div class="product-heading">
          <h3 class="text-center mb-3">What our Client Says</h3>
      </div>
  </div>
  <!--client section div cards-->
  <div class="container mb-4">
      <div class="row justify-content-center">
          <div class="client-review">
              <img src="assets/images/Product-images/comma.svg" alt="Image 1">
              <p>Had an amazing online shopping experience on your Green Supermarket site! User-friendly, found eco-products easily, smooth checkout, and loved the eco-friendly packaging. Impressed with the commitment to sustainability!</p>
              <div class="info">
                  <img src="https://tovanidesign.com/wp-content/uploads/2019/02/C-_Users_Chrystina_Dropbox_tovani-design_size-examples-of-portraits_for-web_1-1-aspect-ratio-prints-at-square-for-social-media-for-web-photo-by-chrysti-tovani.jpg" alt="Image 2">
                  <div>
                      <div class="name">Lark Farpton</div>
                      <div class="role">Customer</div>

                  </div>
              </div>
          </div>
          <div class="client-review">
              <img src="assets/images/Product-images/comma.svg" alt="Image 1">
              <p>Kudos on a fantastic online shopping experience! Your Green Supermarket site's ease of use, detailed product info, and eco-friendly packaging exceeded my expectations. Looking forward to more sustainable purchases!</p>
              <div class="info">
                  <img src="https://plus.college.indiana.edu/images/profiles/profiles-768x768/assistant.jpg" alt="Image 2">
                  <div>
                      <div class="name">Mark Victor</div>
                      <div class="role">Customer</div>

                  </div>
              </div>
          </div>
          <div class="client-review">
              <img src="assets/images/Product-images/comma.svg" alt="Image 1">
              <p>Thrilled with my online shopping on your Green Supermarket site! Effortless navigation, eco-friendly options, and the sustainable packaging really stood out. A top-notch experience, and I'll definitely be a repeat customer!</p>
              <div class="info">
                  <img src="https://blog-pixomatic.s3.appcnt.com/image/22/01/26/61f166e1e3b25/_orig/pixomatic_1572877090227.png" alt="Image 2">
                  <div>
                      <div class="name">Matthew John</div>
                      <div class="role">Customer</div>

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
<%@ include file="footer.jsp"%>
</body>
</html>