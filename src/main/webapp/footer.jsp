<!DOCTYPE html>
<html lang="en">
<head>
  <title>Footer Design</title>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet"  type="text/css" href="footer.css">
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
</head>

<body class="footer-body">

  <footer class="footer">
  	 <div class="container footer-container">
  	 	<div class="row footer-row">
  	 		<div class="footer-col">
  	 			<h4>Customer Access</h4>
  	 			<ul>
                                        <li><a href="<%= request.getContextPath() %>/login.jsp">Customer Login</a></li>
  	 				<li><a href="<%= request.getContextPath() %>/UserDashboard.jsp">User Dashboard</a></li>
  	 				<li><a href="<%= request.getContextPath() %>/UserSettings.jsp">User Settings</a></li>
  	 				<li><form id="myCartForm" action="<%= request.getContextPath() %>/OpenShoppingCartServlet" method="post">
                                            <a href="javascript:void(0);" onclick="document.getElementById('myCartForm').submit();">My Cart</a>
                                            </form>
                                        </li>
  	 				<li><form id="myWishlistForm" action="<%= request.getContextPath() %>/OpenWishListServlet" method="post">
                                            <a href="javascript:void(0);" onclick="document.getElementById('myWishlistForm').submit();">Wish List</a>
                                            </form>
                                        </li>                                            
  	 			</ul>
  	 		</div>
  	 		<div class="footer-col">
  	 			<h4>Manager Control</h4>
  	 			<ul>
                                        <li><a href="<%= request.getContextPath() %>/adminlogin.jsp">Manager Login</a></li>
  	 				<li><a href="<%= request.getContextPath() %>/ManagerDashboard.jsp">Manager Dashboard</a></li>
  	 				<li><a href="<%= request.getContextPath() %>/OrderManagement.jsp">Orders Management</a></li>
  	 				<li><a href="<%= request.getContextPath() %>/FeedbackManagement.jsp">Feedback Management</a></li>
  	 				<li><a href="<%= request.getContextPath() %>/StockManagement.jsp">Stock Management</a></li>
  	 			</ul>
  	 		</div>
  	 		<div class="footer-col">
  	 			<h4>Admin Control</h4>
  	 			<ul>
                                        <li><a href="<%= request.getContextPath() %>/adminlogin.jsp">Admin Login</a></li>
  	 				<li><a href="<%= request.getContextPath() %>/AdminProduct.jsp">Product Edit</a></li>
  	 				<li><a href="<%= request.getContextPath() %>/AdminAccount.jsp">Account Edit</a></li>
  	 			</ul>
  	 		</div>
  	 		<div class="footer-col">
  	 			<h4>follow us</h4>
  	 			<div class="social-links">
                    <img width="60" src="<%= request.getContextPath() %>/assets/images/Product-images/footer-logo.svg">
                    <p>Your eco-friendly haven for sustainable living. Locally sourced, organic products, and a commitment to a greener future.</p>
  	 			</div>
  	 		</div>
  	 	</div>
  	 </div>
  </footer>
</body>
</html>
