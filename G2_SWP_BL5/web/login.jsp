<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Page</title>
        <!-- Import CSS file -->
        <link rel="stylesheet" type="text/css" href="style/login.css">
        <link href="plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="login">
            <h1 style="margin-bottom: 55px" class="loginTitle">Login</h1>
            <form style="background-image: linear-gradient(#FFFCCE, #FFB330 ); padding: 40px; border-radius: 10px; width: 600px;height: 300px" class="loginForm" action="login" method="post">
                <label>Email</label>
                <input class="loginInput" type="text" name="email" placeholder="Enter your email...">
                <label>Password</label>
                <input class="loginInput" type="password" name="password" placeholder="Enter your password..." minlength="6">
                <c:if test="${errmsg ne null}">
                    <p style="color: red">${errmsg}</p> 
                </c:if>
                <button name="login" class="loginButton" type="submit">Login</button>
                <button class="loginButton" type="submit"><a href="https://accounts.google.com/o/oauth2/auth?scope=profile%20email&redirect_uri=http://localhost:9999/G2_SWP_BL5/LoginGoogle&response_type=code&client_id=533576818323-s0gh58cnnm5kbcfhr0bfsuvpppu9j29d.apps.googleusercontent.com&approval_prompt=force">Login With Google</a></button>
                <a style="text-decoration: none; color: black; margin-top:10px;" href="register" class="tm-register mt-2" >
                    <i>Haven't account yet? Register here.</i>
                </a>
                <a style="text-decoration: none; color: black; margin-top:10px" href="forgotPassword.jsp" class="tm-register mt-2">
                    <i>Forgot Password</i>
                </a>
                <a style="text-decoration: none; color: black;margin-top:10px" href="index.jsp" class="tm-register mt-2" >
                    <i class="fa fa-chevron-circle-left" aria-hidden="true"></i>
                    <i>Back to home</i>
                </a>
                ${message}
            </form>

        </div>
    </body>
</html>
