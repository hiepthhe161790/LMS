<%-- 
    Document   : forgotPassword
    Created on : Nov 28, 2023, 11:16:08 PM
    Author     : VIETHUNG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="style/forgotPassword.css">
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="form-gap">
            <div class="container" style="color: black;margin-top: 200px;">
                <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                        <div class="panel panel-default">
                            <div class="panel-body" style="background-image: linear-gradient(#FFFCCE, #FFB330 )">
                                <div class="text-center">
                                    <h3><i class="fa fa-lock fa-4x"></i></h3>
                                    <h2 class="text-center">Forgot Password?</h2>
                                    <p>You can reset your password here.</p>
                                    <div class="panel-body">

                                        <form action="forgotPassword" method="POST">
                                            <label >Enter your email address</label> 
                                            <br>
                                            <input class="enter-email" type="text" name="email"> <br>
                                            <small class="form-text text-muted">
                                                Enter the email address you used during the 
                                                registration. Then we'll email a OTP to this address.
                                            </small>
                                            <br>
                                            <hr>
                                            <div class="submit-password">
                                                <button class="get-password" type="submit">
                                                    <span class="ps">
                                                        Get New Password
                                                    </span>
                                                </button>
                                                <button class="back-login" type="button" onclick="goToLogin()">
                                                    <span class="lg">
                                                        Back to Login
                                                    </span>
                                                </button>
                                                <h2 style="color: red">${message}</h2>
                                            </div>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function goToLogin() {
                window.location.href = "login"; // Thay "login.jsp" bằng URL của trang login của bạn
            }
        </script>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
