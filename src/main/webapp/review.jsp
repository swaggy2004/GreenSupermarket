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
    
    <div class="review-container">
        <p class="review-text1">Order Review</p>
        <p class="review-text2"><b>Order</b> #1234567891012</p>
        <div class="feedback-container d-flex flex-column justify-content-center ">
          <!--add here the rating code-->
          <div class="values">
                <div>
                    <input class="ratingvalue" type="text" name="rating" id="rating_val" value="0" />
                </div>
            </div>
            <span class="rating_stars rating_0 border">
                <span class='s border' data-low='0.5' data-high='1'><i class="fa fa-star-o border"></i><i
                        class="fa fa-star-half-o border"></i><i class="fa fa-star border"></i></span>
                <span class='s' data-low='1.5' data-high='2'><i class="fa fa-star-o"></i><i class="fa fa-star-half-o"></i><i class="fa fa-star"></i></span>
                <span class='s' data-low='2.5' data-high='3'><i class="fa fa-star-o"></i><i class="fa fa-star-half-o"></i><i class="fa fa-star"></i></span>
                <span class='s' data-low='3.5' data-high='4'><i class="fa fa-star-o"></i><i class="fa fa-star-half-o"></i><i class="fa fa-star"></i></span>
                <span class='s' data-low='4.5' data-high='5'><i class="fa fa-star-o"></i><i class="fa fa-star-half-o"></i><i class="fa fa-star"></i></span>			
                <span class='r r0_5 border' data-rating='1' data-value='0.5'></span>
                <span class='r r1' data-rating='1' data-value='1'></span>
                <span class='r r1_5' data-rating='15' data-value='1.5'></span>
                <span class='r r2' data-rating='2' data-value='2'></span>
                <span class='r r2_5' data-rating='25' data-value='2.5'></span>
                <span class='r r3' data-rating='3' data-value='3'></span>
                <span class='r r3_5' data-rating='35' data-value='3.5'></span>
                <span class='r r4' data-rating='4' data-value='4'></span>
                <span class='r r4_5' data-rating='45' data-value='4.5'></span>
                <span class='r r5' data-rating='5' data-value='5'></span>
            </span>
<!--            <p class="feedback-text">Please share your experience with us</p>
            <p class="rating-text">4.0</p>
            <img src="assets/images/Order-review/star-icons.svg" alt="Rating" class="rating-image mx-auto my-auto d-block">-->
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
    <script>
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
    </script>
    
</body>
</html>
