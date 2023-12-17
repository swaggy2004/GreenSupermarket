<%@page import="com.shaveen.greensupermarket.ManageConnection"%>
<%@page import="Model.ProductEdit"%>
<%@ page isELIgnored="false" %>
<%
   String productId = request.getParameter("productId");
   ProductEdit product = ManageConnection.getProductById(productId);
   pageContext.setAttribute("product", product);
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Edit Product</title>

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
    <link rel="stylesheet" href="AdminEditProduct.css" />
  </head>
  <body>
    <!--main container for all the body elements-->
    <div class="container-fluid">
      <!--starting a row, removing the gutter value and adding a padding-->
      <div class="row gx-0 p-3 mx-auto">
        <!--starting a column-->
        <div class="col border mb-4 mb-md-0 h-100">
          <!--just adding a heading-->
          <h4 class="m-3">Navigation</h4>
          <!--starting a vertical navbar for the buttons-->
          <nav class="nav flex-column">
            <!--adding the buttons and making them active-->
            <a
              class="nav-link active cus-btn active"
              aria-current="page"
              href="AdminProduct.html"
              ><i class="bi bi-pencil-fill me-2"></i> Product Edit</a
            >
            <a
              class="nav-link cus-btn"
              aria-current="page"
              href="AdminAccount.html"
              ><i class="bi bi-person-circle me-2"></i> Account Management</a
            >
            <a
              class="nav-link cus-btn"
              aria-current="page"
              href="AdminPromotion.html"
              ><i class="bi bi-percent me-2"></i> Promotion</a
            >
            <a class="nav-link cus-btn" aria-current="page" href="#"
              ><i class="bi bi-gear-wide-connected me-2"></i> Settings</a
            >
            <a class="nav-link cus-btn" aria-current="page" href="#">
              <i class="bi bi-box-arrow-right me-2"></i> Log-out</a
            >
          </nav>
        </div>

        <form action="" class="col col-md-9 p-md-4 mx-md-auto col-12">
          <h3 class="mb-5 text-center text-md-start text-uppercase">Edit Product</h3>
          <div class="row row-cols-md-12">
            <div class="col col-md-3 col-12">
              <input
                type="image"
                src="${product.getImagePath()}"
                alt="${product.getImagePath()}"
                class="img-fluid w-100 border-cus"
                
              />
            </div>
            <div class="col col-md-9">
              <div class="row col-md-12 mb-3">
                <div class="col col-3 mb-3 col-12">
                  <label for="productID" class="form-label"
                    ><h5>Product ID</h5></label
                  >
                  <input
                    type="text"
                    name="productID"
                    id="productID"
                    class="form-control"
                    value="${product.getProductID()}"
                  />
                </div>
              </div>
              <div class="row col-md-12 mb-3">
                <div class="col col-3 mb-3 col-12">
                  <label for="productName" class="form-label"
                    ><h5>Product Name</h5></label
                  >
                  <input
                    type="text"
                    name="productName"
                    id="productName"
                    class="form-control"
                    value="${product.getProductName()}"
                  />
                </div>
              </div>
              <div class="row col-md-12 mb-3">
                <div class="col col-md-3 mb-3 col-12">
                  <label for="productCategory" class="form-label"
                    ><h5>Category</h5></label
                  >
                  <select
                    class="form-select form-control"
                    name="productCategory"
                    id="productCategory"
                  >
                    <option value="1"${product.getCategory() == '1' ? 'selected' : ''}>Vegetable</option>
                    <option value="2"${product.getCategory() == '2' ? 'selected' : ''}>Fruit</option>
                    <option value="3"${product.getCategory() == '3' ? 'selected' : ''}>Meat</option>
                    <option value="4"${product.getCategory() == '4' ? 'selected' : ''}>Seafood</option>
                    <option value="5"${product.getCategory() == '5' ? 'selected' : ''}>Dairy</option>
                    <option value="6"${product.getCategory() == '6' ? 'selected' : ''}>Beverage</option>
                    <option value="7"${product.getCategory() == '7' ? 'selected' : ''}>Snack</option>
                    <option value="8"${product.getCategory() == '8' ? 'selected' : ''}>Bakery</option>
                    <option value="9"${product.getCategory() == '9' ? 'selected' : ''}>Frozen</option>
                    <option value="10"${product.getCategory() == '10' ? 'selected' : ''}>Canned</option>
                    <option value="11"${product.getCategory() == '11' ? 'selected' : ''}>Instant</option>
                    <option value="12"${product.getCategory() == '12' ? 'selected' : ''}>Others</option>
                  </select>
                </div>
              </div>
              <div class="row col-md-12 mb-3">
                <div class="col col-md-3 mb-3 col-12">
                  <label for="unitPrice" class="form-label"
                    ><h5>Unit Price (LKR)</h5></label
                  >
                  <input
                    type="text"
                    name="unitPrice"
                    id="unitPrice"
                    class="form-control"
                    value="${product.getUnitPrice()}"
                  />
                </div>
                <div class="col col-md-3 mb-3 col-12">
                  <label for="Visibility" class="form-label"
                    ><h5>Visibility</h5></label
                  >
                   <% System.out.println("Visibility: " + product.getVisibility()); %>
                  <select
                    class="form-select form-control"
                    name="Visibility"
                    id="Visibility"
                    
                  >
                    <option value="1"${product.getVisibility() == true ? 'selected' : ''}>Show</option>
                    <option value="2"${product.getVisibility() == false ? 'selected' : ''}>Hide</option>
                  </select>
                </div>
              </div>
              <div class="row col-md-12 mb-3">
                <div class="col col-md-12 mb-3 col-12">
                  <label for="description" class="form-label"
                    ><h5>Description</h5></label
                  >
                  <textarea
                    class="form-control"
                    name="description"
                    id="description"
                    rows="4"
                    
                    
                  >${product.getDescription()}</textarea>
                </div>
              </div>
             <div class="col col-md-3 mb-3 col-12">
                <label for="unitQuantity" class="form-label"
                  ><h5>Unit Quantity</h5></label
                >
                <div class="input-group mb-3">
                  <input 
                    type="number" 
                    name="unitQuantity"
                    id="unitQuantity" 
                    class="form-control" 
                    value="${product.getUnitQuantity()}"
                    />
                  <span class="input-group-text">g</span>

                </div>
            </div>
              <input
                type="submit"
                value="Save Changes"
                class="btn btn-success text-uppercase p-2 fw-semibold"
              />
            </div>
          </div>
        </form>
      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
