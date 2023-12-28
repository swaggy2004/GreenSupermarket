<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Document</title>
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
<nav class="navbar navbar-expand-md px-3 px-md-0" style="background-color: #d0f288">
  <div class="container-fluid">
    <a class="navbar-brand d-md-hide" href="index.jsp">
      <img
              src="assets\images\BrandLogo\nav-logo.svg"
              alt="Brand Logo"
              width="80"
              height=""
              class="d-inline-block align-text-top"
      />
    </a>
    <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarTogglerDemo02"
            aria-controls="navbarTogglerDemo02"
            aria-expanded="false"
            aria-label="Toggle navigation"
    >
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
      <a class="navbar-brand d-none" href="index.jsp">
        <img
                src="assets\images\BrandLogo\nav-logo.svg"
                alt="Bootstrap"
                width="80"
                height=""
                class="d-inline-block align-text-top"
        />
      </a>
      <ul
              class="navbar-nav me-auto mb-2 mb-md-0 text-center fs-5 fw-semibold"
      >
        <li class="nav-item">
          <a href="index.jsp" class="nav-link"> Home </a>
        </li>
        <li class="nav-item">
          <a href="vegetable-catalog.jsp?category=Fruits" class="nav-link"> Fruits </a>
        </li>
        <li class="nav-item">
          <a href="vegetable-catalog.jsp?category=Vegetable" class="nav-link"> Vegetables </a>
        </li>
        <li class="nav-item">
          <a href="vegetable-catalog.jsp?category=Protein" class="nav-link"> Meat </a>
        </li>
        <li class="nav-item">
          <a href="vegetable-catalog.jsp?category=Snacks" class="nav-link"> Snacks </a>
        </li>
      </ul>
      <form class="d-flex me-md-2 mb-3 mb-md-0" role="search">
        <input
                class="form-control me-2"
                type="search"
                placeholder="Search"
                aria-label="Search"
        />
        <button class="btn btn-outline-success" type="submit">
          Search
        </button>
      </form>
      <div class="text-center p-0">
        <form action="MyCart.jsp" method="post" class="d-inline">
          <input type="hidden">
          <button type="submit" class="btn btn-outline-dark py-0">
            <i class="bi bi-cart4 fs-4"></i>
          </button>
        </form>
        <form action="WishList.jsp" method="post" class="d-inline">
          <input type="hidden">
          <button type="submit" class="btn btn-outline-dark py-0">
            <i class="bi bi-bag-heart fs-4"></i>
          </button>
        </form>
        <form action="UserDashboard.jsp" method="post" class="d-inline">
          <input type="hidden">
          <button type="submit" class="btn btn-outline-dark py-0">
            <i class="bi bi-person-square fs-4"></i>
          </button>
        </form>
      </div>
    </div>
  </div>
</nav>
</body>
</html>
