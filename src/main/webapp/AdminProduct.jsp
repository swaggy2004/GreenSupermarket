<%@page import="com.shaveen.greensupermarket.ManageConnection"%>
<%@page import="Model.ProductInfo"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<%@page import="java.util.List"%>
<%

String email = (String) session.getAttribute("email");
String role = (String) session.getAttribute("role");
boolean isLoggedIn =  session.getAttribute("isLoggedIn")!= null && (boolean) session.getAttribute("isLoggedIn");

if ("A".equals(role) && isLoggedIn  && email != null) {
   
%>
<!DOCTYPE html>

<%
    List<ProductInfo> adminproducts = ManageConnection.getProductsinfo();
    pageContext.setAttribute("adminproducts", adminproducts);
%>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Product</title>

    <!--getting bootstrap-->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous"
    />

    <!--getting bootstrap-->
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
    />

    <!--my custom css styling -->
    <link rel="stylesheet" href="AdminCommon.css" />
</head>
<body>
    <%@ include file="header.jsp"%> 
<!--main container for all the body elements-->
<div class="container-fluid">
    <!--starting a row, removing the gutter value and adding a padding-->
    <div class="row gx-0 p-3 mx-auto">
        <!--starting a column-->
        <div class="col border">
            <!--just adding a heading-->
            <h4 class="m-3">Navigation</h4>
            <!--starting a vertical navbar for the buttons-->
            <nav class="nav flex-column">
                <!--adding the buttons and making them active-->
                <a
                        class="nav-link active cus-btn active"
                        aria-current="page"
                        href="AdminProduct.jsp"
                ><i class="bi bi-pencil-fill me-2"></i> Product Edit</a
                >
                <a
                        class="nav-link cus-btn"
                        aria-current="page"
                        href="AdminAccount.jsp"
                ><i class="bi bi-person-circle me-2"></i> Account Management</a
                >
              
                <a class="nav-link cus-btn" aria-current="page" href="adminLogin.jsp">
                    <i class="bi bi-box-arrow-right me-2"></i> Log-out</a
                >
            </nav>
        </div>

        <!--this is the edit product panne-->
        <!-- made it wider than the nav section -->
        <form action="DeleteProductServlet" method="post" class="col col-md-9 p-md-4 mx-md-auto">
            
            <!-- made it inside a container and made all the text in here to be centered -->
            <div class="container text-center pt-4 pt-md-0">
                <!-- this is the title pane with the currently selected option and add a product button -->
                <div class="row pb-5 mx-md-auto row-cols-2">
                    <div class="col cols-1 text-start cols-md-6 gx-0">
                        <h3 class="">Product Edit</h3>
                    </div>
                    <div class="col d-md-flex justify-content-md-end">
                        <a href="AdminAddProduct.jsp">
                           <button type="button" class="btn btn-success p-3 w-auto align-self-end align-self-md-auto">
                            Add Product
                            </button></a>
                    </div>
                </div>

                <!-- this is the row with the two select boxes and search box: Have to add the search box -->
                <div class="row">
                    <div class="col col-md-3 col-sm-12">
                        <select class="form-select" aria-label="Default select example">
                            <option selected>Select Category</option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>
                    </div>
                    <div class="col col-md-3 col-sm-12">
                        <select class="form-select" aria-label="Default select example">
                            <option selected>Select Price</option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>
                    </div>
                </div>
                <!-- added the column titles and made them all capital -->
                <div
                        class="row align-items-center row-cols-xs-1 row-cols-sm-1 row-cols-lg-5 gx-5 py-1 my-2 bg-ribbon border d-none d-lg-flex"
                >
                    <div class="col text-uppercase">Product ID</div>
                    <div class="col text-uppercase">Image</div>
                    <div class="col text-uppercase">Name</div>
                    <div class="col text-uppercase">Unit Price</div>
                </div>
                <!-- made a row and made it responsive for extra small, small and large displays -->
                
            <c:forEach items="${adminproducts}" var="admproduct">
                <div
                        class="row align-items-center row-cols-xs-1 row-cols-sm-1 row-cols-lg-5 border border-3 rounded-4 gx-5 py-1 my-2 text-nowrap"
                >
                    <!-- these are the items that will be include in the grid once received from the database -->
                    <div class="col d-sm-flex justify-content-center">${admproduct.getProductID()}</div>
                    <div class="col">
                        <img
                                src="assets/${admproduct.getImagePath()}"
                                alt=""
                                srcset=""
                                class="pro-img img-fluid img-thumbnail rounded-5 border border-3"
                        />
                    </div>
                    <div class="col">${admproduct.getProductName()}(${admproduct.getUnitQuantity()})</div>
                    <div class="col">USD${admproduct.getUnitPrice()}</div>
                    <div class="col">
                        <a href="AdminEditProduct.jsp?productId=${admproduct.getProductID()}"><button type="button" class="btn edit-btn">
                            <i class="bi bi-pencil-square"></i>
                        </button></a>
                        
                        <input type="hidden" name="productId" value="${admproduct.getProductID()}">
                        <button 
                        type="submit" 
                        class="btn delete-btn"
                        >
                        <i class="bi bi-trash"></i></button>
                        
                    </div>
                    
                </div>
            </c:forEach>
                
              
                <!-- added the pagination feature: Have to edit this -->
                <div class="col d-flex justify-content-center">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="#">1</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="#">2</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="#">3</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            
        </form>
    </div>
</div>
<%@ include file="footer.jsp"%>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"
></script>
</body>
</html>
<%
} else {
    // Redirect back to the login page
    response.sendRedirect("adminlogin.jsp");
}
%>