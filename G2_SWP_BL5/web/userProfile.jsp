<!doctype html>
<html lang="en">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- Mirrored from templates.iqonic.design/booksto/html/profile-edit.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:19:33 GMT -->
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Booksto - Responsive Bootstrap 4 Admin Dashboard Template</title>
        <!-- Favicon -->
        <link rel="shortcut icon" href="images/favicon.ico" />
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="admin/css/bootstrap.min.css">
        <!-- Typography CSS -->
        <link rel="stylesheet" href="admin/css/typography.css">
        <!-- Style CSS -->
        <link rel="stylesheet" href="admin/css/style.css">
        <!-- Responsive CSS -->
        <link rel="stylesheet" href="admin/css/responsive.css">
    </head>
    <body class="sidebar-main-active right-column-fixed">
        <!-- loader Start -->
        <div id="loading">
            <div id="loading-center">
            </div>
        </div>
        <!-- loader END -->
        <!-- Wrapper Start -->
        <div class="wrapper">

            <!-- TOP Nav Bar -->

            <div id="content-page" class="content-page">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="iq-card">
                                <div class="iq-card-body p-0">
                                    <div class="iq-edit-list">
                                        <ul class="iq-edit-profile d-flex nav nav-pills">
                                            <li class="col-md-3 p-0">
                                                <a class="nav-link active" data-toggle="pill" href="#personal-information">
                                                    Personal Information
                                                </a>
                                            </li>
                                            <li class="col-md-3 p-0">
                                                <a class="nav-link" data-toggle="pill" href="#chang-pwd">
                                                    Change Password
                                                </a>
                                            </li>


                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="iq-edit-list-data">
                                <div class="tab-content">
                                    <div class="tab-pane fade active show" id="personal-information" role="tabpanel">
                                        <div class="iq-card">
                                            <div class="iq-card-header d-flex justify-content-between">
                                                <div class="iq-header-title">
                                                    <h4 class="card-title">Personal Information</h4>
                                                </div>
                                            </div>
                                            <div class="iq-card-body">
                                                <form action="editProfile" method="post" id="formInfo">
                                                    <div class="form-group row align-items-center">
                                                        <div class="col-md-12">
                                                            <div class="profile-img-edit">
                                                                <img class="profile-pic" src="${user.avatar==null?"https://static.vecteezy.com/system/resources/thumbnails/001/840/618/small/picture-profile-icon-male-icon-human-or-people-sign-and-symbol-free-vector.jpg":user.avatar}" alt="profile-pic" id="imgShow">
                                                                <div class="p-image">
                                                                    <i class="ri-pencil-line upload-button"></i>

                                                                    <input class="file-upload" id="img" name="imageSrc" onchange="changeimg()" type="file" >
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <input type="hidden" id="imageSrc" name="imageSrc" value="${user.getAvatar()}">

                                                    <div class=" row align-items-center">
                                                        <div class="form-group col-sm-6">
                                                            <label for="lname">Name:</label>
                                                            <input type="text" class="form-control" name="fullName" value="${user.getFullName()}">
                                                        </div>

                                                        <div class="form-group col-sm-6">
                                                            <label for="uname">Email</label>
                                                            <input type="text" readonly class="form-control" name="email" value="${user.getEmail()}">
                                                        </div>

                                                        <div class="form-group col-sm-6">
                                                            <label for="uname">Phone</label>
                                                            <input type="number"  class="form-control"  value="${user.getPhone()}" name="phone" pattern="[0-9]{10}" placeholder="e.g., 1234567890">
                                                        </div>



                                                        <div class="form-group col-sm-6">


                                                            <label class="d-block">Gender:</label>


                                                            <c:if test="${user.getGender() }">
                                                                <div class="custom-control custom-radio custom-control-inline">
                                                                    <input type="radio" id="customRadio6" name="gender" class="custom-control-input" value="true" checked="">
                                                                    <label class="custom-control-label" for="customRadio6"> Male </label>
                                                                </div>

                                                                <div class="custom-control custom-radio custom-control-inline">
                                                                    <input type="radio" id="customRadio7" name="gender" value="false" class="custom-control-input">
                                                                    <label class="custom-control-label" for="customRadio7"> Female </label>
                                                                </div>
                                                            </c:if>
                                                            <c:if test="${!user.getGender() }">
                                                                <div class="custom-control custom-radio custom-control-inline">
                                                                    <input type="radio" id="customRadio6" name="gender" class="custom-control-input" value="true" >
                                                                    <label class="custom-control-label" for="customRadio6"> Male </label>
                                                                </div>

                                                                <div class="custom-control custom-radio custom-control-inline">
                                                                    <input type="radio" id="customRadio7" name="gender" value="false" checked class="custom-control-input">
                                                                    <label class="custom-control-label" for="customRadio7"> Female </label>
                                                                </div>
                                                            </c:if>
                                                        </div>








                                                    </div>
                                                    <a onclick="confirmLock(${user.userID})" class="btn btn-danger" style="color: #fff" >Lock User</a>
                                                    <button type="submit" class="btn btn-primary mr-2" onclick="submitFormÌnfo(event)">Submit</button>
                                                    <button type="reset" class="btn iq-bg-danger">Cancel</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="chang-pwd" role="tabpanel">
                                        <div class="iq-card">
                                            <div class="iq-card-header d-flex justify-content-between">
                                                <div class="iq-header-title">
                                                    <h4 class="card-title">Change Password</h4>
                                                </div>
                                            </div>
                                            <div class="iq-card-body">
                                                <form id="changePasswordForm" action="changepassword" method="post">
                                                    <div class="form-group">
                                                        <label for="cpass">Current Password:</label>
                                                        <a href="./forgotPassword.jsp" class="float-right">Forgot Password</a>
                                                        <input type="password" name="oldpass" class="form-control" id="cpass">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="npass">New Password:</label>
                                                        <input type="password" name="newpass" class="form-control" id="npass">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="vpass">Verify Password:</label>
                                                        <input type="password" name="renewpass" class="form-control" id="vpass">
                                                    </div>

                                                    <button type="button" onclick="submitForm()" class="btn btn-primary mr-2">Submit</button>
                                                    <button type="reset" class="btn iq-bg-danger">Cancel</button>
                                                    <div class="notice-message">
                                                        <h1>${status}</h1>
                                                        <h1>${errorMessage}</h1>
                                                    </div>
                                                </form>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="emailandsms" role="tabpanel">
                                        <div class="iq-card">
                                            <div class="iq-card-header d-flex justify-content-between">
                                                <div class="iq-header-title">
                                                    <h4 class="card-title">Email and SMS</h4>
                                                </div>
                                            </div>
                                            <div class="iq-card-body">
                                                <form>
                                                    <div class="form-group row align-items-center">
                                                        <label class="col-8 col-md-3" for="emailnotification">Email Notification:</label>
                                                        <div class="col-4 col-md-9 custom-control custom-switch">
                                                            <input type="checkbox" class="custom-control-input" id="emailnotification" checked="">
                                                            <label class="custom-control-label" for="emailnotification"></label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row align-items-center">
                                                        <label class="col-8 col-md-3" for="smsnotification">SMS Notification:</label>
                                                        <div class="col-4 col-md-9 custom-control custom-switch">
                                                            <input type="checkbox" class="custom-control-input" id="smsnotification" checked="">
                                                            <label class="custom-control-label" for="smsnotification"></label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row align-items-center">
                                                        <label class="col-md-3" for="npass">When To Email</label>
                                                        <div class="col-md-9">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="email01">
                                                                <label class="custom-control-label" for="email01">You have new notifications.</label>
                                                            </div>
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="email02">
                                                                <label class="custom-control-label" for="email02">You're sent a direct message</label>
                                                            </div>
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="email03" checked="">
                                                                <label class="custom-control-label" for="email03">Someone adds you as a connection</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row align-items-center">
                                                        <label class="col-md-3" for="npass">When To Escalate Emails</label>
                                                        <div class="col-md-9">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="email04">
                                                                <label class="custom-control-label" for="email04"> Upon new order.</label>
                                                            </div>
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="email05">
                                                                <label class="custom-control-label" for="email05"> New membership approval</label>
                                                            </div>
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="email06" checked="">
                                                                <label class="custom-control-label" for="email06"> Member registration</label>
                                                                <input type="checkbox" class="custom-control-input" id="email06" checked="">
                                                                <label class="custom-control-label" for="emai
                                                                       </div>
                                                                       </div>
                                                                       </div>
                                                                       <button type="submit" class="btn btn-primary mr-2">Submit</button>
                                                                    <button type="reset" class="btn iq-bg-danger">Cancel</button>
                                                                    </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="tab-pane fade" id="manage-contact" role="tabpanel">
                                                        <div class="iq-card">
                                                            <div class="iq-card-header d-flex justify-content-between">
                                                                <div class="iq-header-title">
                                                                    <h4 class="card-title">Manage Contact</h4>
                                                                </div>
                                                            </div>
                                                            <div class="iq-card-body">
                                                                <form>
                                                                    <div class="form-group">
                                                                        <label fber:</label>or="cno">Contact Number:</label>
                                                                        <input type="text" class="form-control" id="cno" value="001 2536 123 458">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="email">Email:</label>
                                                                        <input type="text" class="form-control" id="email" value="Barryjone@demo.com">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="url">Url:</label>
                                                                        <input type="text" class="form-control" id="url" value="https://getbootstrap.com/">
                                                                    </div>
                                                                    <button type="submit" class="btn btn-primary mr-2">Submit</button>
                                                                    <button type="reset" class="btn iq-bg-danger">Cancel</button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                            </div>
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
                    <script src="admin/js/jquery.min.js"></script>
                    <script src="admin/js/popper.min.js"></script>
                    <script src="admin/js/bootstrap.min.js"></script>
                    <!-- Appear JavaScript -->
                    <script src="admin/js/jquery.appear.js"></script>
                    <!-- Countdown JavaScript -->
                    <script src="admin/js/countdown.min.js"></script>
                    <!-- Counterup JavaScript -->
                    <script src="admin/js/waypoints.min.js"></script>
                    <script src="admin/js/jquery.counterup.min.js"></script>
                    <!-- Wow JavaScript -->
                    <script src="admin/js/wow.min.js"></script>
                    <!-- Apexcharts JavaScript -->
                    <script src="admin/js/apexcharts.js"></script>
                    <!-- Slick JavaScript -->
                    <script src="admin/js/slick.min.js"></script>
                    <!-- Select2 JavaScript -->
                    <script src="admin/js/select2.min.js"></script>
                    <!-- Owl Carousel JavaScript -->
                    <script src="admin/js/owl.carousel.min.js"></script>
                    <!-- Magnific Popup JavaScript -->
                    <script src="admin/js/jquery.magnific-popup.min.js"></script>
                    <!-- Smooth Scrollbar JavaScript -->
                    <script src="admin/js/smooth-scrollbar.js"></script>
                    <!-- lottie JavaScript -->
                    <script src="admin/js/lottie.js"></script>
                    <!-- am core JavaScript -->
                    <script src="admin/js/core.js"></script>
                    <!-- am charts JavaScript -->
                    <script src="admin/js/charts.js"></script>
                    <!-- am animated JavaScript -->
                    <script src="admin/js/animated.js"></script>
                    <!-- am kelly JavaScript -->
                    <script src="admin/js/kelly.js"></script>
                    <!-- am maps JavaScript -->
                    <script src="admin/js/maps.js"></script>
                    <!-- am worldLow JavaScript -->
                    <script src="admin/js/worldLow.js"></script>
                    <!-- Style Customizer -->
                    <script src="admin/js/style-customizer.js"></script>
                    <!-- Chart Custom JavaScript -->
                    <script src="admin/js/chart-custom.js"></script>
                    <!-- Custom JavaScript -->
                    <script src="admin/js/custom.js"></script>
                    <script>
        function confirmLock(x) {
            let text = "Are your sure to lock your account";
            if (confirm(text) == true) {
                window.location = "lockUser?uid=" + x;
            } else {

            }
        }
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
        function submitForm() {
            var formData = $("#changePasswordForm").serialize();
            console.log(13231, formData)
            $.ajax({
                type: "POST",
                url: "changepassword",
                data: formData,
                dataType: "html",
                success: function (response) {
                    $("#changePasswordForm").replaceWith($(response).find('#changePasswordForm'));


                },
                error: function (error) {
                    console.error(error);

                    $(".notice-message").html("<h1>Error changing password!</h1>");
                }
            });
        }

        function submitFormÌnfo(e) {
            e.preventDefault();
            var imageSrc = document.getElementById('imgShow').getAttribute('src');
            document.getElementById('imageSrc').value = imageSrc;
            document.getElementById('formInfo').submit();
        }
                    </script>
                    </body>

                    <!-- Mirrored from templates.iqonic.design/booksto/html/profile-edit.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 28 Sep 2023 14:19:34 GMT -->
                    </html>