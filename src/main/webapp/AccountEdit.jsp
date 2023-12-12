<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Account Edit</title>

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
    <link rel="stylesheet" href="AdminEditProduct.css">
  </head>
  <body>
    <!--main container for all the body elements-->
    <div class="container-fluid my-4">
      <!--starting a row, removing the gutter value and adding a padding-->
      <div class="row mx-auto gap-5">
        <!--starting a column-->
        <div class="col p-0 border mb-4 mb-md-0">
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
              class="nav-link cus-btn active"
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

        <form
          action=""
          class="col col-md-9 p-md-4 mx-md-auto col-12 border rounded-3 border-opacity-25"
        >
          <button class="btn px-0 mb-4 go-back fw-semibold border border-0 go-back-btn">
            <a href="AdminAccount.html" class="go-back">
              <i class="bi bi-arrow-left"></i><span class="mx-2">Go Back</span>
            </a>
          </button>
          <h3 class="mb-5 text-center text-md-start text-uppercase">
            Account Edit
          </h3>

          <div class="row mb-3">
            <div class="col-md-4 mb-3 col-12">
              <label for="fullName" class="form-label"
                ><h5>Full Name</h5></label
              >
              <input
                type="text"
                name="fullName"
                id="fullName"
                class="form-control"
              />
            </div>
            <div class="col-md-4 mb-3 col-12">
              <label for="email" class="form-label"><h5>Email</h5></label>
              <input type="text" name="email" id="email" class="form-control" />
            </div>
          </div>

          <div class="row mb-3">
            <div class="col-md-4 mb-3 col-12">
              <label for="phoneNumber" class="form-label"
                ><h5>Phone Number</h5></label
              >
              <input
                type="text"
                name="phoneNumber"
                id="phoneNumber"
                class="form-control"
              />
            </div>
            <div class="col-md-4 mb-3 col-12">
              <label for="role" class="form-label"><h5>Role</h5></label>
              <select name="role" id="role" class="form-select form-control">
                <option value="1" id="1">Manager</option>
                <option value="2" id="2">Employee</option>
                <option value="3" id="3">Director</option>
              </select>
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
                value="Save Changes"
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
