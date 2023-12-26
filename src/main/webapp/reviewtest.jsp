<%-- 
    Document   : reviewtest
    Created on : Dec 26, 2023, 12:05:50 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="reviewtest.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    </head>
    <body>
        <div class="values">
  
  <div>
    <input type="text" name="rating" id="rating_val" value="0" />
  </div>
    </div>
    <span class="rating_stars rating_0 border">
      <span class='s border' data-low='0.5' data-high='1'><i class="fa fa-star-o border"></i><i
              class="fa fa-star-half-o border"></i><i class="fa fa-star border"></i></span>
      <span class='s border' data-low='1.5' data-high='2'><i class="fa fa-star-o border"></i><i
              class="fa fa-star-half-o border"></i><i class="fa fa-star border"></i></span>
      <span class='s border' data-low='2.5' data-high='3'><i class="fa fa-star-o border"></i><i
              class="fa fa-star-half-o border"></i><i class="fa fa-star border"></i></span>
      <span class='s border' data-low='3.5' data-high='4'><i class="fa fa-star-o border"></i><i
              class="fa fa-star-half-o border"></i><i class="fa fa-star border"></i></span>
      <span class='s border' data-low='4.5' data-high='5'><i class="fa fa-star-o border"></i><i
              class="fa fa-star-half-o border"></i><i class="fa fa-star border"></i></span>
      <span class='r r0_5' data-rating='1' data-value='0.5'></span>
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
