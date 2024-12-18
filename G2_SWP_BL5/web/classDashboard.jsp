<%-- 
    Document   : classDashboard
    Created on : Dec 14, 2023, 8:32:42 PM
    Author     : Nahhh
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Model.User" %>
<%@ page import="Model.Class" %>
<%@ page import="Model.Blog" %>
<%@ page import="Model.Contact" %>
<!doctype html>

<!-- Mirrored from templates.iqonic.design/booksto/html/user-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:19:34 GMT -->
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>DashBoard</title>
    <!-- Favicon -->
    <link rel="shortcut icon" href="admin/images/favicon.icon" />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="admin/css/bootstrap.min.css">
    <!-- Typography CSS -->
    <link rel="stylesheet" href="admin/css/typography.css">
    <!-- Style CSS -->
    <link rel="stylesheet" href="admin/css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="admin/css/responsive.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="sweetalert2.min.js"></script>
    <link rel="stylesheet" href="sweetalert2.min.css">
    <script src="sweetalert2.all.min.js"></script>
    <style>
        .left-column {
            background-color: #fff; /* Add your preferred background color */
            padding: 15px;
            height: 74.5vh; /* Adjust the height as needed */
        }

        .right-column {
            padding: 15px;
            height: 80vh; /* Adjust the height as needed */
        }
    </style>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 8px;
        }

        input,
        textarea {
            margin-bottom: 16px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body style="
      background: linear-gradient(to right, #8e44ad, #3498db);
      background-image:url(images/slider_background.jpg);
      transition: background 0.5s;
      color: #fff; /* Set text color to white for better visibility */
      ">

    <%--<jsp:include page="header.jsp"></jsp:include>--%>
    <!-- Sidebar  -->
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light bg-light mx-auto">
            <a class="navbar-brand" href="index.jsp">LMS</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav ">
                    <a class="nav-item nav-link" href="index.jsp">Home</a>
                    <a class="nav-item nav-link active" href="#">Dashboard<span class="sr-only">(current)</span></a>
                    <a class="nav-item nav-link" href="#">Blog</a>
                    <a class="nav-item nav-link" href="#">My Class</a>
                </div>
            </div>
        </nav>
        <div class="row">   
            <div class="col-md-12">
                <h2 style="color: white">Class Dashboard</h2>
                <div>
                    Course: 
                    <form method="get" action="classdashboard" id="courseForm">
                        <select name="courseId" onchange="submitForm()">
                            <c:forEach items="${registrations}" var="r">
                                <a href="classdashboard?courseId=${r.course.id}">
                                    <option value="${r.course.id}"
                                            <c:if test="${courseId eq r.course.id}">selected</c:if>
                                            >${r.course.name}</option>
                                </a>
                            </c:forEach>
                        </select>
                    </form>
                </div>
            </div>
            <div class="col-md-4 left-column">
                <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                    <div class="iq-card-header d-flex justify-content-between align-items-center">
                        <div class="iq-header-title">
                            <h4 class="card-title mb-0">Course Material</h4>
                        </div>
                    </div>
                    <div class="iq-card-body">
                        <div class="list-group">
                            <!--<button type="button" class="list-group-item list-group-item-action chapter-button">adasd</button>-->
                            <c:forEach items="${chapters}" var="c">
                                <button type="button" class="list-group-item list-group-item-action chapter-button"><i class="fa fa-angle-double-down"></i> ${c.chapterName}</button>
                                <ul class="list-group list-group-flush lessons-list" style="display: none;">
                                    <c:forEach items="${c.lessons}" var="l">
                                        <a href="classdashboard?courseId=${r.course.course_id}&chapterId=${c.chapterId}&lessonId=${l.lessonId}">
                                            <li class="list-group-item lesson-item">${l.lessonName}</li>
                                        </a>
                                    </c:forEach>
                                </ul>
                            </c:forEach>
                            <!--                            <button type="button" class="list-group-item list-group-item-action active" aria-current="true">
                                                            The current button
                                                        </button>
                                                        <button type="button" class="list-group-item list-group-item-action">A second item</button>-->
                            <button type="button" onclick="displayAssign()" class="btn btn-success " style="margin-top: 15em">Assignment</button>

                        </div>
                    </div>
                </div>
            </div>
            <script>
                function displayAssign() {
                    document.getElementById("blk1").style.display = 'none';
                    document.getElementById("blk2").style.display = 'block';

                }
            </script>
            <div id="blk1" class="col-md-8 right-column">
                <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                    <div class="iq-card-header d-flex justify-content-between">
                        <div class="iq-header-title">
                            <h4 class="card-title">${lesson.lessonName}</h4>
                        </div>
                    </div>
                    <div class="iq-card-body">
                        <div class="iq-header-title">
                            <iframe style="width: 100%; height: 40vh " src="https://www.youtube.com/embed/${lesson.lessonVideo}" frameborder="0" allowfullscreen></iframe>
                        </div>
                    </div>
                </div>
            </div>

            <div id="blk2" style="display: none" class="col-md-8 right-column">
                <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                    <div class="iq-card-header d-flex justify-content-between">
                        <div class="iq-header-title">
                            <h4>Assignment of ${lesson.lessonName} </h4>
                        </div>
                    </div>
                    <div class="iq-card-body">
                        <c:forEach items="${al}" var="a">
                            <h5>${a.assignmentName}  <span style="font-weight: 100; font-size: 13px;margin-left: 10px">Due Date: ${a.dueDate}</span></h5>
                            <p style="color: black"><b>Content:</b>${a.description}</p>
                            <!--<a href="assignmentSubmission?assignment_id=${a.assignmentId}" class="btn btn-success " >Add submission</a>-->
                            <form action="assignmentSubmission" method="post" enctype="multipart/form-data">
                                <label for="assignmentFile">Upload Assignment (PDF, DOCX, or TXT):</label>
                                <input type="file" name="file" id="file-input" accept=".pdf, .docx, .txt" required>
                                <label for="file-input" id="file-label">Choose a file...</label>

                                <label for="comments">Additional Comments:</label>
                                <textarea id="comments" name="comments" rows="4"></textarea>
                                <input name="assignment_id" value="${a.getAssignmentId()}" style="display: none"/>
                                <input type="submit" value="Submit Assignment">
                                <h3>${is_submited_oke}</h3>
                            </form>
                        </c:forEach>
                    </div>
                </div>
            </div>

        </div>
    </div>
  <script>
    document.getElementById('file-input').addEventListener('change', function() {
      var fileInput = document.getElementById('file-input');
      var fileLabel = document.getElementById('file-label');

      // Display the selected file name
      fileLabel.innerText = 'Selected file: ' + fileInput.files[0].name;
    });
  </script>
    <!-- Add your additional HTML content here -->

    <!-- Add your JS scripts here -->
    <script src="./admin/js/charts.js"></script>
    <!-- Apexcharts JavaScript -->
    <script src="./admin/js/apexcharts.js"></script>
    <!-- Chart Custom JavaScript -->
    <script src="./admin/js/chart-custom.js"></script>
    <script>
                function submitForm() {
                    document.getElementById('courseForm').submit();
                }
    </script>
    <script>
        $(document).ready(function () {
            // Add click event to chapter buttons
            $('.chapter-button').click(function () {
                // Get the associated lessons list
                var lessonsList = $(this).next('.lessons-list');

                // Toggle the display of lessons list
                lessonsList.slideToggle();

                // Disable other lessons lists
                $('.lessons-list').not(lessonsList).slideUp();
            });

            // Add click event to lesson items
            $('.lesson-item').click(function () {
                // Your logic when a lesson item is clicked
                // For now, I'll just log the lesson name to the console
                var lessonName = $(this).text();
                console.log('Lesson clicked:', lessonName);
            });
        });
    </script>
</body>
</html>

