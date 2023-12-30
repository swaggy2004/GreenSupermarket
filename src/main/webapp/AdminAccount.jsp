<%@page import="com.shaveen.greensupermarket.ManageConnection"%>
<%@page import="Model.ManagerAccount"%>
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
    List<ManagerAccount> ManagerAccounts = ManageConnection.getManagerAccounts();
    pageContext.setAttribute("ManagerAccounts", ManagerAccounts);
%>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Admin Account</title>

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

     <ul class="nav nav-tabs" style="margin-top: 1rem; ">
    <li class="nav-item" style="margin-left: 1rem;">
        <a class="nav-link"  href="AdminProduct.jsp">Product Edit</a>
    </li>
    <li class="nav-item">
        <a class="nav-link  active " aria-current="page" href="AdminAccount.jsp">Account Management</a>
    </li>
    <li class="nav-item" >
        <form action="AdminLogoutServlet" method="post">
            <input type="hidden">
            <button class="nav-link" type="submit"><i class="bi me-2">Log-out</i></button>
        </form>
        
       
    </li>

    </ul>

    <!--this is the edit product panne-->
    <!-- made it wider than the nav section -->
    
      <!-- made it inside a container and made all the text in here to be centered -->
      <div class="container text-center pt-4 pt-md-0">
        <!-- this is the title pane with the currently selected option and add a product button -->
        <div class="row pb-5 mx-md-auto row-cols-2">
          <div class="col cols-1 text-start cols-md-6 gx-0">
            <h3 style="margin-top:2rem">Account Management</h3>
          </div>
          <div
                  class="col d-md-flex justify-content-md-end"
          >
              <a href="AdminAddAccount.jsp"><button type="button" class="btn btn-success p-3 w-auto align-self-end align-self-md-auto">
              Add Profile
                  </button></a>
          </div>
        </div>
        <!-- added the column titles and made them all capital -->
        <div
                class="row text-start align-items-center gx-0 py-1 px-5 bg-ribbon border d-none d-lg-flex"
        >
          <div class="col col-5">Name</div>
          <div class="col col-3">Role</div>
          <div class="col">Actions</div>
        </div>
        <!-- made a row and made it responsive for extra small, small and large displays -->
    <c:forEach items="${ManagerAccounts}" var="MngAccount">
        <div class="row text-start gx-auto gx-md-0 my-auto py-2 px-md-5 border-bottom border-1 text-center text-md-start gap-2 gap-md-0">
          <!-- these are the items that will be include in the grid once received from the database -->
          <div class="col col-md-5 col-sm-12 col-12">
            
            <div class="fs-4">${MngAccount.getFullName()}</div>
            <!-- made the overflow of the email scrollable because it will be too long -->
            <div class="fs-6 float-center overflow-x-scroll overflow-x-md-none">
              ${MngAccount.getEmail()}
            </div>
            
          </div>
            
          <div class="col col-md-3 col-sm-12 col-12 align-self-md-center">
            <c:choose>
                <c:when test="${MngAccount.getType() eq 'M'}">Manager</c:when>
                <c:when test="${MngAccount.getType() eq 'A'}">Admin</c:when>
                <c:otherwise>Unknown</c:otherwise>
            </c:choose>
          </div>
            
          <div class="col col-md-1 col-12 align-self-md-center ">
              
           <a href="AccountEdit.jsp?admaccemail=${MngAccount.getEmail()}"> 
               <button type="button" class="btn edit-btn">
              <i class="bi bi-pencil-square"></i>
               </button></a>
               
                <form action="DeleteAdminAccountServlet" method="post" >
                <input type="hidden" name="email" value="${MngAccount.getEmail()}">
                <button type="submit" class="btn delete-btn">
                <i class="bi bi-trash"></i>
                
              </button>
                </form>
                
                
           </div>
        </div>
    </c:forEach>
        
        
        
        </div>
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
