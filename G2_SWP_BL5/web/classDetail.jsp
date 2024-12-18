<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Class Detail</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            padding-top: 20px;
            font-family: Arial, sans-serif;
        }
        .container {
            margin-top: 30px;
        }
        .card {
            margin-bottom: 20px;
        }
        .card-header {
            background-color: #f8f9fa;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="mb-4">Class Detail</h2>
  <c:set var="courseId" value="${param.courseId}" />
        <c:if test="${not empty classDetail}">
            <div class="card">
                <div class="card-header">
                    Class Information
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-3">ID:</div>
                        <div class="col-md-9">${classDetail.course_id}</div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">Name:</div>
                        <div class="col-md-9">${classDetail.name}</div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">Category:</div>
                        <div class="col-md-9">${classDetail.cateName}</div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">Lessons:</div>
                        <div class="col-md-9">${classDetail.lessons}</div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">Owner:</div>
                        <div class="col-md-9">${classDetail.user_name}</div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">Status:</div>
                        <div class="col-md-9">${classDetail.status ? "Active" : "Deactive" }</div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">Brief Info:</div>
                        <div class="col-md-9">${classDetail.brief_infor}</div>
                    </div>                 
                    <div class="row">
                        <div class="col-md-3">Teacher ID:</div>
                        <div class="col-md-9">${classDetail.sale_id}</div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">Image:</div>
                        <div class="col-md-9">${classDetail.image}</div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">Course Date:</div>
                        <div class="col-md-9">${classDetail.course_date}</div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">Title:</div>
                        <div class="col-md-9">${classDetail.title}</div>
                    </div>
                    <!-- Add more rows for additional details -->

                    <div class="mt-3">
                         <a href="listTrainee?courseId=${courseId}">View Trainee</a>
                    </div>
                </div>
            </div>
        </c:if>

        <!-- Additional HTML or elements can go here -->
    </div>

    <!-- Bootstrap JS and Popper.js for interactive components -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
