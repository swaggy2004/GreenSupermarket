<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
  String orderID = request.getParameter("orderId");
    int OrderID = Integer.parseInt(orderID);
   
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Review-popup</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="review.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
    <form action="UserFedbackReviewServlet" method="post">
    <div class="review-container">
        <p class="review-text1">Order Review</p>
        <p class="review-text2"><b>Order ID</b> #<%= OrderID %></p>
        <input type="hidden" name="OrderId" value="<%= OrderID %>">
        <div class="feedback-container d-flex flex-column justify-content-center ">
            <h4>Please share your experience with us</h4>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1"value="1">
                <label class="form-check-label" for="flexRadioDefault1">
                  Fair
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2"value="2" >
                <label class="form-check-label" for="flexRadioDefault2">
                  Good
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="3">
                <label class="form-check-label" for="flexRadioDefault2">
                  Very Good
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="4" >
                <label class="form-check-label" for="flexRadioDefault2">
                  Excellent
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="5">
                <label class="form-check-label" for="flexRadioDefault2">
                  Superb
                </label>
            </div>
            
          <!--add here the rating code-->
<!--          
<!--            <p class="feedback-text">Please share your experience with us</p>
            <p class="rating-text">4.0</p>
            <img src="assets/images/Order-review/star-icons.svg" alt="Rating" class="rating-image mx-auto my-auto d-block">-->
        </div>
        <div class="thankyou-container d-flex flex-column justify-content-left ">
            <p class="thankyou-text">Thank you for your rating.  Please tell us more!</p>
        </div>
        <div class="written-review d-flex flex-column justify-content-center ">
            <p class="feedback-text">Add written review</p>
            <!-- Textbox for written review -->
            <textarea class="form-control review-textbox" rows="5" name="writtenReview" placeholder="How is the quality of the products? Is it worth the price?"></textarea>
        </div>
        <button type="submit" class="btn submit-button">Submit</button>
    </div> 
    </form>
<!--    <script>
        $(document).ready(function() {
            $('.rating_stars span.r').hover(function() {
                // get hovered value
                var rating = $(this).data('rating');
                var value = $(this).data('value');
                $(this).parent().attr('class', '').addClass('rating_stars').addClass('rating_'+rating);
                highlight_star(value);
            }, function() {
                // get hidden field value
                var rating = $("#rating").val();
                var value = $("#rating_val").val();
                $(this).parent().attr('class', '').addClass('rating_stars').addClass('rating_'+rating);
                highlight_star(value);
            }).click(function() {
                // Set hidden field value
                var value = $(this).data('value');
                $("#rating_val").val(value);

                var rating = $(this).data('rating');
                $("#rating").val(rating);
                
                highlight_star(value);
            });

            var highlight_star = function(rating) {
                $('.rating_stars span.s').each(function() {
                    var low = $(this).data('low');
                    var high = $(this).data('high');
                    $(this).removeClass('active-high').removeClass('active-low');
                    if (rating >= high) $(this).addClass('active-high');
                    else if (rating == low) $(this).addClass('active-low');
                });
            }
        });
    </script>-->
    
</body>
</html>
