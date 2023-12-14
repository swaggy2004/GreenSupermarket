<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="styleSheet" href="login.CSS">
 </head>
<body>
    <div class="wrapper">
        <div class="container main">
            <div class="row">
                    <div class="col-md-9 --Gradient d-none d-md-flex">
                    <!--Gradient background-->
                    <img class="img" src="assets/images/Login/logo.png" alt="Logo"> <!-- Added class "img" -->
                    <div class="big-text">
                        <p>Green Choices, <span style="color: #53A60F;">Bright Future</span></p>
                    </div>
                    <div class="small-text always left">
                        <p><span class="bold" style="font-weight: 900;">Login</span> to your Sustainable Supermarket</p>
                    </div>
                </div>
                <div class="col-12 col-md-3 mx-auto">
                    <div class="container">
                    <div class="input-box mx-auto px-3">
                        <header>Hello!</header>
                        <p class="header-p">Welcome Back</p>
                        <div class="input-field1">
                            <input type="text" class="input" id="email" required autocomplete="off" placeholder="&nbsp;Email Address"> <!-- Corrected placeholder text -->
                        </div>
                        <br>
                        <div class="input-field2">
                            <input type="password" class="input" id="password" placeholder="&nbsp;Password" > <!-- Changed id to "password" -->
                        </div>
                        <br>
                        <div class="input-field">
                            <input type="button" class="submit" value="Login">
                        </div>
                        <div class="forgot-password">
                           <a href="#"> Forgot Password?</a>
                        </div>

                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>