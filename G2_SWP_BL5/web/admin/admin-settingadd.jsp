

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Model.Setting" %>
<%@ page import="Model.ContactType" %>
<!doctype html>

<!-- Mirrored from templates.iqonic.design/booksto/html/user-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:19:34 GMT -->
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Settings Management</title>
    <!-- Favicon -->
    <link rel="shortcut icon" href="images/favicon.icon" />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="admin/css/bootstrap.min.css">
    <!-- Typography CSS -->
    <link rel="stylesheet" href="admin/css/typography.css">
    <!-- Style CSS -->
    <link rel="stylesheet" href="admin/css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="admin/css/responsive.css">
    <link rel="shortcut icon" href="images/favicon.ico" />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Typography CSS -->
    <link rel="stylesheet" href="css/typography.css">
    <!-- Style CSS -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="sweetalert2.min.js"></script>
    <link rel="stylesheet" href="sweetalert2.min.css">
    <script src="sweetalert2.all.min.js"></script>
</head>
<body>

    <!-- loader END -->
    <!-- Wrapper Start -->
    <div class="wrapper">
        <!-- Sidebar  -->
        <div class="iq-sidebar">
            <div class="iq-sidebar-logo d-flex justify-content-between">
                <a href="index.html" class="header-logo">
                    <img src="images/logo.png" class="img-fluid rounded-normal" alt="">
                    <div class="logo-title">
                        <span class="text-primary text-uppercase">LMS</span>
                    </div>
                </a>
                <div class="iq-menu-bt-sidebar">
                    <div class="iq-menu-bt align-self-center">
                        <div class="wrapper-menu">
                            <div class="main-circle"><i class="las la-bars"></i></div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="sidebar-scrollbar">
                <nav class="iq-sidebar-menu">
                    <ul id="iq-sidebar-toggle" class="iq-menu">

                        <li>
                            <a href="#admin" class="iq-waves-effect" data-toggle="collapse" aria-expanded="false"><span class="ripple rippleEffect"></span><i class="ri-admin-line"></i><span>Admin</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                            <ul id="admin" class="iq-submenu collapse" data-parent="#iq-sidebar-toggle">
                                <li><a href="admin-dashboard.html"><i class="ri-dashboard-line"></i>Dashboard</a></li>
                                <li><a href="admin-category.html"><i class="ri-list-check-2"></i>Category Lists</a></li>
                                <li><a href="admin-author.html"><i class="ri-file-user-line"></i>Author</a></li>
                                <li><a href="admin-books.html"><i class="ri-book-2-line"></i>Books</a></li>
                            </ul>
                        </li>

                        <li><a href="userList" style="text-decoration: none"><i class="las la-user-tie iq-arrow-left"></i>Manage User</a></li>

                        <li>
                            <a href="#dashboard" class="iq-waves-effect" data-toggle="collapse" aria-expanded="false"><span class="ripple rippleEffect"></span><i class="las la-home iq-arrow-left"></i><span>Shop</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                            <ul id="dashboard" class="iq-submenu collapse" data-parent="#iq-sidebar-toggle">
                                <li><a href="index.html"><i class="las la-house-damage"></i>Home Page</a></li>
                                <li><a href="category.html"><i class="ri-function-line"></i>Category Page</a></li>
                                <li><a href="book-page.html"><i class="ri-book-line"></i>Book Page</a></li>
                                <li><a href="book-pdf.html"><i class="ri-file-pdf-line"></i>Book PDF</a></li>
                                <li><a href="Checkout.html"><i class="ri-checkbox-multiple-blank-line"></i>Checkout</a></li>
                                <li><a href="wishlist.html"><i class="ri-heart-line"></i>wishlist</a></li>
                            </ul>
