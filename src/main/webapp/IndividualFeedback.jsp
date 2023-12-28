<%@page import="com.shaveen.greensupermarket.CIndividualFeedbackManagement"%>
<%@page import="Model.IndividualFeedbackManagement"%>
<%@ page isELIgnored="false" %>
<%
    String feedbackID = request.getParameter("feedbackID");
    IndividualFeedbackManagement cfeedback = CIndividualFeedbackManagement.getinfoByFeedbackID(feedbackID);
    pageContext.setAttribute("cfeedback", cfeedback);
%>
<%

String email = (String) session.getAttribute("email");
String role = (String) session.getAttribute("role");
boolean isLoggedIn =  session.getAttribute("isLoggedIn")!= null && (boolean) session.getAttribute("isLoggedIn");

if ("M".equals(role) && isLoggedIn  && email != null) {
   
%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="IndividualFeedback.css" rel="stylesheet">
    <title>BasePlate</title>
    <style>
        .card {
            border: 1px solid #ccc;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            margin-bottom: 20px;
        }

        .card-header {
            background-color: #f8f9fa;
            padding: 10px 15px;
        }

        .card-title {
            font-size: 18px;
            font-weight: 600;
        }

        .card-body {
            padding: 15px;
        }

        .card-text {
            font-size: 16px;
        }

        .text-muted {
            color: #6c757d;
        }
        .star-container {
            display: inline-block;
        }

        .star {
            color: #FFD700;
            font-size: 30px;
            transition: color 0.2s;
        }

        .rated {
            color: #FFA500;
        }



    </style>
</head>
<body>
    <%--<%@ include file="header.jsp"%>--%>
<div class="card mb-3" style=" margin: 3rem 2rem 0 2rem; min-height:300px">
    <div class="card-header">
        <h3 >Feedback ID:${cfeedback.getFeedbackID()}</h3>
    </div>
    <div class="card-body">
        <div class="d-flex align-items-start justify-content-between"> <!-- Use 'justify-content-between' for spacing -->
            <div>
                <h4 class="mb-0">Order ID:${cfeedback.getOrderID()}</h4>
                <span class="text-muted">${cfeedback.getFeedbackTime()}</span>
            </div>
            <div class="text-end d-flex align-items-center"> <!-- Right-align these elements and align them vertically -->
                <div>
                    <h3 class="mb-0">${cfeedback.getCName()}</h3>
                    <span class="text-muted">Customer<br></span>
                    <div class="star-container" id="starContainer">
                        <!-- Stars will be dynamically added here -->
                    </div>
                </div>
                <!--<img src="assets/${cfeedback.getCAvatar()}" class="rounded-circle ms-2" alt="User Avatar">  Move the avatar to the right of the text -->
                <img src="assets/Avatar.png" class="rounded-circle ms-2" alt="User Avatar"> <!-- Move the avatar to the right of the text -->
            </div>
        </div>

        <p class="card-text mt-2">
            ${cfeedback.getFeedbackText()}
        </p>
    </div>
</div>
<div class="back-button-container">
    <button style="margin-left: 3rem" class="btn btn-back" onclick="goBack()">Back</button>
</div>




 <%--<%@ include file="footer.jsp"%>--%>
<script>
    function goBack() {
        window.history.back();
    }
    // Initialize the star rating with default value
    let currentRating = ${cfeedback.getFeedbackRating()}; // Set your initial rating value here
    updateRating(currentRating);

    // Function to update the star rating based on a variable
    function updateRating(rating) {
        // Ensure the rating is within the valid range
        currentRating = Math.min(5, Math.max(1, rating));

        // Clear previous stars
        document.getElementById('starContainer').innerHTML = '';

        // Create stars based on the rating
        for (let i = 1; i <= 5; i++) {
            const star = document.createElement('span');
            star.innerHTML = '&#9733;'; // You can use an SVG or an image for a more customized star
            star.className = i <= currentRating ? 'star rated' : 'star';
            document.getElementById('starContainer').appendChild(star);
        }
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>
</html>
<%
} else {
    // Redirect back to the login page
    response.sendRedirect("adminlogin.jsp");
}
%>