<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/12/2023
  Time: 2:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="com.shaveen.greensupermarket.FetchProduct"%>
<%@page import="Model.Product"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c"%>

<%
        String ProductID = request.getParameter("PID");
        // Call the SearchProduct method to retrieve a list of products
        Product product = FetchProduct.SearchProduct(ProductID);

        // Set the productList as an attribute in the page context
        pageContext.setAttribute("productList", productList);     
%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="ProductDetails.css">
    <title>Bootstrap demo</title>

</head>
<body>

<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Dropdown
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" aria-disabled="true">Disabled</a>
                </li>
            </ul>
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>
<!--Navbar-->
<!--Grid for product image and details-->
<div class="container text-left" style="margin-top: 180px;margin-left: 75px;margin-right:102px ;">
    <div class="row">
        <div class="col-md-5 ">
            <img src="assets/vegi1.png" class="img-fluid" alt="cabbage">
        </div>
        <div class="col-md-7">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Vegetables</li>
                </ol>
            </nav>
            <h2>${productList.getProductName()}</h2>
            <p>Availability: In stock</p>
            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Neque exercitationem aliquam nulla atque, laboriosam, numquam vero quis ipsa in repellendus non quibusdam asperiores facilis dolorem. Nobis, iste veritatis. Voluptates, temporibus.</p>
            <h3 style="color: #276A07;font-weight: 700;">LKR 29</h3>
            <table class="table table-borderless"style="width: 250px; ">
                <tbody>
                <tr>
                    <td style="vertical-align: middle;">Quantity</td>
                    <td><div class="dropdown">
                        <button
                                class="btn btn-secondary dropdown-toggle"
                                type="button"
                                data-bs-toggle="dropdown"
                                aria-expanded="false"
                                style="background-color:white; color:black;border-color: #34A853;"
                        >
                            100g
                        </button>
                        <ul class="dropdown-menu" style="background-color: white;">
                            <li><button class="dropdown-item" type="button">100g</button></li>
                            <li>
                                <button class="dropdown-item" type="button">200g</button>
                            </li>
                            <li>
                                <button class="dropdown-item" type="button">300g</button>
                            </li>
                        </ul>
                    </div></td>
                </tr>
                </tbody>
            </table>
            <div class="btn-group" role="group" aria-label="Basic example">
                <button
                        type="button"
                        class="btn btn-primary"
                        style="background-color:#34A853; border-color: #34A853"
                >
                    Add to bag
                </button>

                <button
                        type="button"
                        class="btn btn-primary"
                        style="background-color: #34A853;border-color: #34A853 "
                >
                    LKR 25
                </button>
            </div>
            <button type="button" class="btn btn-light"><img src="assets/ProductDetailHeartIcon.svg"></button>

        </div>
    </div>
</div>
<!--Grid for product image and details-->
<!--product detail-->
<div style="background-color:#D0F288;padding: 40px;margin-top: 90px;margin-left: 150px;margin-right: 150px;">
    <div class="h4 pb-2 mb-4 text-black border-bottom border-danger"style="color:black;">
        <h3 >Product details</h3>
    </div>
    <h6><b>Product ID :</b> B493-DB427</h6><br/>
    <h6><b>Availability:</b> In stock</h6> <br/>
    <h6><b>Category:</b> Vegetables</h6>
