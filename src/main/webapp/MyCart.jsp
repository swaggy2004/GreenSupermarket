<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/12/2023
  Time: 2:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.shaveen.greensupermarket.FetchProduct"%>
<%@page import="jakarta.servlet.*, jakarta.servlet.http.*"%>
<%@page import="Model.Product"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.shaveen.greensupermarket.FetchShoppingCart"%>
<%@page import="Model.ShoppingCart"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
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
            <div class="icons-container">  Container for icons in mobile view 
                 Desktop icons 
                <a class="nav-link active" aria-current="page" href="#"><img src="assets/shopping_bag.svg" alt="Cart"></a>
                <a class="nav-link active" aria-current="page" href="#"><img src="assets/favorite.svg" alt="Favorite"></a>
                <a class="nav-link active" aria-current="page" href="#"><img src="assets/person_2.svg" alt="Profile"></a>
            </div>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <div class="row">


        <div class="col-md-12">
            <h1 style="margin-bottom: 50px;">My Cart</h1>
            <div style="max-width: 1280px;">
                <div class="row mb-2 d-none d-lg-flex">
                    <div class="col-md-6">
                        <div class="card-body">
                            <h6>PRODUCT</h6>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="card-body">
                            <h6>UNIT PRICE</h6>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="card-body">
                            <h6>QTY</h6>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="card-body">
                            <h6>PRICE</h6>
                        </div>
                    </div>
                </div>
            </div>
            
            <c:set var="email" value="${sessionScope.email}" />

            <c:forEach var="cartItem" items="${FetchShoppingCart.searchCart(email)}">
                <c:set var="productId" value="${cartItem.PID}" />
                <c:set var="products" value="${FetchProduct.SearchProduct(productId)}" />

                <c:forEach var="product" items="${products}">
                    <div class="card mb-3" style="max-width: 1280px; border-radius: 20px;">
                        <div class="row g-0">
                            <div class="col-md-2 mx-2 border">
                                <img src="assets/vegi1.png" style="width: 100px; border-radius: 20px;" class="img-fluid rounded-start " alt="...">
                            </div>
                            <div class="col-md-4 my-auto ">
                                <div class="card-body">
                                    <h5>${product.productName}</h5>
                                </div>
                            </div>
                            <div class="col-md-2 my-auto ">
                                <div class="card-body">
                                    <h5>USD ${product.price}</h5>
                                </div>
                            </div>
                            <div class="col-md-1 my-auto">
                                <div class="card-body">
                                    <input type="number" class="form-control" name="PQty" value="${cartItem.PQty}">
                                </div>
                            </div>
                            <div class="col-md-1 my-auto">
                                <div class="card-body">
                                    <h5>USD ${String.format("%.2f", cartItem.PQty * product.price)}</h5>
                                </div>
                            </div>

                            <div class="col-md-1 my-auto ">
                                <div class="card-body">
                                    <button type="button" class="btn-close" aria-label="Close"></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:forEach>
        </div>

    </div>
    <div class="row">
        <div class="col-md-9"></div>
        <div class="col-md-3"style="background-color:#F2F2F2;">
            <div class="row mb-2">
                <div class="col-md-6"><h3>Total</h3></div>
                <div class="col-md-6"><h3>USD</h3></div>
            </div>
            <div class="row mb-3">
                <div class="col-md-12 ">
                    <div class="d-grid 2">
                        
                        <form id="checkoutForm" action="OrderServlet" method="post">
                            <button id="checkoutBtn" class="btn btn-primary" style="background-color: #34A853; border-color: #34A853;" type="submit">Check Out</button>
                        </form>
                        
                        <div class="modal" id="myModal">
                            <div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-3 ms-auto" style="text-align: left;"><button type="button" class="btn-info" style="background-color:white; border:none;"><img src="assets/MyCartpopuparrowback.svg" style="width: 40px;border:none; " class="img-thumbnail" alt="..."></button></div>
                                                <div class="col-md-6 center"><h4 class="modal-title" style="text-align: center;">Order Placed</h4></div>
                                                <div class="col-md-3 my-auto" style="text-align: right;"><button type="button"  class="btn-close " data-bs-dismiss="modal"></button></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container">
                                            <div class="row">
                                                <div class="col-md-12 mb-3 mt-3" style="text-align: center;"><h4 class="modal-title">Order No #123826526578612</h4></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12" style="text-align: center;"><img src="assets/MyCartpopupcheck.svg" style="width: 100px" class="rounded" alt="..."></div>
                                            </div>
                                            <div class="row mt-4">
                                                <div class="col-md-12" style="text-align: center;"><h5 class="modal-title">Success</h5></div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <div class="container">
                                            <div class="row ">
                                                <div class="col-md-12" style="text-align: center;"><div class="d-grid gap-2 col-3 mx-auto"><button type="submit" class="btn btn-primary">Proceed To Payment</button></div></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
<script src="MyCartQuantityfunction.js"></script>
</body>
</html>
