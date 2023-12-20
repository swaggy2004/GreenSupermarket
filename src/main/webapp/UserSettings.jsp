<%--
  Created by IntelliJ IDEA.
  User: Jude Darren Victoria
  Date: 06/12/2023
  Time: 07:32 pm
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="com.shaveen.greensupermarket.UserData" %>
<%@ page import="com.shaveen.greensupermarket.UserDatabaseInteraction" %>
<%@ page isELIgnored="false" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="jakarta.servlet.*,jakarta.servlet.http.*" %>
<%@ page import="java.sql.*" %>


<html>
<head>
    <title>User Settings Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"/>
    <link href="UserSettings.css" rel="stylesheet" />

    <style>
        /* Custom styles for the burger stack icon in mobile */
        @media (max-width: 767px) {
            .icons-container {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
        }

        /* Custom styles for desktop view */
        @media (min-width: 768px) {
            .icons-container {
                display: flex;
                justify-content: flex-start;
                align-items: center;
                margin-left: auto;
            }

            .icons-container img {
                margin-right: 5px; /* Add some space between the icons */
            }

            .icons-container img:hover {
                opacity: 0.8; /* Add a hover effect */
            }
            .nav-link{
                color:#347809 ;
            }
        }


    </style>
</head>
<body>

<%


    String email = (String) session.getAttribute("email");
    boolean isLoggedIn = session.getAttribute("isLoggedIn") != null && (boolean) session.getAttribute("isLoggedIn");

    if (email == null || !isLoggedIn) {
        // Redirect to login page
        response.sendRedirect("login.jsp");
    } else {
        System.out.println("User Email: " + email);
        System.out.println("Login Status: " + isLoggedIn);
    }


    // Retrieve user data
    UserData userData = UserDatabaseInteraction.getUserData(email);

    // Set user data as an attribute in the request
    request.setAttribute("userData", userData);


%>



<nav style="background-color: #d0f288" class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#"><img style="width: 110px" alt="Navbar Logo" src="assets/NavLogo.svg"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Meats</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link active" aria-current="page" href="#">Fruits</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Vegetables</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Snacks</a>
                </li>
            </ul>
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
            <div class="icons-container"> <!-- Container for icons in mobile view -->
                <!-- Desktop icons -->
                <a class="nav-link active" aria-current="page" href="#"><img src="assets/shopping_bag.svg" alt="Cart"></a>
                <a class="nav-link active" aria-current="page" href="#"><img src="assets/favorite.svg" alt="Favorite"></a>
                <a class="nav-link active" aria-current="page" href="#"><img src="assets/person_2.svg" alt="Profile"></a>
            </div>
        </div>
    </div>
</nav>

<h1 style="margin-top: 2rem;margin-left: 1rem;">Account Settings</h1>
<div class="row" style="margin-top: 2rem;margin-left: 1rem; margin-right: 1rem">
    <div class="col-12 col-sm-2 avatar-container" >
        <div class="d-flex align-items-center">
            <img style="width: 130px; margin-top:2rem; " src="assets/Avatar.png" class="rounded-circle ms-2" alt="User Avatar">
        </div>

    </div>

  <form action="<%=request.getContextPath()%>/UserSettingsServlet" method="post">
     
            <div class="col-10">
                <div class="row">
                    <div class="col-6">
                        <div class="col" style="margin-top: 2rem">
                            <div class="vstack gap-3">
                                <div >
                                    <label for="fullName" class="form-label">Name</label>
                                    <input type="text" class="form-control" name="fullName" id="fullName" placeholder="John Doe"  value="${userData.getFullName()}">
                                </div>
                                <div>
                                    <label for="UserPhone" class="form-label">Phone Number</label>
                                        <input type="text" class="form-control" name="UserPhone" id="UserPhone" placeholder="071-xxxxxxx" value="${userData.getPhoneNumber()}">
                                </div>


                            </div>
                        </div>
                    </div>
                    <div class="col-6" style="margin-top: 2rem">
                        <div class="vstack gap-3">
                            <div >
                                <label for="UserEmail" class="form-label">Email address</label>
                                <input type="email" class="form-control" id="UserEmail" name="UserEmail" placeholder="name@example.com" value="${userData.getEmail()}" disabled>
                                <input type="hidden" name="email" value="${userData.email}">
                            </div>
                            <div class="col">
                                <label class="input-group-text" for="inputGroupFile01">Edit Profile Avatar</label>
                                <input type="file" class="form-control" id="inputGroupFile01" value="${userData.getAvatarPath()}">
                            </div>

                        </div>

                    </div>
                </div>
                <div style="display: flex;   margin-top: 1rem; margin-right: 40px;">
                   
                </div>
            </div>
     
   

</div>




<div class="container container-fluid text-center" style="margin-top: 2rem">
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    Billing Address
                </div>
                <div class="card-body">
                  
                        <table>
                            
                            <tr>
                                <td colspan="2">
                                    <label for="Bill-Address" class="form-label">Address</label>
                                    <input type="text" class="form-control" id="Bill-Address" placeholder="Road No. 13/x, House no. 1320/C, Flat No. 5D" value="${userData.getBA_Adress()}">
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <label for="Bill-City" class="form-label">City</label>
                                    <input type="text" class="form-control" id="Bill-City" placeholder="Negombo" value="${userData.getBA_City()}">
                                </td>
                                <td>
                                    <label for="Bill-PC" class="form-label">Postal Code</label>
                                    <input type="text" class="form-control" id="Bill-PC" placeholder="11500" value="${userData.getBA_ZipCode()}">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div>
                                        <label for="Bill-country">Country</label>
                                        <select class="form-control" id="Bill-country">
                                            <option value="AF" ${userData.getBA_Region() == 'AF' ? 'selected' : ''}>Afghanistan</option>
                                            <option value="BD" ${userData.getBA_Region() == 'BD' ? 'selected' : ''}>Bangladesh</option>
                                            <option value="BT" ${userData.getBA_Region() == 'BT' ? 'selected' : ''}>Bhutan</option>
                                            <option value="IN" ${userData.getBA_Region() == 'IN' ? 'selected' : ''}>India</option>
                                            <option value="MV" ${userData.getBA_Region() == 'MV' ? 'selected' : ''}>Maldives</option>
                                            <option value="NP" ${userData.getBA_Region() == 'NP' ? 'selected' : ''}>Nepal</option>
                                            <option value="PK" ${userData.getBA_Region() == 'PK' ? 'selected' : ''}>Pakistan</option>
                                            <option value="LK" ${userData.getBA_Region() == 'LK' ? 'selected' : ''}>Sri Lanka</option>
                                        </select>
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td colspan="2">
                                <label for="Bill-Phone" class="form-label">Phone Number</label>
                                <input type="text" class="form-control" id="Bill-Phone" placeholder="071-xxxxxxx" value="${userData.getBA_PhoneNumber()}">
                                </td>
                            </tr>
                        </table>

                    <div style="display: flex; margin-top:1rem ">
                        
                    </div>
                    
                </div>

            </div>

        </div>
        <div class="col">
            <div class="card">
                <div class="card-header">
                    Shipping Address
                </div>
                <div class="card-body">
                    
                        <table>
                            
                            <tr>
                                <td colspan="2">
                                    <label for="Shipping-Address" class="form-label">Address</label>
                                    <input type="text" class="form-control" id="Shipping-Address" placeholder="Road No. 13/x, House no. 1320/C, Flat No. 5D" value="${userData.getSA_Adress()}">
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <label for="Shipping-City" class="form-label">City</label>
                                    <input type="text" class="form-control" id="Shipping-City" placeholder="Negombo" value="${userData.getSA_City()}">
                                </td>
                                <td>
                                    <label for="Shipping-PC" class="form-label">Postal Code</label>
                                    <input type="text" class="form-control" id="Shipping-PC" placeholder="11500" value="${userData.getSA_ZipCode()}">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div>
                                        <label for="Shipping-country">Country</label>
                                        <select class="form-control" id="Shipping-country">
                                            <option value="AF" ${userData.getSA_Region() == 'AF' ? 'selected' : ''}>Afghanistan</option>
                                            <option value="BD" ${userData.getSA_Region() == 'BD' ? 'selected' : ''}>Bangladesh</option>
                                            <option value="BT" ${userData.getSA_Region() == 'BT' ? 'selected' : ''}>Bhutan</option>
                                            <option value="IN" ${userData.getSA_Region() == 'IN' ? 'selected' : ''}>India</option>
                                            <option value="MV" ${userData.getSA_Region() == 'MV' ? 'selected' : ''}>Maldives</option>
                                            <option value="NP" ${userData.getSA_Region() == 'NP' ? 'selected' : ''}>Nepal</option>
                                            <option value="PK" ${userData.getSA_Region() == 'PK' ? 'selected' : ''}>Pakistan</option>
                                            <option value="LK" ${userData.getSA_Region() == 'LK' ? 'selected' : ''}>Sri Lanka</option>
                                        </select>
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td colspan="2">
                                    <label for="Shipping-UserPhone" class="form-label">Phone Number</label>
                                    <input type="text" class="form-control" id="Shipping-UserPhone" placeholder="071-xxxxxxx" value="${userData.getSA_PhoneNumber()}">
                                </td>
                            </tr>
                        </table>

                        <div style="display: flex; margin-top:1rem ">
                            
                        </div>
                    
                </div>
                
            </div>
        </div>
                    <input type="submit" id="submit" class="btn btn-update" value="Update" style="margin-top: 2rem">
                    <button class="btn btn-update" style="margin-top: 2rem; background-color: red;" onclick="deleteacc()">Delete Account</button>


    </div>
     
</div>

</form>
                                
                                


<div class="container container-fluid text-center" style="margin-top: 2rem">
<div class="card">
    <div class="card-header">
        Password Update
    </div>
    <div class="card-body">
        <form action="<%=request.getContextPath()%>/PasswordUpdateServlet" method="post">
            <table>
                <tr>
                    <td>
                        <label for="CurrentPassword" class="form-label">Current Password</label>
                        <input type="text" class="form-control" id="CurrentPassword" name="CurrentPassword" placeholder="Kevin">
                    </td>

                </tr>
                <tr>
                    <td >
                        <label for="NewPassword" class="form-label">New Password</label>
                        <input type="text" class="form-control"  id="NewPassword" name="NewPassword" placeholder="8+ Charachters">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="ConfirmPassword" class="form-label">Confirm Password</label>
                        <input type="text" class="form-control" id="ConfirmPassword" name="ConfirmPassword" placeholder="Retype New Password">
                    </td>
                </tr>

            </table>

            <div style="display: flex; margin-top:1rem ">
                <input type="submit" id="password-submit" class="btn btn-update" value="Update" style="margin-top: 2rem">
            </div>
        </form>
    </div>

</div>
</div>

<script>
  function deleteacc() {
        window.location.href = "<%=request.getContextPath()%>/DeleteAccountServlet";
  }
</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select-country/dist/js/bootstrap-select-country.min.js"></script>



</body>
</html>