</div>
<!--product detail-->
<!--Carousel-->
<div id="ControlForCarousel" class="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <div class="card">
                <div class="img-wrapper"><img src="assets/vegi1.png" class="d-block" alt="..."> </div>
                <div class="card-body">
                    <div class="row ">
                        <div class="col-md-12">
                            <h5 class="card-title">Green Lettuce (100g)</h5>
                        </div>
                        <div class="col-md-6">
                            <p class="card-text"><b>LKR 24</b></p>
                        </div>
                        <div class="col-md-6" style="text-align: right;">
                            <button type="button" class="btn btn-light"><img src="assets/ProductDetailBagIcon.svg"></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="carousel-item">
            <div class="card">
                <div class="img-wrapper"><img src="assets/vegi2.png" class="" alt="..."> </div>
                <div class="card-body">
                    <div class="row ">
                        <div class="col-md-12">
                            <h5 class="card-title">Chanise Cabbage (100g)</h5>
                        </div>
                        <div class="col-md-6">
                            <p class="card-text"><b>LKR 24</b></p>
                        </div>
                        <div class="col-md-6" style="text-align: right;">
                            <button type="button" class="btn btn-light"><img src="assets/ProductDetailBagIcon.svg"></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="carousel-item">
            <div class="card">
                <div class="img-wrapper"><img src="assets/vegi4.png" class="" alt="..."> </div>
                <div class="card-body">
                    <div class="row ">
                        <div class="col-md-12">
                            <h5 class="card-title">Corn (100g)</h5>
                        </div>
                        <div class="col-md-6">
                            <p class="card-text"><b>LKR 24</b></p>
                        </div>
                        <div class="col-md-6" style="text-align: right;">
                            <button type="button" class="btn btn-light"><img src="assets/ProductDetailBagIcon.svg"></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="carousel-item">
            <div class="card">
                <div class="img-wrapper"><img src="assets/vegi4.png" class="" alt="..."> </div>
                <div class="card-body">
                    <div class="row ">
                        <div class="col-md-12">
                            <h5 class="card-title">Corn (100g)</h5>
                        </div>
                        <div class="col-md-6">
                            <p class="card-text"><b>LKR 24</b></p>
                        </div>
                        <div class="col-md-6" style="text-align: right;">
                            <button type="button" class="btn btn-light"><img src="assets/ProductDetailBagIcon.svg"></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="carousel-item">
            <div class="card">
                <div class="img-wrapper"><img src="assets/vegi2.png" class="" alt="..."> </div>
                <div class="card-body">
                    <div class="row ">
                        <div class="col-md-12">
                            <h5 class="card-title">Chanise Cabbage (100g)</h5>
                        </div>
                        <div class="col-md-6">
                            <p class="card-text"><b>LKR 24</b></p>
                        </div>
                        <div class="col-md-6" style="text-align: right;">
                            <button type="button" class="btn btn-light"><img src="assets/ProductDetailBagIcon.svg"></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="carousel-item">
            <div class="card">
                <div class="img-wrapper"><img src="assets/vegi1.png" class="" alt="..."> </div>
                <div class="card-body">
                    <div class="row ">
                        <div class="col-md-12">
                            <h5 class="card-title">Green Lettuce (100g)</h5>
                        </div>
                        <div class="col-md-6">
                            <p class="card-text"><b>LKR 24</b></p>
                        </div>
                        <div class="col-md-6" style="text-align: right;">
                            <button type="button" class="btn btn-light"><img src="assets/ProductDetailBagIcon.svg"></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="carousel-item">
            <div class="card">
                <div class="img-wrapper"><img src="assets/vegi4.png" class="" alt="..."> </div>
                <div class="card-body">
                    <div class="row ">
                        <div class="col-md-12">
                            <h5 class="card-title">Corn (100g)</h5>
                        </div>
                        <div class="col-md-6">
                            <p class="card-text"><b>LKR 24</b></p>
                        </div>
                        <div class="col-md-6" style="text-align: right;">
                            <button type="button" class="btn btn-light"><img src="assets/ProductDetailBagIcon.svg"></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="carousel-item">
            <div class="card">
                <div class="img-wrapper"><img src="assets/vegi2.png" class="" alt="..."> </div>
                <div class="card-body">
                    <div class="row ">
                        <div class="col-md-12">
                            <h5 class="card-title">Chanise Cabbage (100g)</h5>
                        </div>
                        <div class="col-md-6">
                            <p class="card-text"><b>LKR 24</b></p>
                        </div>
                        <div class="col-md-6" style="text-align: right;">
                            <button type="button" class="btn btn-light"><img src="assets/ProductDetailBagIcon.svg"></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="carousel-item">
            <div class="card">
                <div class="img-wrapper"><img src="assets/vegi1.png" class="" alt="..."> </div>
                <div class="card-body">
                    <div class="row ">
                        <div class="col-md-12">
                            <h5 class="card-title">Green Lettuce (100g)</h5>
                        </div>
                        <div class="col-md-6">
                            <p class="card-text"><b>LKR 24</b></p>
                        </div>
                        <div class="col-md-6" style="text-align: right;">
                            <button type="button" class="btn btn-light"><img src="assets/ProductDetailBagIcon.svg"></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="carousel-item">
            <div class="card">
                <div class="img-wrapper"><img src="assets/vegi1.png" class="" alt="..."> </div>
                <div class="card-body">
                    <div class="row ">
                        <div class="col-md-12">
                            <h5 class="card-title">Green Lettuce (100g)</h5>
                        </div>
                        <div class="col-md-6">
                            <p class="card-text"><b>LKR 24</b></p>
                        </div>
                        <div class="col-md-6" style="text-align: right;">
                            <button type="button" class="btn btn-light"><img src="assets/ProductDetailBagIcon.svg"></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <button class="carousel-control-prev" type="button" data-bs-target="#ControlForCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#ControlForCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>
<!--Carousel-->

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
<script src="ProductDetails.js"></script>
</body>
</html>
