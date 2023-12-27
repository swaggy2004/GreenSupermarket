<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>error</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="search-error.css">
    <style>
        .navbar{
    background-color: #D0F288; 
  }
  .navbar-collapse {
    /*display: flex; align-items center*/
    font-size: 18px;
    font-weight: 600;
  }
  #selected-link{
      color: green ;
    }
  .nav-link{
      color: black;
      margin-right: 10px; 
    }
  .navbar-brand img {
    width: 110px;
    top: 0;
    left: 0;
  }
  .form-inline {
    margin-left: 90px; /* Adjust this value as needed */
    margin-right: 80px;
  }
  .navbar-buttons{
    padding-right: 10px;
  }
  .navbar-buttons .shopping-bag{
   width:28px ;
   height:27px;
   /*margin-left: 100px;*/
  }
  .navbar-buttons .favourite{
   width:26px ;
   height:29px;
  }
  .navbar-buttons .person{
   width:28px ;
   height: 32px;
  }
  .navbar-buttons{
    padding-right: 10px;
  }
  .form-control {
    border: 1.5px solid #00B207;  
    background: var(--white-100, #FFF) url('assets/images/Product-images/Search.svg') no-repeat;
    background-position: 10px 9px;
    padding-left:33px;
    background-size: 16px;
    padding-top:18px;
    padding-bottom:18px;
    margin-right: 5px ;
    padding-right: 5px ;  
  
  }
  .form-control::placeholder {
    color:rgb(199, 199, 199); 
  }
  .btn-outline-success {
    border: 1.5px solid #00B207;
    color: #00B207; 
    margin-right: 0;
  }
  
  .btn-outline-success:hover {
    background-color: #00B207 ;
    border: 1.5px solid #00B207;  
    color: white;  
  }
  
    </style>
</head>
<body>
    <!-- Navbar-->
    
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
   <br><br>
    <!--Navbar end-->
    <div class="full-screen-background d-flex justify-content-center align-items-center">
        <div class="rectangle"> 
            <div class="error-section" >
                <div class="image-icon"></div>
                <p class="error-text1 ">Product not found!</p>
                <p class="error-text2">We cannot find any matches to your search item</p>
                <div class="buttons justify-content-center">
                    <button type="button" class="btn home-button mx-6">
                        <img src="assets/images/errors/arrow_forward.svg" alt="arrow" class="arrow">
                        <b>Back to Home</b>
                    </button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>