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
    <!--main container for all the body elements-->
    <div class="container-fluid">
      <!--starting a row, removing the gutter value and adding a padding-->
      <div class="row gx-0 p-3 mx-auto">
        <!--starting a column-->
        <div class="col border mb-4 mb-md-0">
          <!--just adding a heading-->
          <h4 class="m-3">Navigation</h4>
          <!--starting a vertical navbar for the buttons-->
          <nav class="nav flex-column">
        <!--adding the buttons and making them active-->
        <a
                class="nav-link cus-btn"
                aria-current="page"
                href="AdminProduct.jsp"
        ><i class="bi bi-pencil-fill me-2"></i> Product Edit</a
        >
        <a
                class="nav-link cus-btn "
                aria-current="page"
                href="AdminAccount.jsp"
        ><i class="bi bi-person-circle me-2"></i> Account Management</a
        >
        <form action="AdminLogoutServlet" method="post">
            <input type="hidden">
            <button type="submit"><i class="bi bi-box-arrow-right me-2">Log-out</i></button>
        </form>
      </nav>
        </div>

        <form action="<%=request.getContextPath()%>/AddProductServlet" class="col col-md-9 p-md-4 mx-md-auto col-12" method="post" enctype="multipart/form-data">
             <a href="AdminProduct.jsp"<button class="btn px-0 mb-4 go-back fw-semibold border border-0 go-back-btn">
            
              <i class="bi bi-arrow-left"></i><span class="mx-2">Go Back</span>
           
              </button></a>
          <h3 class="mb-5 text-center text-md-start text-uppercase">Add Product</h3>
          <div class="row row-cols-md-12">
            <div class="col col-md-3 col-12">
              <input
                type="file"
                src="baby-carrots.png"
                alt="picture of a carrot"
                class="img-fluid w-100 border-cus"
                name="productImage"
              />
            </div>
            <div class="col col-md-9">
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
                    <option value="1">Vegetable</option>
                    <option value="2">Fruit</option>
                    <option value="3">Meat</option>
                    <option value="4">Snack</option>
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