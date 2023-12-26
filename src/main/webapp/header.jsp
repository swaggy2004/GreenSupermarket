<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    /* Navbar styles bar starts here */
    .navbar {
      background-color: #D0F288;
      padding: 10px; /* Add padding to the navbar */
    }

    .navbar-collapse {
      font-size: 18px;
      font-weight: 600;
    }

    #selected-link {
      color: green;
    }

    .nav-link {
      color: black;
      margin-right: 10px;
    }

    .navbar-brand img {
      width: 110px;
      top: 0;
      left: 0;
    }

    .form-inline {
      margin-left: 80px;
      margin-right: 80px;
    }

    .navbar-buttons-container {
      padding-right: 10px;
      margin-left: auto; /* Align to the right */
    }

    .navbar-buttons .shopping-bag,
    .navbar-buttons .favourite,
    .navbar-buttons .person {
      width: 28px;
      height: 27px;
    }

    .form-control {
      border: 1.5px solid #00B207;
      background: var(--white-100, #FFF) url('assets/images/Product-images/Search.svg') no-repeat;
      background-position: 10px 9px;
      padding-left: 33px;
      background-size: 16px;
      padding-top: 18px;
      padding-bottom: 18px;
      margin-right: 5px;
      padding-right: 5px;
    }

    .form-control::placeholder {
      color: rgb(199, 199, 199);
    }

    .btn-outline-success {
      border: 1.5px solid #00B207;
      color: #00B207;
      margin-right: 0;
    }

    .btn-outline-success:hover {
      background-color: #00B207;
      border: 1.5px solid #00B207;
      color: white;
    }

    @media (max-width: 992px) {
      .form-control {
        width: 200px;
      }
    }

    @media (min-width: 992px) {
      .form-control {
        width: 300px;
      }
    }

    @media (max-width: 992px) {
      .form-inline {
        margin-left: 1px;
      }
    }

    /* Navbar done */
  </style>
</head>
<body>
  <!-- Nav bar -->
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
        <a class="navbar-buttons" href="#"><img src="assets/images/Product-images/favorite.svg" alt="Logo" class="favourite"></a>
        <a class="navbar-buttons" href="#"><img src="assets/images/Product-images/person.svg" alt="Logo" class="person"></a>
      </div>
    </div>
  </nav>
  <!-- Navbar over -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
