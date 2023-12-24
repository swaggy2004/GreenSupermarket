<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 12/12/2023
  Time: 2:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="com.shaveen.greensupermarket.UserOrderDetails"%>
<%@page import="Model.OrderStatusInfo"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String orderID = request.getParameter("orderId");
    int OrderID = Integer.parseInt(orderID);
   OrderStatusInfo orderstatus = UserOrderDetails.getoOrderStatusInfoByOrderID(OrderID);
   pageContext.setAttribute("orderstatus", orderstatus);
%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="stepper.css">

    
</head>
<body>
<%@ include file="header.jsp"%> 

<div class="container mt-5">
    <div class="row">


        <div class="col-md-12">
            <h1 style="margin-bottom: 50px;">Order Status</h1>
            <!--Below code is to display the order ID date and time price-->
            <div class="card mb-3" style="max-width: 1280px;border-radius: 20px;background-color: #D0F288;">
                <div class="row g-0">
                    <div class="col-md-10">
                        <div class="card-body">
                            <h3 class="card-title">ORDER ID #${orderstatus.getOrderId()}</h3>
                            <p class="card-text"><small class="text-body-secondary">Order Placed on ${orderstatus.getOrderPlacedDateTime()}</small></p>
                        </div>
                    </div>

                    <div class="col-md-2 my-auto ">
                        <div class="card-body">
                            <h3 style="color: #276A07;font-weight: 700;letter-spacing: 0.5px;">LKR ${orderstatus.getTotalPrice()}</h3>
                        </div>
                    </div>
                </div>
            </div>
            <!--below code is to display the order expected date-->
<!--            <div style="max-width: 1280px;">
                <div class="row ">
                    <div class="col-md-12">
                        <div class="card-body">
                            <p>Expected date of arrival : <b>13 December, 2023</b></p>
                        </div>
                    </div>

                </div>
            </div>-->


        </div>


    </div>

    <!--Stepper start-->
    <div class="row">

        <div class="col-md-12">

            <div class="card mb-3" style="max-width: 1280px;border: none;">
                <div class="col-md-12">
                    <div class="card-body">

                        <div class="track justify-content-center">
                            <div class="step ${orderstatus.getOrderStatusPlaced() == 1 ? 'active' : ''}">

                                <img src="assets/StepperCheckIcon.svg" class="icon">

                            </div>
                            <div class="step ${orderstatus.getOrderStatusPackaging() == 1 ? 'active' : ''}">

                                <img src="assets/StepperCheckIcon.svg" class="icon">

                            </div>
                            <div class="step ${orderstatus.getOrderStatusDelivered() == 1 ? 'active' : ''}">

                                <img src="assets/StepperCheckIcon.svg" class="icon">

                            </div>


                        </div>
                        <div class="row text-center">
                            <div class="col-md-4">
                                            <span class="icon">
                                                <img src="assets/StepperOrderPlacedIcon.svg">
                                            </span>
                            </div>
                            <div class="col-md-4">
                                            <span class="icon">
                                                <img src="assets/StepperPackagingIcon.svg">
                                            </span>
                            </div>
                            <div class="col-md-4">
                                            <span class="icon">
                                               <img src="assets/StepperDeliverdIcon.svg">
                                            </span>
                            </div>
                        </div>
                        <div class="row text-center">
                            <div class="col-md-4">
                                <span class="text" >Order placed</span>
                            </div>
                            <div class="col-md-4">
                                <span class="text" >Packaging</span>
                            </div>
                            <div class="col-md-4">
                                <span class="text" >Delivered</span>
                            </div>
                        </div>
                    </div>


                </div>

            </div>
        </div>




    </div>
    <!--Stepper end-->
    <div class="container mt-3 mb-4" style="border: 1px solid #D6D4D4">
        <div class="row">


            <div class="col-md-12">
                <h4 style="margin-bottom: 10px;">Order Activity</h4>

                <div class="card mb-3" style="max-width: 1280px;border:none;">
                    <div class="row g-0">
                        <div class="col-md-1 my-auto">
                            <img src="assets/OrderActivity_tickicon.svg" style="width: 60px;background-color: #D5F0D3;" class="img-fluid rounded-start" alt="...">
                        </div>
                        <div class="col-md-11">
                            <div class="card-body">
                                <h6 class="card-title">Your order is successfully verified.</h6>
                                <p class="card-text"><small class="text-body-secondary">12 December, 2023 at 10:35 PM</small></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card mb-3" style="max-width: 1280px;border:none;">
                    <div class="row g-0">
                        <div class="col-md-1 my-auto">
                            <img src="assets/OrderActivity_noteicon.svg" style="width: 60px;background-color: #D5F0D3;" class="img-fluid rounded-start" alt="...">
                        </div>
                        <div class="col-md-11">
                            <div class="card-body">
                                <h6 class="card-title">Your order has been confirmed.</h6>
                                <p class="card-text"><small class="text-body-secondary">12 December, 2023 at 10:34 PM</small></p>
                            </div>
                        </div>
                    </div>
                </div>





            </div>

        </div>
    </div>

</div>

<%@ include file="footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>

</body>
</html>
