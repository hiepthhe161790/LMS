<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Update Blog</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="styles/news_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/news_responsive.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }
            h2 {
                text-align: center;
            }
            form {
                max-width: 400px;
                margin: 0 auto;
            }
            label {
                display: block;
                margin-bottom: 5px;
            }
            input[type="text"],
            input[type="number"],
            textarea {
                width: 100%;
                padding: 8px;
                margin-bottom: 10px;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 4px;
                resize: vertical;
            }
            input[type="checkbox"] {
                margin-bottom: 10px;
            }
            input[type="submit"] {
                background-color: #007bff;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
            }
            input[type="submit"]:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <%@include file="header.jsp" %>
    <body >
        <div style="color: black;margin-top: 200px;">
            <h2>Update Blog</h2>

            <%-- Display error message if any --%>
            <% if (request.getAttribute("error") != null) { %>
            <p style="color: red;"><%= request.getAttribute("error") %></p>
            <% } %>

            <c:if test="${not empty b}">
                <form action="updateBlog" method="post">
                    <label for="title">Title:</label>
                    <input type="text" name="title" value="${b.title}" required><br>

                    <label for="image">Image URL:</label>
                    <input type="text" name="image" value="${b.image}" required><br>

                    <label for="briefInfo">Brief Info:</label>
                    <textarea name="briefInfo" rows="4" required>${b.brief_info}</textarea><br>

                    <label for="blogContent">Blog Content:</label>
                    <textarea name="blogContent" rows="8" required>${b.blog_content}</textarea><br>


                    <label for="categoryId" class="form-label">Category Blog:</label>
                    <select name="categoryId" id="categoryId" class="form-select" required>
                        <c:forEach var="c" items="${clist}">
                            <c:choose>
                                <c:when test="${c.id eq b.cate_id}">
                                    <option value="${c.id}" selected>${c.name}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${c.id}">${c.name}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>

                    <label for="status">Status:</label>
                    <select id="status" name="status" class="form-select" required>
                        <option value="true">Show</option>
                        <option value="false">Hide</option>
                    </select></br>

                    <label for="thumbnail">Thumbnail URL:</label>
                    <input type="text" name="thumbnail" value="${b.thumbnail}" required><br>

                    <label for="flag">Flag:</label>
                    <select name="flag" class="form-select" required>
                        <option value="ON" ${b.flag.equals("ON") ? "selected" : ""}>ON</option>
                        <option value="OFF" ${b.flag.equals("OFF") ? "selected" : ""}>OFF</option>
                    </select>


                    <input type="hidden" name="numberOfAccess" value="${b.numberOfAccess}" required><br>


                    <input type="hidden" name="blogId" value="${b.blog_id}" required readonly><br>

                    <input type="submit" value="Update Blog">
                </form>
            </c:if>
        </div>
             <!-- CKEditor Script -->
        <script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>
        <script>
            // Activate CKEditor on blogContent textarea
            CKEDITOR.replace('blogContent');
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <jsp:include page="footer.jsp"/>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
