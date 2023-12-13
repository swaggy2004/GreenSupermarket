<%--
  Created by IntelliJ IDEA.
  User: Jude Darren Victoria
  Date: 06/12/2023
  Time: 07:32 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        /* Custom styles for the burger stack icon in mobile */
        @media (max-width: 767px) {
            .icons-container {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
        }

        /* Custom styles for desktop view */
        @media (min-width: 768px) {
            .icons-container {
                display: flex;
                justify-content: flex-start;
                align-items: center;
                margin-left: auto;
            }

            .icons-container img {
                margin-right: 5px; /* Add some space between the icons */
            }

            .icons-container img:hover {
                opacity: 0.8; /* Add a hover effect */
            }
            .nav-link{
                color:#347809 ;
            }
        }


    </style>
</head>
<body>
<nav style="background-color: #d0f288" class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#"><img style="width: 110px" alt="Navbar Logo" src="assets/NavLogo.svg"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Meats</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link active" aria-current="page" href="#">Fruits</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Vegetables</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Snacks</a>
                </li>
            </ul>
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
            <div class="icons-container"> <!-- Container for icons in mobile view -->
                <!-- Desktop icons -->
                <a class="nav-link active" aria-current="page" href="#"><img src="assets/shopping_bag.svg" alt="Cart"></a>
                <a class="nav-link active" aria-current="page" href="#"><img src="assets/favorite.svg" alt="Favorite"></a>
                <a class="nav-link active" aria-current="page" href="#"><img src="assets/person_2.svg" alt="Profile"></a>
            </div>
        </div>
    </div>
</nav>

<div class="row" style="margin-top: 2rem;margin-left: 1rem">
    <div class="col-2" style="" ><img style="width: 8rem " src="assets/Avatar.png" class="rounded-circle ms-2" alt="User Avatar"></div>
    <div class="col-10">
        <div class="row">
            <div class="col-6">
                <div class="col" style="margin-top: 2rem">
                    <div class="vstack gap-3">
                        <div >
                            <label for="UserEmail" class="form-label">Email address</label>
                            <input type="email" class="form-control" id="UserEmail" placeholder="name@example.com">
                        </div>
                        <div>
                            <label for="UserPhone" class="form-label">Phone Number</label>
                            <input type="text" class="form-control" id="UserPhone" placeholder="071-xxxxxxx">
                        </div>
                        <div class="bg-light border">
                            <select class=" selectpicker countrypicker"></select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-6">col-4</div>
        </div>
    </div>
</div>




<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>

</body>
</html>
