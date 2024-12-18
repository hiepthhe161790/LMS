
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
        <title>Create Blog</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="styles/news_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/news_responsive.css">
       
        <style>
            body {
                background-color: #f8f9fa;
            }
            .form-container {
                max-width: 600px;
                margin: 0 auto;
                padding: 30px;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }
            .form-container h2 {
                margin-bottom: 30px;
                text-align: center;
            }
            .form-control {
                margin-bottom: 20px;
            }
            .btn-primary {
                width: 100%;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container mt-5 " >
            <div class="form-container" style="color: black;margin-top: 200px;">
                <h2>Create Blog</h2>

                <%-- Display error message if any --%>
                <% if (request.getAttribute("error") != null) { %>
                <p style="color: red;"><%= request.getAttribute("error") %></p>
                <% } %>

                <form action="createBlogServlet" method="post">
                    <div class="mb-3">
                        <label for="title" class="form-label">Title:</label>
                        <input type="text" class="form-control" name="title" id="title" required>
                    </div>
                    <div class="mb-3">
                        <label for="image" class="form-label">Image URL:</label>
                        <input type="text" class="form-control" name="image" id="image" required>
                    </div>
                    <div class="mb-3">
                        <label for="briefInfo" class="form-label">Brief Info:</label>
                        <textarea name="briefInfo" id="briefInfo" rows="4" class="form-control" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="blogContent" class="form-label">Blog Content:</label>
                        <textarea name="blogContent" id="blogContent" rows="8" class="form-control" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="categoryId" class="form-label">Category Blog:</label>
                        <select name="categoryId" id="categoryId" class="form-select" required>
                            <c:forEach var="c" items="${clist}">
                                <option value="${c.id}">${c.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Flag:</label><br>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="flag" id="flag_on" value="on" checked>
                            <label class="form-check-label" for="flag_on">ON</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="flag" id="flag_off" value="off">
                            <label class="form-check-label" for="flag_off">OFF</label>
                        </div>
                    </div>
                    <div class="mb-3">
                        <input type="submit" class="btn btn-primary" value="Create Blog">
                    </div>
                </form>
            </div>
        </div>
        <!-- CKEditor Script -->
        <script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>
        <script>
            // Activate CKEditor on blogContent textarea
            CKEDITOR.replace('blogContent');
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
