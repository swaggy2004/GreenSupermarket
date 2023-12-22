<%@page import="com.shaveen.greensupermarket.PStockManagement"%>
<%@page import="Model.ProductStock"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<%@page import="java.util.List"%>
<!doctype html>
<%
     List<ProductStock> ProductStocks = PStockManagement.getProductStock();
    pageContext.setAttribute("ProductStocks", ProductStocks);
%>
<html>
<head>
    <title>Stock Management</title>
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

            .icon-shape {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                text-align: center;
                vertical-align: middle;
            }

            .icon-sm {
                width: 2rem;
                height: 2rem;

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



<ul class="nav nav-tabs" style="margin-top: 1rem; ">
    <li class="nav-item" style="margin-left: 1rem;">
        <a class="nav-link "  href="#">Dashboard</a>
    </li>
    <li class="nav-item">
        <a class="nav-link "  href="#">Order Management</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="#">Feedback Management</a>
    </li>
    <li class="nav-item">
        <a class="nav-link active" aria-current="page" href="#">Stock Management</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="#">Logout</a>
    </li>

</ul>

<div class="row justify-content-end" style="margin-top: 2rem">
    <!-- Select Box 1 -->
    

    <!-- Select Box 2 -->
    

    <!-- Empty Space -->
    <div class="col-md-3 mb-3"></div>

    <!-- Search Box -->
    <!--<form>-->
    <div class="col-md-3 mb-3" style="padding-right: 2rem;">

        <div class="input-group">
            <input type="text" class="form-control" id="searchBox" placeholder="Search" aria-label="Search" aria-describedby="button-addon">
            <button class="btn btn-outline-secondary" type="button" id="button-addon">Search</button>
        </div>
    </div>
</div>






    <table style="margin-top: 2rem ; margin-left: 2rem ; margin-right: 2rem;" class="table">
        <thead>
        <tr>
            <th scope="col">Product ID</th>
            <th scope="col">Stock Status</th>
            <th scope="col">Name</th>
            <th scope="col">Stock Count</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${ProductStocks}" var="ProductSt">
        <form action="PStockQtyUpdateServlet" method="Post">
        <tr>
            <th scope="row">${ProductSt.getProductID()}</th>
            <td>
                <c:choose>
                    <c:when test="${ProductSt.getStockQty() eq 0}">
                        Out of Stock
                    </c:when>
                    <c:when test="${ProductSt.getStockQty() lt 15}">
                        Running Out
                    </c:when>
                    <c:otherwise>
                        In Stock
                    </c:otherwise>
                </c:choose>
            </td>
            <td>${ProductSt.getProductName()}</td>
            <td>
                <div class="input-group w-auto  align-items-center">
                    <input type="number" min="0" step="1" value="${ProductSt.getStockQty()}" name="stock_count" class="quantity-field border-0 text-center ">
                    <input type="hidden" name="productId" value="${ProductSt.getProductID()}">
                    <button type="submit" class="text-uppercase btn btn-success btn-sm ">Update Stock</button>
                </div>
            </td>


        </tr>
        </form>
        </c:forEach>

        </tbody>
    </table>

<div class="col d-flex justify-content-center">
    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
</div>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>


</body>
</html>
