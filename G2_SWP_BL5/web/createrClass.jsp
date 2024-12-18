<%-- 
    Document   : createBlogForm
    Created on : Dec 14, 2023, 12:34:03 PM
    Author     : VIETHUNG
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>Create Class</title>
        <!-- CSS Bootstrap -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa;
                padding-top: 50px;
            }

            .form-container {
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 30px;
                max-width: 600px;
                margin: auto;
            }

            .form-group {
                margin-bottom: 20px;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-8 mx-auto">
                    <div class="form-container">
                        <h2 class="text-center mb-4">Create Class</h2>
                        <form action="CreateClass" method="post" onsubmit="return validateForm()">
                            <div class="form-group">
                                <label for="name">Title*:</label>
                                <input type="text" id="name" name="name" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="sale_id">Teacher:</label>
                                <select id="sale_id" name="sale_id" class="form-control" required>
                                    <c:forEach var="c" items="${list}">
                                        <option value="${c.userID}">${c.fullName}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="cate_id">Subject*:</label>
                                <select id="cate_id" name="cate_id" class="form-control" required>
                                    <c:forEach var="c" items="${clist}">
                                        <option value="${c.id}">${c.name}</option>
                                    </c:forEach>
                                </select>
                            </div>


                            <div class="form-group">
                                <label>Status:</label><br>
                                <input type="radio" id="active" name="status" value="true" required>
                                <label for="active">Active</label><br>
                                <input type="radio" id="inactive" name="status" value="false" required>
                                <label for="inactive">Inactive</label><br>
                            </div>

                            <label for="image">Image URL*:</label>
                            <input type="text" id="image" name="image" required><br>

                            <label for="courseDate">Class Date*:</label>
                            <input type="date" id="courseDate" name="courseDate" required><br>

                            <div class="form-group">
                                <label for="brief_infor">Brief Information*:</label>
                                <textarea id="brief_infor" name="brief_infor" class="form-control" rows="4" required></textarea>
                            </div>

                            <div class="text-center">
                                <input type="submit" value="Create Class" class="btn btn-primary">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function validateForm() {
                var title = document.getElementById("title").value;
                var name = document.getElementById("name").value;
                var cate_id = document.getElementById("cate_id").value;
                var lessons = document.getElementById("lessons").value;
                var status = document.getElementById("status").value;

                if (isEmptyOrSpaces(title) || isEmptyOrSpaces(name) || isEmptyOrSpaces(cate_id) || isEmptyOrSpaces(lessons) || isEmptyOrSpaces(status)) {
                    alert("Please enter all fields");
                    return false;
                }

                return true;
            }

            function isEmptyOrSpaces(str) {
                return str === null || str.match(/^ *$/) !== null;
            }
        </script>
        <!-- JS Bootstrap (Optional) -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>

</html>
