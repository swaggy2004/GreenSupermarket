<!DOCTYPE html>
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
    <!--main container for all the body elements-->
    <div class="container-fluid my-4">
      <!--starting a row, removing the gutter value and adding a padding-->
      <div class="row mx-auto gap-5">
        <!--starting a column-->
        <div class="col p-0 border mb-4 mb-md-0 h-100">
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

        <!--this is the edit product panne-->
        <!-- made it wider than the nav section -->
        <form action="" class="col col-md-9 p-md-4 mx-md-auto col-12">
          <!-- made it inside a container and made all the text in here to be centered -->
          <div class="row mb-5 d-flex justify-content-start">
            <div class="col col-6 p-0">
              <h3 class="text-start text-uppercase">Product Edit</h3>
            </div>
            <div class="col col-0 p-0 d-flex justify-content-end">
              <button type="button" class="btn btn-success text-nowrap">
                Add Product
              </button>
            </div>
          </div>

            <!-- this is the row with the two select boxes and search box: Have to add the search box -->
            <div class="row">
              <div class="col col-md-3 col-12 mb-3">
                <select class="form-select" aria-label="Default select example">
                  <option selected>Select Category</option>
                  <option value="1">One</option>
                  <option value="2">Two</option>
                  <option value="3">Three</option>
                </select>
              </div>
              <div class="col col-md-3 col-12 mb-3">
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
              class="row text-md-center bg-body-secondary bg-opacity-50 rounded-3 mb-4"
            >
              <div class="col text-uppercase">Product ID</div>
              <div class="col text-uppercase">Image</div>
              <div class="col text-uppercase">Name</div>
              <div class="col text-uppercase">Unit Price</div>
            </div>
            <!-- made a row and made it responsive for extra small, small and large displays -->
            <div
              class="row align-items-center row-cols-1 row-cols-md-5 border border-3 rounded-4 gx-5 py-1 my-2 text-nowrap gap-2 gap-md-0 mx-md-1"
            >
              <!-- these are the items that will be include in the grid once received from the database -->
              <div class="col d-flex justify-content-center col-12">
                B347-DB23
              </div>
              <div class="col col-12">
                <img
                  src="baby-carrots.png"
                  alt=""
                  srcset=""
                  class="pro-img img-fluid img-thumbnail rounded-5 border border-3"
                />
              </div>
              <div class="col col-12">Carrots (100g)</div>
              <div class="col col-12">LKR 40.20</div>
              <div class="col">
                <button type="button" class="btn edit-btn">
                  <i class="bi bi-pencil-square"></i>
                </button>
                <button type="button" class="btn delete-btn">
                  <i class="bi bi-trash"></i>
                </button>
              </div>
            </div>
            <div
              class="row align-items-center row-cols-1 row-cols-md-5 border border-3 rounded-4 gx-5 py-1 my-2 text-nowrap gap-2 gap-md-0 mx-md-1"
            >
              <!-- these are the items that will be include in the grid once received from the database -->
              <div class="col d-flex justify-content-center col-12">
                B347-DB23
              </div>
              <div class="col col-12">
                <img
                  src="baby-carrots.png"
                  alt=""
                  srcset=""
                  class="pro-img img-fluid img-thumbnail rounded-5 border border-3"
                />
              </div>
              <div class="col col-12">Carrots (100g)</div>
              <div class="col col-12">LKR 40.20</div>
              <div class="col">
                <button type="button" class="btn edit-btn">
                  <i class="bi bi-pencil-square"></i>
                </button>
                <button type="button" class="btn delete-btn">
                  <i class="bi bi-trash"></i>
                </button>
              </div>
            </div>

            <div
              class="row align-items-center row-cols-1 row-cols-md-5 border border-3 rounded-4 gx-5 py-1 my-2 text-nowrap gap-2 gap-md-0 mx-md-1"
            >
              <!-- these are the items that will be include in the grid once received from the database -->
              <div class="col d-flex justify-content-center col-12">
                B347-DB23
              </div>
              <div class="col col-12">
                <img
                  src="baby-carrots.png"
                  alt=""
                  srcset=""
                  class="pro-img img-fluid img-thumbnail rounded-5 border border-3"
                />
              </div>
              <div class="col col-12">Carrots (100g)</div>
              <div class="col col-12">LKR 40.20</div>
              <div class="col">
                <button type="button" class="btn edit-btn">
                  <i class="bi bi-pencil-square"></i>
                </button>
                <button type="button" class="btn delete-btn">
                  <i class="bi bi-trash"></i>
                </button>
              </div>
            </div>

            <div
              class="row align-items-center row-cols-1 row-cols-md-5 border border-3 rounded-4 gx-5 py-1 my-2 text-nowrap gap-2 gap-md-0 mx-md-1"
            >
              <!-- these are the items that will be include in the grid once received from the database -->
              <div class="col d-flex justify-content-center col-12">
                B347-DB23
              </div>
              <div class="col col-12">
                <img
                  src="baby-carrots.png"
                  alt=""
                  srcset=""
                  class="pro-img img-fluid img-thumbnail rounded-5 border border-3"
                />
              </div>
              <div class="col col-12">Carrots (100g)</div>
              <div class="col col-12">LKR 40.20</div>
              <div class="col">
                <button type="button" class="btn edit-btn">
                  <i class="bi bi-pencil-square"></i>
                </button>
                <button type="button" class="btn delete-btn">
                  <i class="bi bi-trash"></i>
                </button>
              </div>
            </div>

            <!-- added the pagination feature: Have to edit this -->
            
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
