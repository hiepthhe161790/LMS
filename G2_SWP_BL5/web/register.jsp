<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Register Page</title>
        <!-- Import CSS file -->
        <link rel="stylesheet" type="text/css" href="style/login.css">
        <link href="plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
    </head>
    <body  >
        <div class="login" style="margin-top: 120px; margin-bottom: 20px;">
            <h1 style="margin-bottom: 20px"class="loginTitle">Register</h1>
            <form  style="background-image: linear-gradient(#FFFCCE, #FFB330); padding: 40px; border-radius: 10px;width: 600px;height: 700px; margin-bottom: 100px" class="loginForm" action="register" method="post" onsubmit="return validateForm()">
                <label for="email">Email:</label>
                <input class="loginInput" type="email" id="email" name="email" required>
                <label for="fullName">Full Name:</label>
                <input class="loginInput" type="text" id="fullName" name="fullName" required>
                <div style="display:flex; margin-top: 10px">
                    <label >Gender:</label>
                    <input class="loginInput" type="radio" name="gender" id="male" value="1" checked required>Male
                    <input style=" margin-left:10px "  class="loginInput" type="radio" name="gender" id="female" value="2" required>Female
                </div>
                <label for="phone">Phone:</label>
                <input class="loginInput" type="tel" id="phone" name="phone" pattern="[0-9]{10}" placeholder="e.g., 1234567890" required>
                <label for="password">Password:</label>
                <input class="loginInput" type="password" id="password" name="password" required>
                <label for="confirmPassword">Confirm Password:</label>
                <input class="loginInput" id="confirmPassword" name="confirmPassword" type="password"  required>

                <button class="loginButton" type="submit">Register</button>
                <a style="text-decoration: none; color: black;margin-top:10px" href="login.jsp" class="tm-register mt-2" >
                    <i>Have an account? Login here</i>
                </a>
                <a style="text-decoration: none; color: black;margin-top:10px" href="index.jsp" class="tm-register mt-2" >
                    <i class="fa fa-chevron-circle-left" aria-hidden="true"></i>
                    <i>Back to home</i>
                </a>
                <!-- Placeholder for displaying an error message -->
                <c:if test="${errmsg ne null}">
                    <p style="color: red">${errmsg}</p>
                </c:if>
            </form>


        </a>

    </div>

    <script>
        function validateForm() {
            var email = document.getElementById("email").value;
            var password = document.getElementById("password").value;
            var fullName = document.getElementById("fullName").value;
            var phone = document.getElementById("phone").value;

            var confirmPassword = document.getElementById("confirmPassword").value;

            // Basic email validation
            if (!isValidEmail(email)) {
                alert("Invalid email address");
                return false;
            }
            if (password.length < 6) {
                alert("Password must be at least 6 characters long");
                return false;
            }

            // Additional validation logic for password, name, phone, birthDate, address

            return true;
        }

        function isValidEmail(email) {
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return emailRegex.test(email);
        }
    </script>
</body>
</html>