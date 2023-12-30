<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
  String orderID = request.getParameter("orderId");
    int OrderID = Integer.parseInt(orderID);
   
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>Review Popup</title>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

</head>

<body>
    <%@ include file="header.jsp"%>

<div class="container mt-3">

  <div class="row">
    <div class="col-md-6 offset-md-3 col-12">
    
      <form action="UserFedbackReviewServlet" method="post">
      
        <input type="hidden" name="OrderId" value="<%= OrderID %>">
        
        <h5 class="text-center review-text1 mb-4">Order Review</h5>
        
        <h6 class="text-center review-text2 mb-4">
          Order ID #<%= OrderID %>  
        </h6>

        <div class="form-group">
        
          <h6 class="text-center">Please share your experience</h6>
        
          <div class="form-check form-inline justify-content-center mb-4">

            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadioOptions1" value="1">
            <label class="form-check-label" for="inlineRadioOptions1">Fair</label>

            <input class="form-check-input ml-3" type="radio" name="inlineRadioOptions" id="inlineRadioOptions2" value="2"> 
            <label class="form-check-label" for="inlineRadioOptions2">Good</label>

            <input class="form-check-input ml-3" type="radio" name="inlineRadioOptions" id="inlineRadioOptions3" value="3">
            <label class="form-check-label" for="inlineRadioOptions3">Very Good</label>
            
            <input class="form-check-input ml-3" type="radio" name="inlineRadioOptions" id="inlineRadioOptions4" value="4">
            <label class="form-check-label" for="inlineRadioOptions4">Excellent</label>
            
            <input class="form-check-input ml-3" type="radio" name="inlineRadioOptions" id="inlineRadioOptions5" value="5">
            <label class="form-check-label" for="inlineRadioOptions5">Superb</label>

          </div>
        
        </div>

        <div class="form-group text-center">
         <p>Thank you for your rating!</p>
        </div>

        <div class="form-group">
        
          <label>Add written review:</label>
        
          <textarea class="form-control" rows="5" name="writtenReview" placeholder="Enter review"></textarea>
        
        </div> 
        
        <button type="submit" class="btn btn-success btn-block">Submit</button>
        
      </form>
    
    </div>
  </div>

</div>
<%@ include file="footer.jsp"%> 
</body>
</html>