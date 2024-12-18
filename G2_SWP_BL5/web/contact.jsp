<%-- 
    Document   : contact
    Created on : 30 Nov 2023, 17:54:47
    Author     : Yen Do
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Course Project">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="styles/contact_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/contact_responsive.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"  crossorigin="anonymous" />
        <!-- Thư viện Toastify.js -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"  crossorigin="anonymous" />
        <script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>


        <title>Course - Contact</title>
    </head>
    <body>
        <div class="super_container">
            <!-- Header -->

            <c:if test="${sessionScope.usersession != null}">
                <header class="header d-flex flex-row" style="height: 78px;">
                    <div class="header_content d-flex flex-row align-items-center">
                        <!-- Logo -->
                        <div class="logo_container">
                            <div class="logo">
                                <img src="images/logo.png" alt="">
                                <span>course</span>
                            </div>
                        </div>

                        <!-- Main Navigation -->
                        <nav class="main_nav_container" style="margin-left: 200px">
                            <div class="main_nav">
                                <ul class="main_nav_list">
                                    <li class="main_nav_item" style="margin-right: 50px;"><a style="font-size: 16px" href="index.jsp">home</a></li>
                                        <c:if test="${sessionScope.usersession != null}">
                                        <li class="main_nav_item" style="margin-right: 50px;"><a style="font-size: 16px" href="courses.jsp">courses</a></li>
                                        <li class="main_nav_item" style="margin-right: 50px;"><a style="font-size: 16px" href="news.jsp">Blog</a></li>
                                        </c:if>
                                    <li class="main_nav_item" style="margin-right: 50px;"><a style="font-size: 16px" href="contact">contact</a></li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                    <div class="header_side d-flex flex-row justify-content-center align-items-center" style="background-color: #ffffff">
                        <div class="main_nav">
                            <ul class="main_nav_list" >
                                <li class="main_nav_item"><a style="font-size: 16px" href="user_profile">User profile</a></li>                                  
                                <li class="main_nav_item"><a style="font-size: 16px" href="login?action=logout">Logout</a></li>
                            </ul>
                        </div>
                    </div>

                    <!-- Hamburger -->
                    <div class="hamburger_container">
                        <i class="fas fa-bars trans_200"></i>
                    </div>

                </header>

            </c:if>
            <c:if test="${sessionScope.usersession == null}">
                <header class="header d-flex flex-row">
                    <div class="header_content d-flex flex-row align-items-center">
                        <!-- Logo -->
                        <div class="logo_container">
                            <div class="logo">
                                <img src="images/logo.png" alt="">
                                <span>course</span>
                            </div>
                        </div>

                        <!-- Main Navigation -->
                        <nav class="main_nav_container" style="margin-left: 200px">
                            <div class="main_nav">
                                <ul class="main_nav_list">
                                    <li class="main_nav_item"><a href="index.jsp">home</a></li>
                                    <li class="main_nav_item"><a href="contact">contact</a></li>
                                    <li class="main_nav_item"><a href="login">login</a></li>
                                    <li class="main_nav_item"><a href="register">register</a></li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                    <div class="header_side d-flex flex-row justify-content-center align-items-center">
                        <img src="images/phone-call.svg" alt="">
                        <span>+84 335 226 826</span>
                    </div>

                    <!-- Hamburger -->
                    <div class="hamburger_container">
                        <i class="fas fa-bars trans_200"></i>
                    </div>

                </header>

            </c:if>

            <!-- Menu -->
            <div class="menu_container menu_mm">

                <!-- Menu Close Button -->
                <div class="menu_close_container">
                    <div class="menu_close"></div>
                </div>

                <!-- Menu Items -->
                <div class="menu_inner menu_mm">
                    <div class="menu menu_mm">
                        <ul class="menu_list menu_mm">
                            <li class="menu_item menu_mm"><a href="index.jsp">Home</a></li>
                            <li class="menu_item menu_mm"><a href="courses.jsp">Courses</a></li>
                            <li class="menu_item menu_mm"><a href="news.jsp">Blogs</a></li>
                            <li class="menu_item menu_mm"><a href="contact">Contact</a></li>
                        </ul>

                        <!-- Menu Social -->

                        <div class="menu_social_container menu_mm">
                            <ul class="menu_social menu_mm">
                                <li class="menu_social_item menu_mm"><a href="#"><i class="fab fa-pinterest"></i></a></li>
                                <li class="menu_social_item menu_mm"><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                                <li class="menu_social_item menu_mm"><a href="#"><i class="fab fa-instagram"></i></a></li>
                                <li class="menu_social_item menu_mm"><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                                <li class="menu_social_item menu_mm"><a href="#"><i class="fab fa-twitter"></i></a></li>
                            </ul>
                        </div>

                        <div class="menu_copyright menu_mm"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></div>
                    </div>

                </div>

            </div>
            <!-- Home -->

            <div class="home">
                <div class="home_background_container prlx_parent">
                    <div class="home_background prlx" style="background-image:url(images/contact_background.jpg)"></div>
                </div>
                <div class="home_content">
                    <h1>Contact</h1>
                </div>
            </div>

            <!-- Contact -->

            <div class="contact">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">

                            <!-- Contact Form -->
                            <div class="contact_form">
                                <div class="contact_title">Get in touch</div>
                                <div class="contact_form_container">
                                    <form action="contact" method="POST" id="contactForm">
                                        <div >
                                            <strong>Contact Type: <span style="color: red">(*)</span></strong><br>
                                            <select name="contactType" style="margin-bottom: 0" class="input_field contact_form_name">
                                                <option value="">Select Contact Type</option>
                                                <c:forEach items="${getAllContactType}" var="item">
                                                    <option value="${item.contactTypeID}">${item.name}</option>
                                                </c:forEach>
                                            </select>
                                            <span style="color: red; font-style: italic">${msgContactType} </span><br>
                                        </div>
                                        <strong>Full Name: <span style="color: red">(*)</span></strong><br>
                                        <input style="margin-bottom: 0" id="contact_form_name" name="name" class="input_field contact_form_name" type="text" placeholder="Please Enter FullName" data-error="Name is required."><br>
                                        <span style="color: red; font-style: italic">${msgName} </span><br>

                                        <strong>Email: <span style="color: red">(*)</span></strong><br>
                                        <input style="margin-bottom: 0" id="contact_form_email" name="email" class="input_field contact_form_email" type="text" placeholder="Please Enter E-mail"  data-error="Valid email is required."><br>
                                        <span style="color: red; font-style: italic">${msgEmail} </span><br>

                                        <strong>Phone: <span style="color: red">(*)</span></strong><br>
                                        <input style="margin-bottom: 0" id="contact_form_email" name="phone" class="input_field contact_form_email" type="text" placeholder="Please Enter Phone Number"  data-error="Valid email is required."><br>
                                        <span style="color: red; font-style: italic">${msgPhone} </span><br>

                                        <strong>Address: </strong><br>
                                        <input style="margin-bottom: 0" id="contact_form_email" name="address" class="input_field contact_form_email" type="text" placeholder="Please Enter Address"  data-error="Valid email is required."><br>
                                        <span style="color: red; font-style: italic"></span><br>

                                        <strong>Message: </strong><br>
                                        <textarea id="contact_form_message" name="message" class="text_field contact_form_message" placeholder="Please Enter Message" data-error="Please, write us a message."></textarea>
                                        <button id="contact_send_btn" type="submit" class="contact_send_btn trans_200" onclick="validateForm()">Send message</button>
                                    </form>

                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="about">
                                <div class="about_title">Join Courses</div>
                                <p class="about_text"> Here, you'll explore the world of open source, develop programming skills, and build applications. Register now to learn alongside experts and a passionate community, enhancing your understanding and proficiency in open source and information technology.</p>

                                <div class="contact_info">
                                    <ul>
                                        <li class="contact_info_item">
                                            <div class="contact_info_icon">
                                                <img src="images/placeholder.svg" alt="https://www.flaticon.com/authors/lucy-g">
                                            </div>
                                            Thach Hoa, Thach That, Ha Noi 
                                        </li>
                                        <li class="contact_info_item">
                                            <div class="contact_info_icon">
                                                <img src="images/smartphone.svg" alt="https://www.flaticon.com/authors/lucy-g">
                                            </div>
                                            0335 226 826
                                        </li>
                                        <li class="contact_info_item">
                                            <div class="contact_info_icon">
                                                <img src="images/envelope.svg" alt="https://www.flaticon.com/authors/lucy-g">
                                            </div>course@support.com
                                        </li>
                                    </ul>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <!-- Footer -->

            <footer class="footer">
                <div class="container">
                    <!-- Footer Content -->
                    <div class="footer_content" style="padding-top: 0">
                        <div class="row">

                            <!-- Footer Column - About -->
                            <div class="col-lg-3 footer_col">

                                <!-- Logo -->
                                <div class="logo_container">
                                    <div class="logo">
                                        <img src="images/logo.png" alt="">
                                        <span>course</span>
                                    </div>
                                </div>

                                <p class="footer_about_text">Here, you'll explore the world of open source, develop programming skills, and build applications. Register now to learn alongside experts and a passionate community, enhancing your understanding and proficiency in open source and information technology.</p>

                            </div>

                            <!-- Footer Column - Menu -->

                            <div class="col-lg-3 footer_col">
                                <div class="footer_column_title">Menu</div>
                                <div class="footer_column_content">
                                    <ul>
                                        <li class="footer_list_item"><a href="#">Home</a></li>
                                        <li class="footer_list_item"><a href="courses.html">Courses</a></li>
                                        <li class="footer_list_item"><a href="news.html">Blogs</a></li>
                                        <li class="footer_list_item"><a href="contact">Contact</a></li>
                                    </ul>
                                </div>
                            </div>

                            <!-- Footer Column - Usefull Links -->

                            <div class="col-lg-3 footer_col">
                                <div class="footer_column_title">Usefull Links</div>
                                <div class="footer_column_content">
                                    <ul>
                                        <li class="footer_list_item"><a href="#">Testimonials</a></li>
                                        <li class="footer_list_item"><a href="#">FAQ</a></li>
                                        <li class="footer_list_item"><a href="#">Community</a></li>
                                        <li class="footer_list_item"><a href="#">Campus Pictures</a></li>
                                        <li class="footer_list_item"><a href="#">Tuitions</a></li>
                                    </ul>
                                </div>
                            </div>

                            <!-- Footer Column - Contact -->

                            <div class="col-lg-3 footer_col">
                                <div class="footer_column_title">Contact</div>
                                <div class="footer_column_content">
                                    <ul>
                                        <li class="footer_contact_item">
                                            <div class="footer_contact_icon">
                                                <img src="images/placeholder.svg" alt="https://www.flaticon.com/authors/lucy-g">
                                            </div>
                                            Thach Hoa, Thach That, Ha Noi 
                                        </li>
                                        <li class="footer_contact_item">
                                            <div class="footer_contact_icon">
                                                <img src="images/smartphone.svg" alt="https://www.flaticon.com/authors/lucy-g">
                                            </div>
                                            0335 226 826
                                        </li>
                                        <li class="footer_contact_item">
                                            <div class="footer_contact_icon">
                                                <img src="images/envelope.svg" alt="https://www.flaticon.com/authors/lucy-g">
                                            </div>course@support.com
                                        </li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>

                    <!-- Footer Copyright -->

                    <div class="footer_bar d-flex flex-column flex-sm-row align-items-center">
                        <div class="footer_copyright">
                            <span><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="">G2_SWP301</a>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></span>
                        </div>
                        <div class="footer_social ml-sm-auto">
                            <ul class="menu_social">
                                <li class="menu_social_item"><a href="#"><i class="fab fa-pinterest"></i></a></li>
                                <li class="menu_social_item"><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                                <li class="menu_social_item"><a href="#"><i class="fab fa-instagram"></i></a></li>
                                <li class="menu_social_item"><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                                <li class="menu_social_item"><a href="#"><i class="fab fa-twitter"></i></a></li>
                            </ul>
                        </div>
                    </div>

                </div>
            </footer>

        </div>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="styles/bootstrap4/popper.js"></script>
        <script src="styles/bootstrap4/bootstrap.min.js"></script>
        <script src="plugins/greensock/TweenMax.min.js"></script>
        <script src="plugins/greensock/TimelineMax.min.js"></script>
        <script src="plugins/scrollmagic/ScrollMagic.min.js"></script>
        <script src="plugins/greensock/animation.gsap.min.js"></script>
        <script src="plugins/greensock/ScrollToPlugin.min.js"></script>
        <script src="plugins/scrollTo/jquery.scrollTo.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCIwF204lFZg1y4kPSIhKaHEXMLYxxuMhA"></script>
        <script src="plugins/easing/easing.js"></script>
        <script src="js/contact_custom.js"></script>
        <script>
                                    function showToast(title, message, type) {
                                        let backgroundColor;
                                        let iconClass;
                                        switch (type) {
                                            case "success":
                                                backgroundColor = "linear-gradient(to right, #00b09b, #96c93d)";
                                                iconClass = "fas fa-check-circle";
                                                break;
                                            case "error":
                                                backgroundColor = "linear-gradient(to right, #f85032, #e73827)";
                                                iconClass = "fas fa-times-circle";
                                                break;
                                            case "info":
                                                backgroundColor = "#3498db"; // Màu của thông báo thông tin
                                                iconClass = "fas fa-info-circle";
                                                break;
                                            case "warning":
                                                backgroundColor = "#f39c12"; // Màu của thông báo cảnh báo
                                                iconClass = "fas fa-exclamation-circle";
                                                break;
                                            default:
                                                backgroundColor = "#333";
                                                iconClass = "fas fa-info-circle";
                                        }

                                        const toastElement = document.createElement('div');
                                        toastElement.style.display = 'flex';
                                        toastElement.style.flexDirection = 'column';  // Chuyển sang layout dạng cột
                                        toastElement.style.alignItems = 'left';
                                        toastElement.style.width = '300px';

                                        const iconContainer = document.createElement('div');
                                        iconContainer.style.display = 'flex';
                                        iconContainer.style.alignItems = 'left';

                                        const iconElement = document.createElement('i');
                                        iconElement.className = iconClass;
                                        iconElement.style.marginRight = '5px';
                                        iconElement.style.marginTop = '5px';

                                        const strongElement = document.createElement('strong');
                                        strongElement.textContent = title + ':';
                                        strongElement.style.fontSize = '16px';

                                        iconContainer.appendChild(iconElement);
                                        iconContainer.appendChild(strongElement);

                                        toastElement.appendChild(iconContainer);

                                        const messageElement = document.createElement('div');
                                        messageElement.textContent = message;
                                        messageElement.style.fontSize = '16px';
                                        toastElement.appendChild(messageElement);

                                        Toastify({
                                            node: toastElement,
                                            duration: 3000,
                                            newWindow: true,
                                            close: false,
                                            gravity: "top",
                                            position: "right",
                                            backgroundColor: backgroundColor,
                                            stopOnFocus: true,
                                        }).showToast();
                                    }
                                    var msgName = "${res}";

                                    if (msgName && msgName.trim() !== "") {
                                        if (msgName === "success") {
                                            showSuccessToast();
                                        } else {
                                            showErrorToast();
                                        }
                                    }

                                    function showSuccessToast() {
                                        showToast("Success", "Contact sent successfully!", "success");
                                    }

                                    function showErrorToast() {
                                        showToast("Error", "Contact sent unsuccessfully!", "error");
                                    }
                                    function showInfoToast() {
                                        showToast("Info", "This is an informational message.", "info");
                                    }

                                    function showWarningToast() {
                                        showToast("Warning", "This is a warning message.", "warning");
                                    }
        </script>

    </body>
</html>
