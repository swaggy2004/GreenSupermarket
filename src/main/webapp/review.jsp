<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Review-popup</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="review.css">
</head>
<body>
    <div class="review-container">
        <p class="review-text1">Order Review</p>
        <p class="review-text2"><b>Order</b> #1234567891012</p>
        <div class="feedback-container d-flex flex-column justify-content-center ">
            <p class="feedback-text">Please share your experience with us</p>
            <p class="rating-text">4.0</p>
            <img src="assets/images/Order-review/star-icons.svg" alt="Rating" class="rating-image mx-auto my-auto d-block">
        </div>
        <div class="thankyou-container d-flex flex-column justify-content-left ">
            <p class="thankyou-text">✔   Thank you for your rating.  Please tell us more!</p>
        </div>
        <div class="written-review d-flex flex-column justify-content-center ">
            <p class="feedback-text">Add written review</p>
            <!-- Textbox for written review -->
            <textarea class="form-control review-textbox" rows="5" placeholder="How’s the quality of the products? Is it worth the price?"></textarea>
        </div>
        <button type="submit" class="btn submit-button">Submit&nbsp; ✔</button>
    </div>    
</body>
</html>
