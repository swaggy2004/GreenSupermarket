<%@page import="java.util.List"%>
<%@page import="com.shaveen.greensupermarket.FetchProduct"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<%@page import="Model.Product"%>
<!DOCTYPE html>
<%
    List<Product> products = FetchProduct.SearchProduct();
    pageContext.setAttribute("products", products);
%>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <title>Vegetable Catalogue</title>
  <link rel="stylesheet" href="vegetables.CSS">
</head>
<body>
    <%@ include file="header.jsp"%> 
      <div class="jumbotron d-none d-sm-block">
        <div class="jumbotron-text">
         <br><br> Vegetables
        </div>
      </div>
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-12 col-md-6 d-flex justify-content-center mb-2">
            <select class="select-box custom-select mr-2">
              <option selected>Select Category</option>
           
            </select>
            <select class="select-box custom-select">
              <option selected>Select Price</option>
     
            </select>
          </div>
          <div class="col-12 col-md-6 d-flex justify-content-center">
            <select class="select-box custom-select mr-2">
              <option selected>Sort by: Latest</option>
              
            </select>
            <select class="select-box custom-select">
              <option selected>Show: 16</option>
             
            </select>
          </div>
        </div>
      </div>
      <br>
      <div class="container">
        <div class="justify-content-center d-flex flex-row flex-wrap">
            
            <c:forEach items="${products}" var = "product">
                <div class="col-lg-3 col-md-6 card-spacing">
                    <div class="card card-custom">
                      <img src="assets/images/individual-catalogs/vegetables/img1.svg" class="card-img-top" alt="Ladies Fingers">
                      <div class="card-body">
                        <h5 class="card-title1">${product.getProductName()} ${product.getUnitQty()}g</h5>
                        <h5 class="card-title2">USD ${product.getPrice()}</h5>
                        <div class="circle">
                          <img src="assets/images/individual-catalogs/vegetables/cart-icon.svg" class="circle-img" alt="cart-icon">
                        </div>
                      </div>
                    </div>
                </div>
            </c:forEach>
          </div>
      </div> 
<%@ include file="footer.jsp"%>
</body>
</html>