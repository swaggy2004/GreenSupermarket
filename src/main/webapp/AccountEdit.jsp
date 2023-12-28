<%@page import="com.shaveen.greensupermarket.ManageConnection"%>
<%@page import="Model.EditAccountAdmin"%>
<%@ page isELIgnored="false" %>
<%
   String admaccemail = request.getParameter("admaccemail");
   EditAccountAdmin account = ManageConnection.getAdmaccountByemail(admaccemail);
   pageContext.setAttribute("account", account);
%>
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
     <ul class="nav nav-tabs" style="margin-top: 1rem; margin-bottom: 2rem; ">
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
        

        <form style="margin-bottom: 2rem"
          action="<%=request.getContextPath()%>/EditAccountServlet"
          class="col col-md-9 p-md-4 mx-md-auto col-12 border rounded-3 border-opacity-25"
          method="post"
        >
          <button class="btn px-0 mb-4 go-back fw-semibold border border-0 go-back-btn">
            <a href="AdminAccount.jsp" class="go-back">
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
                value="${account.getFullName()}"
                
              />
            </div>
            <div class="col-md-4 mb-3 col-12">
                <label for="email" class="form-label"><h5>Email</h5></label>
                <input disabled type="text" name="email" id="email" class="form-control" value="${account.getEmail()}"/>
                <input  type="hidden" name="email" id="email" class="form-control" value="${account.getEmail()}"/>

            </div>
          </div>

          <div class="row mb-3">
            <div class="col-md-4 mb-3 col-12">
              <label for="password" class="form-label"
                ><h5>Password</h5></label
              >
              <input
                type="text"
                name="password"
                id="password"
                class="form-control"
                value="${account.getPwd()}"
              />
            </div>
            <div class="col-md-4 mb-3 col-12">
              <label for="role" class="form-label"><h5>Role</h5></label>
        <select name="role" id="role" class="form-select form-control">
                <option value="M" id="M" ${account.getType() == 'M' ? 'selected' : ''}>Manager</option>
                <option value="A" id="A" ${account.getType() == 'A' ? 'selected' : ''}>Admin</option>
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
        <%--<%@ include file="footer.jsp"%>--%>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
      crossorigin="anonymous"
    ></script>
    <%@ include file="footer.jsp"%>
  </body>
</html>
<%
} else {
    // Redirect back to the login page
    response.sendRedirect("adminlogin.jsp");
}
%>
