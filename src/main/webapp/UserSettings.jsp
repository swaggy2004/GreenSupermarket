<%--
  Created by IntelliJ IDEA.
  User: Jude Darren Victoria
  Date: 06/12/2023
  Time: 07:32 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    <link href="UserSettings.css" rel="stylesheet">
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


<div class="row" style="margin-top: 2rem;margin-left: 1rem">
    <div class="col-2" style="" ><img style="width: 8rem " src="assets/Avatar.png" class="rounded-circle ms-2" alt="User Avatar"></div>

<h1 style="margin-top: 2rem;margin-left: 1rem;">Account Settings</h1>
<form name="usersettings" method="" action="">
<div class="row" style="margin-top: 2rem;margin-left: 1rem; margin-right: 1rem">
    <div class="col-12 col-sm-2 avatar-container" >
        <div class="d-flex align-items-center">
            <img style="width: 130px; margin-top:2rem; " src="assets/Avatar.png" class="rounded-circle ms-2" alt="User Avatar">
        </div>

    </div>

    <div class="col-10">
        <div class="row">
            <div class="col-6">
                <div class="col" style="margin-top: 2rem">
                    <div class="vstack gap-3">
                        <div >

                            <label for="UserEmail" class="form-label">Email address</label>
                            <input type="email" class="form-control" id="UserEmail" placeholder="name@example.com">
                        </div>
                        <div>
                            <label for="UserPhone" class="form-label">Phone Number</label>
                            <input type="text" class="form-control" id="UserPhone" placeholder="071-xxxxxxx">
                        </div>
                        <div class="bg-light border">
                            <select class=" selectpicker countrypicker"></select>

                            <label for="Name" class="form-label">Name</label>
                            <input type="email" class="form-control" id="Name" placeholder="John Doe">
                        </div>
                        <div>
                            <label for="country">Country</label>
                            <select class="form-control  countrypicker" id="country" selected="Sri Lanka"></select>
                        </div>
                        <div >
                            <div class="form-group">

                                <label for="UserPhone" class="form-label">Phone Number</label>
                                <input type="text" class="form-control" id="UserPhone" placeholder="071-xxxxxxx">
                            </div>

                        </div>
                        <div>
                            <div class="input-group mb-3">
                                <label class="input-group-text" for="inputGroupFile01">Edit Profile Avatar</label>
                                <input type="file" class="form-control" id="inputGroupFile01">
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <div class="col-6">col-4</div>
            <div class="col-6" style="margin-top: 2rem">
                <div class="vstack gap-3">
                    <div >
                        <label for="UserEmail" class="form-label">Email address</label>
                        <input type="email" class="form-control" id="UserEmail" placeholder="name@example.com">
                    </div>
                    <div class="col">
                        <label for="City" class="form-label">City</label>
                        <input type="text" class="form-control" id="City" placeholder="New York">
                    </div>
                    <div class="col">
                        <label for="PostalCode" class="form-label">Postal Code</label>
                        <input type="text" class="form-control" id="PostalCode" placeholder="XXXXX">
                    </div>
                </div>

            </div>
        </div>
        <div style="display: flex;   margin-top: 1rem; margin-right: 40px;">
            <button type="submit" class="btn btn-update">Update</button>
        </div>
    </div>


</div>


</form>

