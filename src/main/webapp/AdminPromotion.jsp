<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Promotion</title>

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
              class="nav-link cus-btn"
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
              class="nav-link cus-btn active"
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
          <div class="row mb-5 d-flex justify-content-start">
            <div class="col col-6 p-0">
              <h3 class="text-start text-uppercase">Promotion</h3>
            </div>
            <div class="col col-0 p-0 d-flex justify-content-end">
              <button type="button" class="btn btn-success text-nowrap">
                Add Promotion
              </button>
            </div>
          </div>

          <div
            class="row text-md-center bg-body-secondary bg-opacity-50 rounded-3 mb-4"
          >
            <div class="col">
              <label for="promotionID" class="form-label my-1"
                >Promotion ID</label
              >
            </div>
            <div class="col">
              <label for="promotionStatus" class="form-label my-1"
                >Status</label
              >
            </div>
            <div class="col">
              <label for="promotionName" class="form-label my-1"
                >Promotion Name</label
              >
            </div>
            <div class="col">
              <label for="promotionDuration" class="form-label my-1"
                >Duration</label
              >
            </div>
            <div class="col">
              <label for="promotionDetails" class="form-label my-1"
                >Details</label
              >
            </div>
          </div>

          <div class="row text-center mb-3">
            <div class="col" id="promotionID">#3284388</div>
            <div class="col" id="promotionStatus">Happening Now</div>
            <div class="col" id="Black Friday">Black Friday</div>
            <div class="col" id="promotionDuration">5 DEC - 15 DEC</div>
            <div class="col" id="promotionDetails">
              <a href="#" class="text-decoration-none"
                ><span class="me-2">Visit Details</span
                ><i class="bi bi-arrow-bar-right"></i
              ></a>
            </div>
          </div>

          <div class="row text-center mb-3">
            <div class="col" id="promotionID">#3284388</div>
            <div class="col" id="promotionStatus">Happening Now</div>
            <div class="col" id="Black Friday">Black Friday</div>
            <div class="col" id="promotionDuration">5 DEC - 15 DEC</div>
            <div class="col" id="promotionDetails">
              <a href="#" class="text-decoration-none"
                ><span class="me-2">Visit Details</span
                ><i class="bi bi-arrow-bar-right"></i
              ></a>
            </div>
          </div>

          <div class="row text-center mb-3">
            <div class="col" id="promotionID">#3284388</div>
            <div class="col" id="promotionStatus">Happening Now</div>
            <div class="col" id="Black Friday">Black Friday</div>
            <div class="col" id="promotionDuration">5 DEC - 15 DEC</div>
            <div class="col" id="promotionDetails">
              <a href="#" class="text-decoration-none"
                ><span class="me-2">Visit Details</span
                ><i class="bi bi-arrow-bar-right"></i
              ></a>
            </div>
          </div>

          <div class="row text-center mb-3">
            <div class="col" id="promotionID">#3284388</div>
            <div class="col" id="promotionStatus">Happening Now</div>
            <div class="col" id="Black Friday">Black Friday</div>
            <div class="col" id="promotionDuration">5 DEC - 15 DEC</div>
            <div class="col" id="promotionDetails">
              <a href="#" class="text-decoration-none"
                ><span class="me-2">Visit Details</span
                ><i class="bi bi-arrow-bar-right"></i
              ></a>
            </div>
          </div>

          <div class="row text-center mb-3">
            <div class="col" id="promotionID">#3284388</div>
            <div class="col" id="promotionStatus">Happening Now</div>
            <div class="col" id="Black Friday">Black Friday</div>
            <div class="col" id="promotionDuration">5 DEC - 15 DEC</div>
            <div class="col" id="promotionDetails">
              <a href="#" class="text-decoration-none"
                ><span class="me-2">Visit Details</span
                ><i class="bi bi-arrow-bar-right"></i
              ></a>
            </div>
          </div>

          <div class="row text-center mb-3">
            <div class="col" id="promotionID">#3284388</div>
            <div class="col" id="promotionStatus">Happening Now</div>
            <div class="col" id="Black Friday">Black Friday</div>
            <div class="col" id="promotionDuration">5 DEC - 15 DEC</div>
            <div class="col" id="promotionDetails">
              <a href="#" class="text-decoration-none"
                ><span class="me-2">Visit Details</span
                ><i class="bi bi-arrow-bar-right"></i
              ></a>
            </div>
          </div>

          <div class="row text-center mb-3">
            <div class="col" id="promotionID">#3284388</div>
            <div class="col" id="promotionStatus">Happening Now</div>
            <div class="col" id="Black Friday">Black Friday</div>
            <div class="col" id="promotionDuration">5 DEC - 15 DEC</div>
            <div class="col" id="promotionDetails">
              <a href="#" class="text-decoration-none"
                ><span class="me-2">Visit Details</span
                ><i class="bi bi-arrow-bar-right"></i
              ></a>
            </div>
          </div>

          <div class="row text-center mb-3">
            <div class="col" id="promotionID">#3284388</div>
            <div class="col" id="promotionStatus">Happening Now</div>
            <div class="col" id="Black Friday">Black Friday</div>
            <div class="col" id="promotionDuration">5 DEC - 15 DEC</div>
            <div class="col" id="promotionDetails">
              <a href="#" class="text-decoration-none"
                ><span class="me-2">Visit Details</span
                ><i class="bi bi-arrow-bar-right"></i
              ></a>
            </div>
          </div>

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
