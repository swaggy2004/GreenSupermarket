<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/12/2023
  Time: 2:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="stepper.css">

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
<!--Navbar-->
<nav style="background-color: #d0f288;" class="navbar navbar-expand-lg bg-body-tertiary">
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


<!--Navbar-->

<div class="container mt-5">
    <div class="row">

        <!-- First Column -->
        <div class="col-md-12">
            <h1 style="margin-bottom: 50px;">Order Status</h1>

            <div class="card mb-3" style="max-width: 1280px;border-radius: 20px;background-color: #D0F288;">
                <div class="row g-0">
                    <div class="col-md-10">
                        <div class="card-body">
                            <h3 class="card-title">Order #123826526578612</h3>
                            <p class="card-text"><small class="text-body-secondary">Package delivered on 13 December, 2023 at 10.45 AM</small></p>
                        </div>
                    </div>

                    <div class="col-md-2 my-auto ">
                        <div class="card-body">
                            <h3 style="color: #276A07;font-weight: 700;letter-spacing: 0.5px;">Delivered!</h3>
                        </div>
                    </div>
                </div>
            </div>

        </div>


    </div>

    <!--Stepper start-->
    <div class="row">

        <div class="col-md-12">

            <div class="card mb-3" style="max-width: 1280px;border: none;">
                <div class="col-md-12">
                    <div class="card-body">

                        <div class="track justify-content-center">
                            <div class="step active">

                                <img src="assets/StepperCheckIcon.svg"class="icon">

                            </div>
                            <div class="step active">

                                <img src="assets/StepperCheckIcon.svg"class="icon">

                            </div>
                            <div class="step active">

                                <img src="assets/StepperCheckIcon.svg"class="icon">

                            </div>


                        </div>
                        <div class="row text-center">
                            <div class="col-md-4">
                                            <span class="icon">
                                                <img src="assets/StepperOrderPlacedIcon.svg">
                                            </span>
                            </div>
                            <div class="col-md-4">
                                            <span class="icon">
                                                <img src="assets/StepperPackagingIcon.svg">
                                            </span>
                            </div>
                            <div class="col-md-4">
                                            <span class="icon">
                                               <img src="assets/StepperDeliverdIcon.svg">
                                            </span>
                            </div>
                        </div>
                        <div class="row text-center">
                            <div class="col-md-4">
                                <span class="text" >Order placed</span>
                            </div>
                            <div class="col-md-4">
                                <span class="text" >Packaging</span>
                            </div>
                            <div class="col-md-4">
                                <span class="text" >Delivered</span>
                            </div>
                        </div>
                    </div>


                </div>

            </div>
        </div>

    </div>
    <!--Stepper end-->
    <div class="container mt-3 mb-4" style="border: 1px solid #D6D4D4">
        <div class="row">


            <div class="col-md-12">
                <h4 style="margin-bottom: 10px;">Order Activity</h4>

                <div class="card mb-3" style="max-width: 1280px;border:none;">
                    <div class="row g-0">
                        <div class="col-md-1 my-auto">
                            <img src="assets/OrderActivity_doubletickicon.svg" style="width: 60px;background-color: #D5F0D3;" class="img-fluid rounded-start" alt="...">
                        </div>
                        <div class="col-md-11">
                            <div class="card-body">
                                <h6 class="card-title">Your order has been delivered. Thank you for shopping at Green Supermarket!</h6>
                                <p class="card-text"><small class="text-body-secondary">13 December, 2023 at 10:45 AM</small></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card mb-3" style="max-width: 1280px;border:none;">
                    <div class="row g-0">
                        <div class="col-md-1 my-auto">
                            <img src="assets/OrderActivity_reordericon.svg" style="width: 60px;background-color: #D5F0D3;" class="img-fluid rounded-start" alt="...">
                        </div>
                        <div class="col-md-11">
                            <div class="card-body">
                                <h6 class="card-title">Our delivery man (John Wick) Has picked-up your order for delvery. </h6>
                                <p class="card-text"><small class="text-body-secondary">13 December, 2023 at 10:00 AM</small></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card mb-3" style="max-width: 1280px;border:none;">
                    <div class="row g-0">
                        <div class="col-md-1 my-auto">
                            <img src="assets/OrderActivity_usericon.svg" style="width: 60px;background-color: #D5F0D3;" class="img-fluid rounded-start" alt="...">
                        </div>
                        <div class="col-md-11">
                            <div class="card-body">
                                <h6 class="card-title">Your order had been packed and ready to be delivered.</h6>
                                <p class="card-text"><small class="text-body-secondary">13 December, 2023 at 9:20 AM</small></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card mb-3" style="max-width: 1280px;border:none;">
                    <div class="row g-0">
                        <div class="col-md-1 my-auto">
                            <img src="assets/OrderActivity_packageicon.svg" style="width: 60px;background-color: #D5F0D3;" class="img-fluid rounded-start" alt="...">
                        </div>
                        <div class="col-md-11">
                            <div class="card-body">
                                <h6 class="card-title">Your order is successfully verified.</h6>
                                <p class="card-text"><small class="text-body-secondary">12 December, 2023 at 10:35 PM</small></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card mb-3" style="max-width: 1280px;border:none;">
                    <div class="row g-0">
                        <div class="col-md-1 my-auto">
                            <img src="assets/OrderActivity_tickicon.svg" style="width: 60px;background-color: #D5F0D3;" class="img-fluid rounded-start" alt="...">
                        </div>
                        <div class="col-md-11">
                            <div class="card-body">
                                <h6 class="card-title">Your order has been confirmed.</h6>
                                <p class="card-text"><small class="text-body-secondary">12 December, 2023 at 10:34 PM</small></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card mb-3" style="max-width: 1280px;border:none;">
                    <div class="row g-0">
                        <div class="col-md-1 my-auto">
                            <img src="assets/OrderActivity_noteicon.svg" style="width: 60px;background-color: #D5F0D3;" class="img-fluid rounded-start" alt="...">
                        </div>
                        <div class="col-md-11">
                            <div class="card-body">
                                <h6 class="card-title">Your order has been confirmed.</h6>
                                <p class="card-text"><small class="text-body-secondary">12 December, 2023 at 10:34 PM</small></p>
                            </div>
                        </div>
                    </div>
                </div>





            </div>

        </div>
    </div>

</div>


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>

</body>
</html>
