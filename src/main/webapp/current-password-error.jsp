<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="adress-error.css">
</head>
<body>
<!--Nav bar-->
<nav class="navbar navbar-expand-md navbar-light">
  <a class="navbar-brand" href="#"><img src="assets/images/Product-images/nav-logo.svg" alt="Logo"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="#" id="selected-link">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Fruits</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Vegetables</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Meat</a>
      </li>    
      <li class="nav-item">
        <a class="nav-link" href="#">Snacks</a>
      </li>  
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
    <div class="navbar-buttons-container">
      <a class="navbar-buttons" href="#"><img src="assets/images/Product-images/shopping-bag.svg" alt="shoppin-bag" class="shopping-bag"></a>
      <a class="navbar-buttons" href="#"><img src="assets/images/Product-images/favorite.svg" alt="Logo" class= "favourite"></a>
      <a class="navbar-buttons" href="#"><img src="assets/images/Product-images/person.svg" alt="Logo" class="person"></a>
    </div>    
  </div> 
</nav>
<!--Navbar over-->

<!--popup-->
<br>
<div class="full-screen-background d-flex justify-content-center align-items-center">
  <div class="rectangle"> 
      <div class="error-section" >
          <div class="image-icon"></div>
          <p class="error-text1 ">Invalid current password!</p>
          <p class="error-text2"> Invalid current password. Please enter the correct current password</p>
          <div class="buttons justify-content-center">
              <a href="UserSettings.jsp"><button type="button" class="btn home-button mx-6">
                  <b>Try again</b>
                  </button></a>
          </div>
      </div>
  </div>
</div>
</body>
</html>