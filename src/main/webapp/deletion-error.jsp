<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>error</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="order-error.css">
</head>
<body>
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
      <br>
      <!--Navbar over-->
      
    <div class="full-screen-background d-flex justify-content-center align-items-center">
        <div class="rectangle"> 
            <div class="error-section" >
                <div class="image-icon"></div>
                <p class="error-text1 ">Failed to delete account!</p>
                <p class="error-text2">Oops, your account was not deleted. Try again</p>
                <div class="buttons justify-content-center">
                    <button type="button" class="btn home-button mx-6">
                        <b>Try again</b>
                    </button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>