<%-- 
    Document   : userDashboard
    Created on : Dec 14, 2023, 8:17:12 PM
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

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="sweetalert2.min.js"></script>
    <link rel="stylesheet" href="sweetalert2.min.css">
    <script src="sweetalert2.all.min.js"></script>
</head>
<body>
    <h1 style="text-align: center">Welcome to Dashboard</h1>


    <!-- Sidebar  -->
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light bg-light mx-auto">
            <a class="navbar-brand" href="#">LMS</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <a class="nav-item nav-link" href="#">Home</a>
                    <a class="nav-item nav-link active" href="#">Dashboard<span class="sr-only">(current)</span></a>
                    <a class="nav-item nav-link" href="#">Blog</a>
                    <a class="nav-item nav-link" href="#">My Class</a>
                </div>
            </div>
        </nav>
        <div class="row">
            <div class="col-md-6 col-lg-3">
                <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                    <div class="iq-card-body">
                        <div class="d-flex align-items-center">
                            <div class="rounded-circle iq-card-icon bg-danger"><i class="ri-book-line"></i></div>
                            <div class="text-left ml-3">                                 
                                <h2 class="mb-0"><span class="counter">${totalClass}</span></h2>
                                <h5 class="">Classes</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-3">
                <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                    <div class="iq-card-body">
                        <div class="d-flex align-items-center">
                            <div class="rounded-circle iq-card-icon bg-warning"><i class="ri-shopping-cart-2-line"></i></div>
                            <div class="text-left ml-3">                                 
                                <h2 class="mb-0"><span class="counter">${totalBlogs}/${totalAllBlogs}</span></h2>
                                <h5 class="">Blogs</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-3">
                <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                    <div class="iq-card-body">
                        <div class="d-flex align-items-center">
                            <div class="rounded-circle iq-card-icon bg-info"><i class="ri-radar-line"></i></div>
                            <div class="text-left ml-3">                                 
                                <h2 class="mb-0"><span class="counter">${totalContact}</span></h2>
                                <h5 class="">Contacts</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                    <div class="iq-card-header d-flex justify-content-between align-items-center">
                        <div class="iq-header-title">
                            <h4 class="card-title mb-0">Chart</h4>
                        </div>
                    </div>
                    <div class="iq-card-body">
                        <div id="iq-sale-chart">
                            <canvas id="blogChart" width="800" height="400"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                    <div class="iq-card-header d-flex justify-content-between">
                        <div class="iq-header-title">
                            <h4 class="card-title">My Learning</h4>
                        </div>
                        <div class="iq-card-header-toolbar d-flex align-items-center">
                            <div class="dropdown">
                                <span class="dropdown-toggle text-primary" id="dropdownMenuButton5" data-toggle="dropdown">
                                    <i class="ri-more-fill"></i>
                                </span>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton5">
                                    <a class="dropdown-item" href="#"><i class="ri-eye-fill mr-2"></i>View</a>
                                    <a class="dropdown-item" href="#"><i class="ri-delete-bin-6-fill mr-2"></i>Delete</a>
                                    <a class="dropdown-item" href="#"><i class="ri-pencil-fill mr-2"></i>Edit</a>
                                    <a class="dropdown-item" href="#"><i class="ri-printer-fill mr-2"></i>Print</a>
                                    <a class="dropdown-item" href="#"><i class="ri-file-download-fill mr-2"></i>Download</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="iq-card-body">
                        <div class="table-responsive">
                            <table class="table mb-0 table-borderless">
                                <thead>
                                    <tr>
                                        <th scope="col">No</th>
                                        <th scope="col">Name</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${registrations}" var="r" varStatus="loop">
                                        <tr>
                                            <td>${loop.index + 1}</td>
                                            <td><a href="classdashboard?courseId=${r.course.id}">${r.course.name}</a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>                   
        </div>
    </div>

    <!-- Add your additional HTML content here -->

    <!-- Add your JS scripts here -->
    <script src="./admin/js/charts.js"></script>
    <!-- Apexcharts JavaScript -->
    <script src="./admin/js/apexcharts.js"></script>
    <!-- Chart Custom JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="./admin/js/chart-custom.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // Replace 'userData' and 'totalBlogs' with your actual data
            var userData = ${totalBlogs};  // Number of blogs by the user
            var totalBlogs = ${totalAllBlogs};  // Total number of blogs

            var ctx = document.getElementById('blogChart').getContext('2d');

            var myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ['User Blogs', 'All Blogs'],
                    datasets: [{
                            label: 'Number of Blogs',
                            data: [userData, totalBlogs - userData],
                            backgroundColor: [
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(255, 99, 132, 0.2)',
                            ],
                            borderColor: [
                                'rgba(75, 192, 192, 1)',
                                'rgba(255, 99, 132, 1)',
                            ],
                            borderWidth: 1
                        }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        }); 
    </script>
</body>
</html>
