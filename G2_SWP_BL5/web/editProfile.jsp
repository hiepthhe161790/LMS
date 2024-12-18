<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Page</title>
        <!-- Import CSS file -->
        <link rel="stylesheet" type="text/css" href="style/update_profile.css">
    </head>
    <body>
        <div class="login" >
            <span style="margin-bottom: 50px" class="loginTitle">Edit Profile</span>
            <form style="background-image: linear-gradient(#FFFCCE, #FFB330 ); padding: 40px; border-radius: 10px; width: 600px;height: 800px" 
                  class="loginForm" action="editProfile" method="post" >
                <img src="${user.avatar}" id="demoimg" style="margin-top: 5px;border-radius: 50%; margin-left: 200px;" width="200px" height="200px">

                <label class="control-label" >Image</label>
                <input class="form-control" id="img" onchange="changeimg()" name="image" type="file" >

                <label for="fullName">Full Name:</label>
                <input class="loginInput" type="text" id="fullName" name="fullName" value="${user.getFullName()}" required>
                <label for="password">Email:</label>
                <input class="loginInput" type="text" id="email" name="email" value="${user.getEmail()}" readonly >

                <label for="phone">Phone:</label>
                <input class="loginInput" type="tel" id="phone" value="${user.getPhone()}" name="phone" pattern="[0-9]{10}" placeholder="e.g., 1234567890" required>

     
                <label for="address">Address:</label>
                <input class="loginInput" id="address" name="address" value="${user.getAddress()}" required>

                <div style="display:flex; margin-top: 10px">
                    <label >Gender:</label>

                    <c:if test="${user.getGender() }">
                        Male
                        <input class="loginInput" type="radio" name="gender" id="male" value="1" checked required>
                        Female
                        <input class="loginInput" type="radio" name="gender" id="male" value="2" required>                                    </c:if>
                    <c:if test="${!user.getGender() }">

                        <input class="loginInput" type="radio" name="gender" id="female" value="1"  required>Male

                        <input style=" margin-left:10px "  class="loginInput" type="radio" name="gender" checked id="female" value="2" required>     Female                               </c:if>
                    </div>
                <input name="postimage" id="postimage" value="${user.avatar}" type="hidden" >


                    <button class="loginButton" type="submit">Update</button>

                    <!-- Placeholder for displaying an error message -->
                <c:if test="${errmsg ne null}">
                    <p style="color: red">${errmsg}</p>
                </c:if>
            </form>

        </div>


        <script>
            function changeimg() {
                var file = document.getElementById("img").files[0];
                if (file.name.match(/.+\.(jpg|png|jpeg)/i)) {
                    if (file.size / (1024 * 1024) < 5) {
                        var fileReader = new FileReader();
                        fileReader.readAsDataURL(file);
                        fileReader.onload = function () {
                            document.getElementById("postimage").value = (fileReader.result);
                            document.getElementById("demoimg").src = (fileReader.result);
                        }
                    } else {
                        uploadError();
                    }
                } else {
                    uploadError();
                }
            }
            function changeFbimg() {
                var file = document.getElementById("fbimg").files[0];
                if (file.name.match(/.+\.(jpg|png|jpeg)/i)) {
                    if (file.size / (1024 * 1024) < 5) {
                        var fileReader = new FileReader();
                        fileReader.readAsDataURL(file);
                        fileReader.onload = function () {
                            document.getElementById("sendimg").value = (fileReader.result);
                        };
                    } else {
                        uploadError();
                    }
                } else {
                    uploadError();
                }
            }
            function uploadError() {
                alert('Please upload photo file < 5MB');
                document.getElementById("fbimg").files[0].value = '';
                document.getElementById("fbimg").type = '';
                document.getElementById("fbimg").type = 'file';
            }

        </script>
    </body>
</html>
