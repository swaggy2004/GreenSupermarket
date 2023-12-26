<!DOCTYPE html>
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
        Shop by Top Categories
    </div>
</div>
<!--Catory section cards-->
<div class="container">
  <div class="row justify-content-center">
    <!--card1-->
    <div class="col-lg-3 col-md-6 card-spacing">
      <a href="link-to-your-page.html" class="card-link text-body text-decoration-none">
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
      <a href="vegetable-catalog.jsp?category=Vegetable" class="card-link text-body text-decoration-none" name="vegetables">
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
      <a href="link-to-your-page.html" class="card-link text-body text-decoration-none"><!--link to another page-->
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
      <a href="link-to-your-page.html" class="card-link text-body text-decoration-none">
      <div class="card card-custom">
        <img src="assets/images/Product-images/snack.svg" class="card-img-top" alt="Ladies Fingers">
        <div class="card-body">
          <h5 class="card-title text-center">Snacks</h5>
        </div>
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
<!--Featured product cards-->
 <div class="container p-md-0 p-0 px-4"><!--container to hold all cards-->
  <div class="row m-0 p-0 justify-content-md-between">
    <!--Vegatable button card-->
    <div class="col p-0 mb-3 col-lg-2 col-md-4 col-sm-6 card-spacing2 ">
      <div class="card card-custom3"> 
        <div class="card-body d-flex flex-column align-items-center ">
          <h5 class="card-title3 text-center">WANT TO BUY HOUSEHOLD</h5>
          <h5 class="card-title4 text-center">VEGETABLES?</h5>
          <button class="btn btn-success btn-vegetables">Vegetables  ➜</button>
        </div>
      </div>
    </div>
    <!--card1-->
    <div class="col p-0 m-0 mb-3 col-lg-2 col-md-4 col-sm-6 card-spacing2">
      <div class="card card-custom2">
        <div class="heart-icon"></div>
        <img src="assets/images/Product-images/lettuce.svg" class="card-img-top" alt="Lettuce">
        <div class="card-body">
          <h5 class="card-title">Lettuce (100g)</h5>
          <h5 class="card-title2">LKR 30.00</h5>
          <div class="circle text-center">
            <img src="assets/images/individual-catalogs/vegetables/cart-icon.svg" class="circle-img" alt="cart-icon">
          </div>
        </div>
      </div>
    </div>
    <!--card2-->
    <div class="col p-0 m-0 mb-3 col-lg-2 col-md-4 col-sm-6 card-spacing2">
      <div class="card card-custom2 position-relative">
        <div class="heart-icon"></div>
        <img src="assets/images/Product-images/cabbage.svg" class="card-img-top" alt="Ladies Fingers">
        <div class="card-body">
          <h5 class="card-title">cabbage(100g)</h5>
          <h5 class="card-title2">LKR 70.00</h5>
          <div class="circle text-center">
            <img src="assets/images/individual-catalogs/vegetables/cart-icon.svg" class="circle-img" alt="cart-icon">
          </div>
        </div>
      </div>
    </div>
    <!--card3-->
    <div class="col p-0 m-0 mb-3 col-lg-2 col-md-4 col-sm-6 card-spacing2">
      <div class="card card-custom2">
        <div class="heart-icon"></div>
        <img src="assets/images/Product-images/lettuce.svg" class="card-img-top" alt="Lettuce">
        <div class="card-body">
          <h5 class="card-title">Lettuce (100g)</h5>
          <h5 class="card-title2">LKR 30.00</h5>
          <div class="circle text-center">
            <img src="assets/images/individual-catalogs/vegetables/cart-icon.svg" class="circle-img" alt="cart-icon">
          </div>
        </div>
      </div>
    </div>
    <!--card4-->
    <div class="col p-0 m-0 mb-3 col-lg-2 col-md-4 col-sm-6 card-spacing2">
      <div class="card card-custom2">
        <div class="heart-icon"></div>
        <img src="assets/images/Product-images/lettuce.svg" class="card-img-top" alt="Lettuce">
        <div class="card-body">
          <h5 class="card-title">Lettuce (100g)</h5>
          <h5 class="card-title2">LKR 30.00</h5>
          <div class="circle text-center">
            <img src="assets/images/individual-catalogs/vegetables/cart-icon.svg" class="circle-img" alt="cart-icon">
          </div>
        </div>
      </div>
    </div>

  </div>
</div>
<!-- section headings-->
<div class="products-section"> 
  Discounts
   <div class="product-heading">
        Sale Products
   </div>
</div>
<div class="container discount-div">
  <div class="row h-100">
    <div class="col inner-div">
      <!-- Your content for the first div goes here -->
    </div>
    <div class="col inner-div">
      <!-- Your content for the second div goes here -->
    </div>
    <div class="col inner-div">
      <!-- Your content for the third div goes here -->
    </div>
    <div class="col inner-div">
      <!-- Your content for the fourth div goes here -->
    </div>
  </div>
</div>


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


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js"></script>
<%@ include file="footer.jsp"%> 
</body>
</html>


