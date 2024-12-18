
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit Class</title>
        <!-- CSS Bootstrap -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>

        <div class="container mt-5">
            <h2>Edit Class</h2>
            <form action="editClass" method="post">
                <input type="hidden" name="courseId" value="${editedClass.course_id}">

                <!-- Hiển thị các trường thông tin lớp học -->
                <div class="form-group">
                    <label for="name">Title:</label>
                    <input type="text" class="form-control" name="name" value="${editedClass.name}">
                </div>
                <div class="form-group">
                    <label for="cate_id">Subject:</label>
                    <select id="cate_id" name="cate_id" class="form-control" required>
                        <c:forEach var="c" items="${clist}">
                            <c:choose>
                                <c:when test="${c.id eq editedClass.cate_id}">
                                    <option value="${c.id}" selected>${c.name}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${c.id}">${c.name}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                </div>


                <div class="form-group">
                    <label>Status:</label>
                    <br>
                    <label class="radio-inline">
                        <input type="radio" name="status" value="true" ${editedClass.status ? 'checked' : ''}> Active
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="status" value="false" ${!editedClass.status ? 'checked' : ''}> Inactive
                    </label>
                </div>

                <div class="form-group">
                    <label for="brief_infor">Brief Information:</label>
                    <input type="text" class="form-control" name="brief_infor" value="${editedClass.brief_infor}">
                </div>


                <div class="form-group">
                    <label for="image">Image:</label>
                    <input type="text" class="form-control" name="image" value="${editedClass.image}">
                </div>
                <div class="form-group">
                    <label for="courseDate">Course Date:</label>
                    <input type="date" class="form-control" name="courseDate" value="${editedClass.course_date}">
                </div>

                <div class="form-group">

                    <input type="hidden" class="form-control" name="user_id" value="${editedClass.user_id}">
                </div>
                <div class="form-group">
                    <label for="sale_id">Teacher:</label>
                    <select id="sale_id" name="sale_id" class="form-control" required>
                        <c:forEach var="c" items="${list}">
                            <c:choose>
                                <c:when test="${c.userID eq editedClass.sale_id}">
                                    <option value="${c.userID}" selected>${c.fullName}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${c.userID}">${c.fullName}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-primary" value="Save Changes">
                </div>
            </form>
        </div>

        <!-- JS Bootstrap (Optional) -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