<ul>
        <li>
            <a href="settingsList" class="iq-waves-effect"><span class="ripple rippleEffect"></span><i class="fa fa-address-book-o" aria-hidden="true"></i><span>Manage Settings</span></a>
        </li>
        <li>
            <a href="managecontact" class="iq-waves-effect"><span class="ripple rippleEffect"></span><i class="fa fa-address-book-o" aria-hidden="true"></i><span>Contact</span></a>
        </li>
        <li>
            <a href="pagePermission" class="iq-waves-effect"><span class="ripple rippleEffect"></span><i class="fa fa-address-book-o" aria-hidden="true"></i><span>Permission</span></a>
        </li>
        <li class="active">
            <a href="assignmentList" class="iq-waves-effect"><span class="ripple rippleEffect"></span><i class="fa fa-address-book-o" aria-hidden="true"></i><span>Assignment List</span></a>
        </li>
    </ul>
                        </div>
                        </div>
                        <!-- TOP Nav Bar -->
                        <div class="iq-top-navbar">
                            <div class="iq-navbar-custom">
                                <nav class="navbar navbar-expand-lg navbar-light p-0">
                                    <div class="iq-menu-bt d-flex align-items-center">
                                        <div class="wrapper-menu">
                                            <div class="main-circle"><i class="las la-bars"></i></div>
                                        </div>
                                        <div class="iq-navbar-logo d-flex justify-content-between">
                                            <a href="index.html" class="header-logo">
                                                <img src="images/logo.png" class="img-fluid rounded-normal" alt="">
                                                <div class="logo-title">
                                                    <span class="text-primary text-uppercase">LMS</span>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="navbar-breadcrumb">
                                        <h5 class="mb-0">Setting Management</h5>
                                        <nav aria-label="breadcrumb">
                                            <ul class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">Setting Management</li>
                                            </ul>
                                        </nav>
                                    </div>
                                    <div class="iq-search-bar">
                                        <form action="#" class="searchbox">
                                            <input type="text" class="text search-input" placeholder="Search Here...">
                                            <a class="search-link" href="#"><i class="ri-search-line"></i></a>
                                        </form>
                                    </div>
                                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"  aria-label="Toggle navigation">
                                        <i class="ri-menu-3-line"></i>
                                    </button>
                                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                        <ul class="navbar-nav ml-auto navbar-list">
                                            <li class="nav-item nav-icon search-content">
                                                <a href="#" class="search-toggle iq-waves-effect text-gray rounded">
                                                    <i class="ri-search-line"></i>
                                                </a>
                                                <form action="#" class="search-box p-0">
                                                    <input type="text" class="text search-input" placeholder="Type here to search...">
                                                    <a class="search-link" href="#"><i class="ri-search-line"></i></a>
                                                </form>
                                            </li>
                                            <li class="nav-item nav-icon">
                                                <a href="#" class="search-toggle iq-waves-effect text-gray rounded">
                                                    <i class="ri-notification-2-fill"></i>
                                                    <span class="bg-primary dots"></span>
                                                </a>
                                                <div class="iq-sub-dropdown">
                                                    <div class="iq-card shadow-none m-0">
                                                        <div class="iq-card-body p-0">
                                                            <div class="bg-primary p-3">
                                                                <h5 class="mb-0 text-white">All Notifications<small class="badge  badge-light float-right pt-1">4</small></h5>
                                                            </div>
                                                            <a href="#" class="iq-sub-card" >
                                                                <div class="media align-items-center">
                                                                    <div class="">
                                                                        <img class="avatar-40 rounded" src="images/user/01.jpg" alt="">
                                                                    </div>
                                                                    <div class="media-body ml-3">
                                                                        <h6 class="mb-0 ">Emma Watson Barry</h6>
                                                                        <small class="float-right font-size-12">Just Now</small>
                                                                        <p class="mb-0">95 MB</p>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="nav-item nav-icon dropdown">
                                                <a href="#" class="search-toggle iq-waves-effect text-gray rounded">
                                                    <i class="fa fa-envelope" aria-hidden="true"></i>
                                                    <span class="bg-primary count-mail"></span>
                                                </a>
                                                <div class="iq-sub-dropdown">
                                                    <div class="iq-card shadow-none m-0">
                                                        <div class="iq-card-body p-0 ">
                                                            <div class="bg-primary p-3">
                                                                <h5 class="mb-0 text-white">All Messages<small class="badge  badge-light float-right pt-1">5</small></h5>
                                                            </div>
                                                            <a href="#" class="iq-sub-card">
                                                                <div class="media align-items-center">
                                                                    <div class="">
                                                                        <img class="avatar-40 rounded" src="images/user/04.jpg" alt="">
                                                                    </div>
                                                                    <div class="media-body ml-3">
                                                                        <h6 class="mb-0 ">Variations Passages</h6>
                                                                        <small class="float-left font-size-12">12 Sep</small>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                            <a href="#" class="iq-sub-card">
                                                                <div class="media align-items-center">
                                                                    <div class="">
                                                                        <img class="avatar-40 rounded" src="images/user/05.jpg" alt="">
                                                                    </div>
                                                                    <div class="media-body ml-3">
                                                                        <h6 class="mb-0 ">Lorem Ipsum generators</h6>
                                                                        <small class="float-left font-size-12">5 Dec</small>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>

                                            <li class="line-height pt-3">
                                                <a href="#" class="search-toggle iq-waves-effect d-flex align-items-center">
                                                    <img src="images/user/1.jpg" class="img-fluid rounded-circle mr-3" alt="user">
                                                    <div class="caption">
                                                        <h6 class="mb-1 line-height">Barry Tech</h6>
                                                        <p class="mb-0 text-primary">$20.32</p>
                                                    </div>
                                                </a>
                                                <div class="iq-sub-dropdown iq-user-dropdown">
                                                    <div class="iq-card shadow-none m-0">
                                                        <div class="iq-card-body p-0 ">
                                                            <div class="bg-primary p-3">
                                                                <h5 class="mb-0 text-white line-height">Hello Barry Tech</h5>
                                                                <span class="text-white font-size-12">Available</span>
                                                            </div>
                                                            <a href="profile.html" class="iq-sub-card iq-bg-primary-hover">
                                                                <div class="media align-items-center">
                                                                    <div class="rounded iq-card-icon iq-bg-primary">
                                                                        <i class="ri-file-user-line"></i>
                                                                    </div>
                                                                    <div class="media-body ml-3">
                                                                        <h6 class="mb-0 ">My Profile</h6>
                                                                        <p class="mb-0 font-size-12">View personal profile details.</p>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                            <a href="profile-edit.html" class="iq-sub-card iq-bg-primary-hover">
                                                                <div class="media align-items-center">
                                                                    <div class="rounded iq-card-icon iq-bg-primary">
                                                                        <i class="ri-profile-line"></i>
                                                                    </div>
                                                                    <div class="media-body ml-3">
                                                                        <h6 class="mb-0 ">Edit Profile</h6>
                                                                        <p class="mb-0 font-size-12">Modify your personal details.</p>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                            <a href="account-setting.html" class="iq-sub-card iq-bg-primary-hover">
                                                                <div class="media align-items-center">
                                                                    <div class="rounded iq-card-icon iq-bg-primary">
                                                                        <i class="ri-account-box-line"></i>
                                                                    </div>
                                                                    <div class="media-body ml-3">
                                                                        <h6 class="mb-0 ">Account settings</h6>
                                                                        <p class="mb-0 font-size-12">Manage your account parameters.</p>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                            <a href="privacy-setting.html" class="iq-sub-card iq-bg-primary-hover">
                                                                <div class="media align-items-center">
                                                                    <div class="rounded iq-card-icon iq-bg-primary">
                                                                        <i class="ri-lock-line"></i>
                                                                    </div>
                                                                    <div class="media-body ml-3">
                                                                        <h6 class="mb-0 ">Privacy Settings</h6>
                                                                        <p class="mb-0 font-size-12">Control your privacy parameters.</p>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                            <div class="d-inline-block w-100 text-center p-3">
                                                                <a class="bg-primary iq-sign-btn" href="sign-in.html" role="button">Sign out<i class="ri-login-box-line ml-2"></i></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </nav>
                            </div>
                        </div>
                        <!-- TOP Nav Bar END -->

                        <!-- Page Content  -->
                        <div id="content-page" class="content-page">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="iq-card">
                                            <div class="iq-card-header d-flex justify-content-between">
                                                <div class="iq-header-title">
                                                    <h4 class="card-title">Setting Add</h4>
                                                </div>
                                            </div>
                                            <form method="post" action="settingadd">
                                                <div class="iq-card-body">
                                                    <div class="table-responsive">
                                                        <div class="row justify-content-between">
                                                            <div class="col-sm-12 col-md-6">
                                                                <div id="user_list_datatable_info" class="dataTables_filter">
                                                                </div>
                                                            </div>

                                                        </div>

                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="col-md-12">
                                                                    <div>
                                                                        <label>Name:</label>
                                                                    </div>
                                                                    <div>
                                                                        <input class="form-control" style="width: 100%" type="text" name="name" 
                                                                               value="${setting.name}"/>
                                                                    </div>
                                                                    <div>
                                                                        <label>Type:</label>
                                                                    </div>
                                                                    <div>
                                                                        <select name="type">
                                                                            <c:forEach items="${settingTypes}" var="st">
                                                                                <option value="${st.id}">${st.name}</option>
                                                                            </c:forEach>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="col-md-12">
                                                                    <div>
                                                                        <label>Mapped Values</label>
                                                                    </div>
                                                                    <div>
                                                                        <input class="form-control" style="width: 100%" type="text" name="mapped_values"
                                                                               value="${setting.mapped_values}"/>
                                                                    </div>

                                                                    <div>
                                                                        <label>Display Order:</label>
                                                                    </div>
                                                                    <div>
                                                                        <input class="form-control" style="width: 100%" type="text" name="order"
                                                                               value="${setting.order}"/>
                                                                    </div>

                                                                    <div>
                                                                        <label>Status</label>
                                                                    </div>
                                                                    <div>
                                                                        <select name="status">
                                                                            <option value="1" <c:if test="${setting.status eq true}">selected=""</c:if>>Active</option>
                                                                            <option value="0" <c:if test="${setting.status eq false}">selected=""</c:if>>Deactive</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="col-md-12">
                                                                        <div>
                                                                            <label>Description</label>
                                                                        </div>
                                                                        <div>
                                                                            <textarea class="form-control" id="exampleFormControlTextarea1" class="description" rows="5" name="description">${setting.description}</textarea>
                                                                    </div>
                                                                    <input type="hidden" name="id" value="${setting.id}">
                                                                    <div class="modal-footer">
                                                                        <button class="btn btn-success">Add Setting</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row justify-content-between mt-3">
                                                        <div id="user-list-page-info" class="col-md-6">
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>
                        <!-- Wrapper END -->
                        <!-- Footer -->
                        <footer class="iq-footer">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <ul class="list-inline mb-0">
                                            <li class="list-inline-item"><a href="privacy-policy.html">Privacy Policy</a></li>
                                            <li class="list-inline-item"><a href="terms-of-service.html">Terms of Use</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-lg-6 text-right">
                                        Copyright 2020 <a href="#">Booksto</a> All Rights Reserved.
                                    </div>
                                </div>
                            </div>
                        </footer>
                        <!-- Footer END -->
                        <!-- color-customizer -->
                        <div class="iq-colorbox color-fix">
                            <div class="buy-button"> <a class="color-full" href="#"><i class="fa fa-spinner fa-spin"></i></a> </div>
                            <div class="clearfix color-picker">
                                <h3 class="iq-font-black">Booksto Awesome Color</h3>
                                <p>This color combo available inside whole template. You can change on your wish, Even you can create your own with limitless possibilities! </p>
                                <ul class="iq-colorselect clearfix">
                                    <li class="color-1 iq-colormark" data-style="color-1"></li>
                                    <li class="color-2" data-style="iq-color-2"></li>
                                    <li class="color-3" data-style="iq-color-3"></li>
                                    <li class="color-4" data-style="iq-color-4"></li>
                                    <li class="color-5" data-style="iq-color-5"></li>
                                    <li class="color-6" data-style="iq-color-6"></li>
                                    <li class="color-7" data-style="iq-color-7"></li>
                                    <li class="color-8" data-style="iq-color-8"></li>
                                    <li class="color-9" data-style="iq-color-9"></li>
                                    <li class="color-10" data-style="iq-color-10"></li>
                                    <li class="color-11" data-style="iq-color-11"></li>
                                    <li class="color-12" data-style="iq-color-12"></li>
                                    <li class="color-13" data-style="iq-color-13"></li>
                                    <li class="color-14" data-style="iq-color-14"></li>
                                    <li class="color-15" data-style="iq-color-15"></li>
                                    <li class="color-16" data-style="iq-color-16"></li>
                                    <li class="color-17" data-style="iq-color-17"></li>
                                    <li class="color-18" data-style="iq-color-18"></li>
                                    <li class="color-19" data-style="iq-color-19"></li>
                                    <li class="color-20" data-style="iq-color-20"></li>
                                </ul>
                                <a target="_blank" class="btn btn-primary d-block mt-3" href="#">Purchase Now</a>
                            </div>
                        </div>
                        <!-- color-customizer END -->
                        <!-- Optional JavaScript -->
                        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
                        <script src="js/jquery.min.js"></script>
                        <script src="js/popper.min.js"></script>
                        <script src="js/bootstrap.min.js"></script>
                        <!-- Appear JavaScript -->
                        <script src="js/jquery.appear.js"></script>
                        <!-- Countdown JavaScript -->
                        <script src="js/countdown.min.js"></script>
                        <!-- Counterup JavaScript -->
                        <script src="js/waypoints.min.js"></script>
                        <script src="js/jquery.counterup.min.js"></script>
                        <!-- Wow JavaScript -->
                        <script src="js/wow.min.js"></script>
                        <!-- Apexcharts JavaScript -->
                        <script src="js/apexcharts.js"></script>
                        <!-- Slick JavaScript -->
                        <script src="js/slick.min.js"></script>
                        <!-- Select2 JavaScript -->
                        <script src="js/select2.min.js"></script>
                        <!-- Owl Carousel JavaScript -->
                        <script src="js/owl.carousel.min.js"></script>
                        <!-- Magnific Popup JavaScript -->
                        <script src="js/jquery.magnific-popup.min.js"></script>
                        <!-- Smooth Scrollbar JavaScript -->
                        <script src="js/smooth-scrollbar.js"></script>
                        <!-- lottie JavaScript -->
                        <script src="js/lottie.js"></script>
                        <!-- am core JavaScript -->
                        <script src="js/core.js"></script>
                        <!-- am charts JavaScript -->
                        <script src="js/charts.js"></script>
                        <!-- am animated JavaScript -->
                        <script src="js/animated.js"></script>
                        <!-- am kelly JavaScript -->
                        <script src="js/kelly.js"></script>
                        <!-- am maps JavaScript -->
                        <script src="js/maps.js"></script>
                        <!-- am worldLow JavaScript -->
                        <script src="js/worldLow.js"></script>
                        <!-- Style Customizer -->
                        <script src="js/style-customizer.js"></script>
                        <!-- Chart Custom JavaScript -->
                        <script src="js/chart-custom.js"></script>
                        <!-- Custom JavaScript -->
                        <script src="js/custom.js"></script>
                        <script>
                            $(document).ready(function () {
                                $('a[data-toggle="modal"]').click(function () {
                                    var contactId = $(this).data('contact-id');
                                    $.ajax({
                                        url: 'settingdetail?id=' + contactId,
                                        type: 'GET',
                                        success: function (data) {
                                            $('input[name="name"]').val(data.name);
                                            $('input[name="type"]').val(data.type.role_id);
                                            $('input[name="mapped_values"]').val(data.mapped_values);
                                            $('input[name="order"]').val(data.order);
                                            $('input[name="status"]').val(data.status);
                                            $('textarea#exampleFormControlTextarea1').val(data.description);
                                        },
                                        error: function () {
                                            console.log('Lỗi khi lấy thông tin chi tiết contact');
                                        }
                                    });
                                });
                            });
                        </script>
                        <script>
                            function showConfirmDialog(contactID) {
                                Swal.fire({
                                    title: "Are you sure?",
                                    text: "You won't be able to revert this!",
                                    icon: "warning",
                                    showCancelButton: true,
                                    confirmButtonColor: "#3085d6",
                                    cancelButtonColor: "#d33",
                                    confirmButtonText: "Yes, update it!"
                                }).then((result) => {
                                    if (result.isConfirmed) {
                                        Swal.fire({
                                            title: "Updated!",
                                            text: "Your Setting has been updated status.",
                                            icon: "success"
                                        }).then(() => {
                                            const form = document.createElement('form');
                                            form.method = 'GET';
                                            form.action = 'settingstatus';

                                            const input = document.createElement('input');
                                            input.type = 'hidden';
                                            input.name = 'id';
                                            input.value = contactID;

                                            form.appendChild(input);
                                            document.body.appendChild(form);

                                            form.submit();
                                        });
                                    }
                                });
                            }
                                                                                                        $(document).ready(function () {
            $('li').click(function () {
                // Remove 'active' class from all li elements
                $('li').removeClass('active');

                // Add 'active' class to the clicked li element
                $(this).addClass('active');

                // Hide all content divs
                $('[id^="content-"]').removeClass('active');

                // Show the content div corresponding to the clicked li element
                var contentId = 'content-' + $(this).find('a').attr('href').substring(1);
                $('#' + contentId).addClass('active');
            });
        });
                        </script>
                        </body>

                        <!-- Mirrored from templates.iqonic.design/booksto/html/user-list.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:19:34 GMT -->
                        </html>