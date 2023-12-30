<%

String email = (String) session.getAttribute("email");
String role = (String) session.getAttribute("role");
boolean isLoggedIn =  session.getAttribute("isLoggedIn")!= null && (boolean) session.getAttribute("isLoggedIn");

if ("A".equals(role) && isLoggedIn  && email != null) {
   
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Add Product</title>

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
      <%--<%@ include file="header.jsp"%>--%>
      
         <ul class="nav nav-tabs" style="margin-top: 1rem; ">
                <li class="nav-item" style="margin-left: 1rem;">
                    <a class="nav-link"  href="AdminProduct.jsp">Product Edit</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="AdminAccount.jsp">Account Management</a>
                </li>
                <li class="nav-item" >
                    <form action="AdminLogoutServlet" method="post">
                        <input type="hidden">
                        <button class="nav-link" type="submit"><i class="bi me-2">Log-out</i></button>
                    </form>
                </li>

          </ul>
            
      
      
      

        <form action="<%=request.getContextPath()%>/AddProductServlet" class="col col-md-9 p-md-4 mx-md-auto col-12" method="post" enctype="multipart/form-data">
             <a href="AdminProduct.jsp"<button class="btn px-0 mb-4 go-back fw-semibold border border-0 go-back-btn">
            
              <i class="bi bi-arrow-left"></i><span class="mx-2">Go Back</span>
           
              </button></a>
          <h3 class="mb-5 text-center text-md-start text-uppercase">Add Product</h3>
          
          <div class="row row-cols-md-12">
              
           
              <div class="row col-md-12 mb-3">
                <div class="col col-3 mb-3 col-12">
                    <div class="input-group mb-3">
                    <label class="input-group-text" for="productImage">Upload</label>
                    <input type="file" class="form-control" id="productImage" name="productImage">
                  </div>
                  <label for="productName" class="form-label"
                    ><h5>Product Name</h5></label
                  >
                  <input
                    type="text"
                    name="productName"
                    id="productName"
                    class="form-control"
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
                    <option value="Vegetable">Vegetable</option>
                    <option value="Fruit">Fruit</option>
                    <option value="Protien">Meat</option>
                    <option value="Snack">Snack</option>
                  </select>
                </div>
              </div>
              <div class="row col-md-12 mb-3">
                <div class="col col-md-3 mb-3 col-12">
                  <label for="unitPrice" class="form-label"
                    ><h5>Unit Price (USD)</h5></label
                  >
                  <input
                    type="number"
                    name="unitPrice"
                    id="unitPrice"
                    class="form-control"
                  />
                </div>
                                 
                
              </div>
                <div class="col col-md-2 mb-3 col-12">
                  <label for="Visibility" class="form-label"
                    ><h5>Visibility</h5></label
                  >
                  <select
                    class="form-select form-control"
                    name="Visibility"
                    id="Visibility"
                  >
                    <option value="1">Show</option>
                    <option value="2">Hide</option>
                  </select>
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
                  ></textarea>
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
                    />
                  <span class="input-group-text">g</span>

                </div>
            </div>
              <input
                type="submit"
                value="Add Product"
                class="btn btn-success text-uppercase p-2 fw-semibold"
              />
            </div>
          </div>
        </form>
      </div>
    </div>
         <%--<%@ include file="footer.jsp"%>--%>
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