<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign-up</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="styleSheet" href="signup.CSS">
 </head>
<body>
    <div class="wrapper">
        <div class="container main">
            <div class="row">
                <div class="col-md-9 --Gradient d-none d-md-flex">
                    <!--Gradient background-->
                    <img class="img" src="assets/images/Login/logo.png" alt="Logo">  
                    <div class="big-text">
                        <p>Green Choices, <span style="color: #53A60F;">Bright Future</span></p>
                    </div>
                    <div class="small-text always left">
                        <p><span class="bold" style="font-weight: 900;">Register</span> with your Sustainable Supermarket</p>
                    </div>
                </div>
                <div class="col-12 col-md-3 mx-auto" style="margin-top: 5rem">
                    <div class="container">
                    <div class="input-box mx-auto px-3">
                        <header>Hello!</header>
                        <p class="header-p ">Sign Up to Start</p>
                        <form name="register" action="<%=request.getContextPath()%>/CusRegisterServlet" method="post">
                        <div class="input-field1">
                            <input type="text" class="input" name="fullname" id="fullname" required autocomplete="off" placeholder="Full name">  
                        </div>
                        <br>
                        <div class="input-field2">
                            <input type="email" class="input" name="email"  id="email" required autocomplete="off" placeholder="Email Address">  
                        </div>
                        <br>
                        <div class="input-field3">
                            <input type="text" class="input"  name="pno"  id="pno" required autocomplete="off" placeholder="Phone number">  
                        </div>
                        <br>
                        <div class="input-field4">
                            <input type="password" class="input" name="password" id="password" placeholder="Password" >  
                        </div>
                        <br>
                        <div class="input-field">
                           
                           <input type="submit" id="submit" name="submit" value="Register">
                            
                        </div>
                        </form>
                        <div class="forgot-password">
                            
                           <a href="login.jsp" style="color:black;">Login instead ?</a>
                        </div>
                         </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>