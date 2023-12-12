<%--
  Created by IntelliJ IDEA.
  User: Jude Darren Victoria
  Date: 09/12/2023
  Time: 01:00 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<div class="card mb-3" style=" margin: 3rem 2rem 0 2rem; min-height:300px">
    <div class="card-header">
        <h3 >Customer Review #43</h3>
    </div>
    <div class="card-body">
        <div class="d-flex align-items-start justify-content-between"> <!-- Use 'justify-content-between' for spacing -->
            <div>
                <h4 class="mb-0">Order #123826526578612</h4>
                <span class="text-muted">Posted on: 13 December, 2023 at 11.30 AM</span>
            </div>
            <div class="text-end d-flex align-items-center"> <!-- Right-align these elements and align them vertically -->
                <div>
                    <h3 class="mb-0">Robert Fox</h3>
                    <span class="text-muted">Customer<br></span>
                    <div class="star-container" id="starContainer">
                        <!-- Stars will be dynamically added here -->
                    </div>
                </div>
                <img src="assets/Avatar.png" class="rounded-circle ms-2" alt="User Avatar"> <!-- Move the avatar to the right of the text -->
            </div>
        </div>

        <p class="card-text mt-2">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
        </p>
    </div>
</div>
<div class="back-button-container">
    <button style="margin-left: 3rem" class="btn btn-back" onclick="goBack()">Back</button>
</div>





<script>
    function goBack() {
        window.history.back();
    }
    // Initialize the star rating with default value
    let currentRating = 3.5; // Set your initial rating value here
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
            star.innerHTML = '★'; // You can use an SVG or an image for a more customized star
            star.className = i <= currentRating ? 'star rated' : 'star';
            document.getElementById('starContainer').appendChild(star);
        }
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>
</html>
