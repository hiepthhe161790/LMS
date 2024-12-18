<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="CSS/myRegis.css" rel="stylesheet" type="text/css"/>            
    <link href="CSS/styles.css" rel="stylesheet" type="text/css"/> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <h2 style="text-align: center">ADD TRAINEE</h2>
    <c:set var="courseId" value="${param.courseId}" />
    <div class="container" style="margin-right: 2px; margin-left: 12%;">
        <div class="table-wrapper">
            <form action="addRegistrationsForCourse" method="post">
                <table id="user-list-table" class="table table-striped table-bordered mt-4" role="grid" aria-describedby="user-list-page-info">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Full Name</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Add</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listC}" var="o" varStatus="status">
                            <tr class="mt-30">
                                <td>${o.userID}</td>
                                <td>${o.fullName}</td>
                                <td>${o.phone}</td>
                                <td>${o.email}</td>
                                <td class="checkbox-column">
                                    <c:choose>
                                        <c:when test="${o.registered}">
                                            <!-- Nếu đã đăng ký, tích check-box -->
                                            <input type="checkbox" name="selectedUsers" value="${o.userID}" checked>
                                        </c:when>
                                        <c:otherwise>
                                            <!-- Nếu chưa đăng ký, không tích check-box -->
                                            <input type="checkbox" name="selectedUsers" value="${o.userID}">
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <!-- Thêm trường input ẩn để giữ giá trị courseId -->
                <input type="hidden" name="courseId" value="${courseId}" />

                <!-- Thêm nút "Add Registrations" để gửi form -->
                <div style="text-align: center; margin-top: 20px;">
                    <button type="submit" class="btn btn-primary">Add Registrations</button>
                </div>
                 <div style="text-align: center; margin-top: 10px;">
                    <button type="button" class="btn btn-secondary" onclick="goBack()">Come back</button>
                </div>
            </form>
        </div>
                 <c:if test="${not empty successMessage}">
        <div class="alert alert-success">${successMessage}</div>
    </c:if>

    <%-- Hiển thị thông báo thất bại nếu có --%>
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>
    </div> 
      <!-- Script để thực hiện hành động quay lại -->
    <script>
        function goBack() {
            window.history.back();
        }
    </script>
<jsp:include page="footer.jsp"/>
</body>
</html>
