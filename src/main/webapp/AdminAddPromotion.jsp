<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Add Promotion</title>

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
              href="AdminProduct.jsp"
              ><i class="bi bi-pencil-fill me-2"></i> Product Edit</a
            >
            <a
              class="nav-link cus-btn"
              aria-current="page"
              href="AdminAccount.jsp"
              ><i class="bi bi-person-circle me-2"></i> Account Management</a
            >
            <a
              class="nav-link cus-btn active"
              aria-current="page"
              href="AdminPromotion.jsp"
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

        <form
          action=""
          class="col col-md-9 p-md-4 mx-md-auto col-12 border rounded-3 border-opacity-25"
        >
          <button
            class="btn px-0 mb-4 go-back fw-semibold border border-0 go-back-btn"
          >
            <a href="AdminAccount.html" class="go-back">
              <i class="bi bi-arrow-left"></i><span class="mx-2">Go Back</span>
            </a>
          </button>
          <h3 class="mb-5 text-center text-md-start text-uppercase">
            Add Promotion
          </h3>

          <div class="row">
            <div class="col-md-4 mb-3 col-12">
              <label for="promotionID" class="form-label"
                ><h5>Promotion ID</h5></label
              >
              <input
                type="text"
                name="promotionID"
                id="promotionID"
                class="form-control"
              />
            </div>
            <div class="col-md-4 mb-3 col-12">
              <label for="promotionName" class="form-label"
                ><h5>Promotion Name</h5></label
              >
              <input
                type="text"
                name="promotionName"
                id="promotionName"
                class="form-control"
              />
            </div>
          </div>
          <div class="row mb-4 row">
            <div class="col col-md-8 mb-3 col-12">
              <label for="appliedProducts" class="form-label"
                ><h5>Applied Products</h5></label
              >
              <div
                class="col col-auto border rounded-3 p-2 overflow-y-scroll"
                style="max-height: 80px"
              >
                <div class="form-check">
                  <input
                    type="checkbox"
                    class="form-check-input"
                    name="carrot"
                    id="carrot"
                  /><label class="form-check-label" for="carrot"
                    >Carrotfjhhjshjdshkjfsdjhkfsdkjhfsdhkjdfshkjfsdkj</label
                  >
                </div>
                <div class="form-check">
                  <input
                    type="checkbox"
                    class="form-check-input"
                    name="carrot"
                    id="carrot"
                  /><label class="form-check-label" for="carrot"
                    >Carrotfjhhjshjdshkjfsdjhkfsdkjhfsdhkjdfshkjfsdkj</label
                  >
                </div>
                <div class="form-check">
                  <input
                    type="checkbox"
                    class="form-check-input"
                    name="carrot"
                    id="carrot"
                  /><label class="form-check-label" for="carrot"
                    >Carrotfjhhjshjdshkjfsdjhkfsdkjhfsdhkjdfshkjfsdkj</label
                  >
                </div>
                <div class="form-check">
                  <input
                    type="checkbox"
                    class="form-check-input"
                    name="carrot"
                    id="carrot"
                  /><label class="form-check-label" for="carrot"
                    >Carrotfjhhjshjdshkjfsdjhkfsdkjhfsdhkjdfshkjfsdkj</label
                  >
                </div>
                <div class="form-check">
                  <input
                    type="checkbox"
                    class="form-check-input"
                    name="carrot"
                    id="carrot"
                  /><label class="form-check-label" for="carrot"
                    >Carrotfjhhjshjdshkjfsdjhkfsdkjhfsdhkjdfshkjfsdkj</label
                  >
                </div>
                <div class="form-check">
                  <input
                    type="checkbox"
                    class="form-check-input"
                    name="carrot"
                    id="carrot"
                  /><label class="form-check-label" for="carrot"
                    >Carrotfjhhjshjdshkjfsdjhkfsdkjhfsdhkjdfshkjfsdkj</label
                  >
                </div>
                <div class="form-check">
                  <input
                    type="checkbox"
                    class="form-check-input"
                    name="carrot"
                    id="carrot"
                  /><label class="form-check-label" for="carrot"
                    >Carrotfjhhjshjdshkjfsdjhkfsdkjhfsdhkjdfshkjfsdkj</label
                  >
                </div>
                <div class="form-check">
                  <input
                    type="checkbox"
                    class="form-check-input"
                    name="carrot"
                    id="carrot"
                  /><label class="form-check-label" for="carrot"
                    >Carrotfjhhjshjdshkjfsdjhkfsdkjhfsdhkjdfshkjfsdkj</label
                  >
                </div>
                <div class="form-check">
                  <input
                    type="checkbox"
                    class="form-check-input"
                    name="carrot"
                    id="carrot"
                  /><label class="form-check-label" for="carrot"
                    >Carrotfjhhjshjdshkjfsdjhkfsdkjhfsdhkjdfshkjfsdkj</label
                  >
                </div>
                <div class="form-check">
                  <input
                    type="checkbox"
                    class="form-check-input"
                    name="carrot"
                    id="carrot"
                  /><label class="form-check-label" for="carrot"
                    >Carrotfjhhjshjdshkjfsdjhkfsdkjhfsdhkjdfshkjfsdkj</label
                  >
                </div>
              </div>
            </div>
          </div>

          <div class="row mb-4 px-3">
            <hr class="col col-md-3 border-4 my-3" />
            <span class="col col-md-2 text-center py-1 fw-bold">OR</span>
            <hr class="col col-md-3 border-4 my-3" />
          </div>

          <div class="row mb-3">
            <div class="col col-md-4 mb-3 col-12">
              <label for="appliedCategories" class="form-label"
                ><h5>Applied Categories</h5></label
              >
              <select
                name="appliedCategories"
                id="appliedCategories"
                class="form-select"
              >
                <option value="1">Vegetables</option>
                <option value="2">Meat</option>
                <option value="3">Dairy</option>
                <option value="4">Fruits</option>
                <option value="5">Beverages</option>
              </select>
            </div>
          </div>

          <div class="row mb-3">
            <div class="col col-md-4 mb-3 col-12">
              <label for="promotionStatus" class="form-label"
                ><h5>Status</h5></label
              >
              <input
                type="text"
                name="promotionStatus"
                id="promotionStatus"
                class="form-control"
              />
            </div>
          </div>
          <div class="row col-8 text-center gx-1 mx-auto mx-md-0">
            <div class="col col-6 d-none d-md-block"></div>
            <div class="col col-md-3 mb-3 col-12 align-self-end">
              <input
                type="reset"
                value="Cancel"
                class="form-control text-uppercase btn btn-danger"
              />
            </div>
            <div class="col col-md-3 mb-3 col-12 align-self-end">
              <input
                type="submit"
                value="Save"
                class="form-control text-uppercase btn btn-success"
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