<div class="container text-center" style="margin-top: 2rem">
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    Billing Adress
                </div>
                <div class="card-body">
                    <form>
                        <table>
                            <tr>
                                <td>
                                    <label for="Bill-FirstName" class="form-label">First Name</label>
                                    <input type="text" class="form-control" id="Bill-FirstName" placeholder="Kevin">
                                </td>
                                <td>
                                    <label for="Bill-LastName" class="form-label">Last Name</label>
                                    <input type="text" class="form-control" id="Bill-LastName" placeholder="Gilbert">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <label for="Bill-Address" class="form-label">Address</label>
                                    <input type="text" class="form-control" id="Bill-Address" placeholder="Road No. 13/x, House no. 1320/C, Flat No. 5D">
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <label for="Bill-City" class="form-label">City</label>
                                    <input type="text" class="form-control" id="Bill-City" placeholder="Negombo">
                                </td>
                                <td>
                                    <label for="Bill-PC" class="form-label">Postal Code</label>
                                    <input type="text" class="form-control" id="Bill-PC" placeholder="11500">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div>
                                        <label for="country">Country</label>
                                        <select class="form-control  countrypicker" id="country" selected="Sri Lanka"></select>
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td colspan="2">
                                <label for="Shipping-Phone" class="form-label">Phone Number</label>
                                <input type="text" class="form-control" id="Shipping-Phone" placeholder="071-xxxxxxx">
                                </td>
                            </tr>
                        </table>

                    <div style="display: flex; margin-top:1rem ">
                        <button type="submit" class="btn btn-update">Update</button>
                    </div>
                    </form>
                </div>

            </div>

        </div>
        <div class="col">
            <div class="card">
                <div class="card-header">
                    Shipping Address
                </div>
                <div class="card-body">
                    <form>
                        <table>
                            <tr>
                                <td>
                                    <label for="Shipping-FirstName" class="form-label">First Name</label>
                                    <input type="text" class="form-control" id="Shipping-FirstName" placeholder="Kevin">
                                </td>
                                <td>
                                    <label for="Shipping-LastName" class="form-label">Last Name</label>
                                    <input type="text" class="form-control" id="Shipping-LastName" placeholder="Gilbert">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <label for="Shipping-Address" class="form-label">Address</label>
                                    <input type="text" class="form-control" id="Shipping-Address" placeholder="Road No. 13/x, House no. 1320/C, Flat No. 5D">
                                </td>

                            </tr>
                            <tr>
                                <td>
                                    <label for="Shipping-City" class="form-label">City</label>
                                    <input type="text" class="form-control" id="Shipping-City" placeholder="Negombo">
                                </td>
                                <td>
                                    <label for="Shipping-PC" class="form-label">Postal Code</label>
                                    <input type="text" class="form-control" id="Shipping-PC" placeholder="11500">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div>
                                        <label for="Shipping-country">Country</label>
                                        <select class="form-control  countrypicker" id="Shipping-country" selected="Sri Lanka"></select>
                                    </div>
                                </td>

                            </tr>
                            <tr>
                                <td colspan="2">
                                    <label for="UserPhone" class="form-label">Phone Number</label>
                                    <input type="text" class="form-control" id="UserPhone" placeholder="071-xxxxxxx">
                                </td>
                            </tr>
                        </table>

                        <div style="display: flex; margin-top:1rem ">
                            <button type="submit" class="btn btn-update">Update</button>
                        </div>
                    </form>
                </div>

            </div>

        </div>
    </div>
</div>



<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>

<div class="container text-center" style="margin-top: 2rem">
<div class="card">
    <div class="card-header">
        Password Update
    </div>
    <div class="card-body">
        <form>
            <table>
                <tr>
                    <td>
                        <label for="CurrentPassword" class="form-label">Current Password</label>
                        <input type="text" class="form-control" id="CurrentPassword" placeholder="Kevin">
                    </td>

                </tr>
                <tr>
                    <td >
                        <label for="NewPassword" class="form-label">New Password</label>
                        <input type="text" class="form-control" id="NewPassword" placeholder="8+ Charachters">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="ConfirmPassword" class="form-label">Confirm Password</label>
                        <input type="text" class="form-control" id="ConfirmPassword" placeholder="Retype New Password">
                    </td>
                </tr>

            </table>

            <div style="display: flex; margin-top:1rem ">
                <button type="submit" class="btn btn-update">Update</button>
            </div>
        </form>
    </div>

</div>
</div>
<script>
    $(document).ready(function () {
        const countryCode = new URLSearchParams(window.location.search).get("country");

        $('.countrypicker').countrypicker({
            showFlag: true,
            defaultCountry: "LK", // Set Sri Lanka as the default country
        });
    });



</script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select-country/dist/js/bootstrap-select-country.min.js"></script>


</body>
</html>