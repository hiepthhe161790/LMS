<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="contactDAO" class="DAO.ContactDAO" />

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Course</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Course Project">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="styles/contact_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/contact_responsive.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="styles/main_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/responsive.css">

        <!-- Thư viện Toastify.js -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"  crossorigin="anonymous" />
        <script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    </head>
    <body>

        <div class="super_container">

            <!-- Header -->

            <c:if test="${sessionScope.user != null}">
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
                                        <c:if test="${sessionScope.user != null}">
                                        <li class="main_nav_item" style="margin-right: 50px;"><a style="font-size: 16px" href="classes">class</a></li>
                                        <li class="main_nav_item" style="margin-right: 50px;"><a style="font-size: 16px" href="blogList">Blog</a></li>
                                                                      
                                        </c:if>
                                    <li class="main_nav_item" style="margin-right: 50px;"><a style="font-size: 16px" href="contact">contact</a></li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                      <div class="header_side d-flex flex-row justify-content-center align-items-center" style="background-color: #ffffff">
                        <div class="main_nav">
                            <ul class="main_nav_list" >
                                <c:if test="${sessionScope.user != null}">
                                    <li class="main_nav_item" ><a style="font-size: 16px" href="userdashboard">Dashboard</a></li>
                                    </c:if>
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
            <c:if test="${sessionScope.user == null}">
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
                        <nav class="main_nav_container" style="margin-left: 250px">
                            <div class="main_nav">
                                <ul class="main_nav_list">
                                    <li class="main_nav_item"><a href="index.jsp">home</a></li>
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
                            <li class="menu_item menu_mm"><a href="courses">Courses</a></li>
                            <li class="menu_item menu_mm"><a href="blogList">Blogs</a></li>
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

                <!-- Hero Slider -->
                <div class="hero_slider_container">
                    <div class="hero_slider owl-carousel">

                        <!-- Hero Slide -->
                        <div class="hero_slide">
                            <div class="hero_slide_background" style="background-image:url(images/slider_background.jpg)"></div>
                            <div class="hero_slide_container d-flex flex-column align-items-center justify-content-center">
                                <div class="hero_slide_content text-center">
                                    <h1 data-animation-in="fadeInUp" data-animation-out="animate-out fadeOut">Get your <span>Education</span> today!</h1>
                                </div>
                            </div>
                        </div>

                        <!-- Hero Slide -->
                        <div class="hero_slide">
                            <div class="hero_slide_background" style="background-image:url(images/slider_background.jpg)"></div>
                            <div class="hero_slide_container d-flex flex-column align-items-center justify-content-center">
                                <div class="hero_slide_content text-center">
                                    <h1 data-animation-in="fadeInUp" data-animation-out="animate-out fadeOut">Get your <span>Education</span> today!</h1>
                                </div>
                            </div>
                        </div>

                        <!-- Hero Slide -->
                        <div class="hero_slide">
                            <div class="hero_slide_background" style="background-image:url(images/slider_background.jpg)"></div>
                            <div class="hero_slide_container d-flex flex-column align-items-center justify-content-center">
                                <div class="hero_slide_content text-center">
                                    <h1 data-animation-in="fadeInUp" data-animation-out="animate-out fadeOut">Get your <span>Education</span> today!</h1>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="hero_slider_left hero_slider_nav trans_200"><span class="trans_200">prev</span></div>
                    <div class="hero_slider_right hero_slider_nav trans_200"><span class="trans_200">next</span></div>
                </div>

            </div>

            <div class="hero_boxes">
                <div class="hero_boxes_inner">
                    <div class="container">
                        <div class="row">

                            <div class="col-lg-4 hero_box_col" style="margin-left:200px" >
                                <div class="hero_box d-flex flex-row align-items-center justify-content-start">
                                    <img src="images/earth-globe.svg" class="svg" alt="">
                                    <div class="hero_box_content">
                                        <h2 class="hero_box_title">My CLass</h2>
                                        <a href="courses" class="hero_box_link">view more</a>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-4 hero_box_col">
                                <div class="hero_box d-flex flex-row align-items-center justify-content-start">
                                    <img src="images/books.svg" class="svg" alt="">
                                    <div class="hero_box_content">
                                        <h2 class="hero_box_title">My Blog</h2>
                                        <a href="blogList.jsp" class="hero_box_link">view more</a>
                                    </div>
                                </div>
                            </div>

<!--                            <div class="col-lg-4 hero_box_col">
                                <div class="hero_box d-flex flex-row align-items-center justify-content-start">
                                    <img src="images/professor.svg" class="svg" alt="">
                                    <div class="hero_box_content">
                                        <h2 class="hero_box_title">Contact</h2>
                                        <a href="news.html" class="hero_box_link">view more</a>
                                    </div>
                                </div>
                            </div>-->

                        </div>
                    </div>
                </div>
            </div>

            <!-- Popular -->

            <div class="popular page_section">
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="section_title text-center">
                                <h1>New Courses</h1>
                            </div>
                        </div>
                    </div>

                    <div class="row course_boxes">

                        <!-- Popular Course Item -->
                        <div class="col-lg-4 course_box">
                            <div class="card">
                                <img class="card-img-top" src="images/course_1.jpg" alt="https://unsplash.com/@kellybrito">
                                <div class="card-body text-center">
                                    <div class="card-title"><a href="courses.html">A complete guide to design</a></div>
                                    <div class="card-text">Adobe Guide, Layes, Smart Objects etc...</div>
                                </div>
                                <div class="price_box d-flex flex-row align-items-center">
                                    <div class="course_author_image">
                                        <img src="images/author.jpg" alt="https://unsplash.com/@mehdizadeh">
                                    </div>
                                    <div class="course_author_name">Michael Smith, <span>Author</span></div>
                                    <div class="course_price d-flex flex-column align-items-center justify-content-center"><span>$29</span></div>
                                </div>
                            </div>
                        </div>

                        <!-- Popular Course Item -->
                        <div class="col-lg-4 course_box">
                            <div class="card">
                                <img class="card-img-top" src="images/course_2.jpg" alt="https://unsplash.com/@cikstefan">
                                <div class="card-body text-center">
                                    <div class="card-title"><a href="courses.html">Beginners guide to HTML</a></div>
                                    <div class="card-text">Adobe Guide, Layes, Smart Objects etc...</div>
                                </div>
                                <div class="price_box d-flex flex-row align-items-center">
                                    <div class="course_author_image">
                                        <img src="images/author.jpg" alt="https://unsplash.com/@mehdizadeh">
                                    </div>
                                    <div class="course_author_name">Michael Smith, <span>Author</span></div>
                                    <div class="course_price d-flex flex-column align-items-center justify-content-center"><span>$29</span></div>
                                </div>
                            </div>
                        </div>

                        <!-- Popular Course Item -->
                        <div class="col-lg-4 course_box">
                            <div class="card">
                                <img class="card-img-top" src="images/course_3.jpg" alt="https://unsplash.com/@dsmacinnes">
                                <div class="card-body text-center">
                                    <div class="card-title"><a href="courses.html">Advanced Photoshop</a></div>
                                    <div class="card-text">Adobe Guide, Layes, Smart Objects etc...</div>
                                </div>
                                <div class="price_box d-flex flex-row align-items-center">
                                    <div class="course_author_image">
                                        <img src="images/author.jpg" alt="https://unsplash.com/@mehdizadeh">
                                    </div>
                                    <div class="course_author_name">Michael Smith, <span>Author</span></div>
                                    <div class="course_price d-flex flex-column align-items-center justify-content-center"><span>$29</span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>		
            </div>

            <!-- Register -->

            <!-- Services -->

            <div class="services page_section" style="padding-top: 0">

                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="section_title text-center">
                                <h1>Our Services</h1>
                            </div>
                        </div>
                    </div>

                    <div class="row services_row">

                        <div class="col-lg-4 service_item text-left d-flex flex-column align-items-start justify-content-start">
                            <div class="icon_container d-flex flex-column justify-content-end">
                                <img src="images/earth-globe.svg" alt="">
                            </div>
                            <h3> My Class</h3>
                            <p>Explore our Free IT Courses ? Empower your skills at no cost. Elevate your tech expertise with high-quality, accessible content. Start learning now!</p>
                        </div>

                        <div class="col-lg-4 service_item text-left d-flex flex-column align-items-start justify-content-start">
                            <div class="icon_container d-flex flex-column justify-content-end">
                                <img src="images/exam.svg" alt="">
                            </div>
                            <h3>My Blog</h3>
                            <p>Upgrade to Course Pro for an enhanced learning experience. Gain access to premium IT courses, advanced materials, and personalized guidance. Elevate your IT skills to the next level with Course Pro!</p>
                        </div>

                        <div class="col-lg-4 service_item text-left d-flex flex-column align-items-start justify-content-start">
                            <div class="icon_container d-flex flex-column justify-content-end">
                                <img src="images/books.svg" alt="">
                            </div>
                            <h3>Contact</h3>
                            <p>Delve into our Amazing Blogs for insightful articles and industry trends. Stay informed, inspired, and connected with the latest updates. Explore a wealth of knowledge and broaden your perspectives!</p>
                        </div>

                        <div class="col-lg-4 service_item text-left d-flex flex-column align-items-start justify-content-start">
                            <div class="icon_container d-flex flex-column justify-content-end">
                                <img src="images/professor.svg" alt="">
                            </div>
                            <h3>Amazing Lessons</h3>
                            <p>Dive into Amazing Lessons, where each module is crafted for an immersive learning experience. Explore engaging content, interactive activities, and unlock the secrets to mastering your subject. Start your journey to knowledge excellence with our Amazing Lessons.</p>
                        </div>

                        <div class="col-lg-4 service_item text-left d-flex flex-column align-items-start justify-content-start">
                            <div class="icon_container d-flex flex-column justify-content-end">
                                <img src="images/blackboard.svg" alt="">
                            </div>
                            <h3>Amazing Videos</h3>
                            <p>Immerse yourself in Amazing Videos for an enriching visual learning experience. Explore dynamic content, expert insights, and step into a world where education meets innovation. Transform your understanding with our captivating Amazing Videos.</p>
                        </div>

                        <div class="col-lg-4 service_item text-left d-flex flex-column align-items-start justify-content-start">
                            <div class="icon_container d-flex flex-column justify-content-end">
                                <img src="images/mortarboard.svg" alt="">
                            </div>
                            <h3>Support Teams</h3>
                            <p>Connect with our dedicated Support Teams for personalized assistance. Our experts are here to guide you through any challenges, ensuring a seamless learning journey. Your success is our priority?reach out to our Support Teams today!</p>
                        </div>

                    </div>
                </div>
            </div>

            <!-- Events -->

            <div class="events page_section" style="padding-top: 0">
                <div class="container">

                    <div class="row">
                        <div class="col">
                            <div class="section_title text-center">
                                <h1>New Blogs</h1>
                            </div>
                        </div>
                    </div>

                    <div class="event_items">

                        <!-- Event Item -->
                        <div class="row event_item">
                            <div class="col">
                                <div class="row d-flex flex-row align-items-end">

                                    <div class="col-lg-2 order-lg-1 order-2">
                                        <div class="event_date d-flex flex-column align-items-center justify-content-center">
                                            <div class="event_day">07</div>
                                            <div class="event_month">January</div>
                                        </div>
                                    </div>

                                    <div class="col-lg-6 order-lg-2 order-3">
                                        <div class="event_content">
                                            <div class="event_name"><a class="trans_200" href="#">Student Festival</a></div>
                                            <div class="event_location">Grand Central Park</div>
                                            <p>In aliquam, augue a gravida rutrum, ante nisl fermentum nulla, vitae tempor nisl ligula vel nunc. Proin quis mi malesuada, finibus tortor.</p>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 order-lg-3 order-1">
                                        <div class="event_image">
                                            <img src="images/event_1.jpg" alt="https://unsplash.com/@theunsteady5">
                                        </div>
                                    </div>

                                </div>	
                            </div>
                        </div>

                        <!-- Event Item -->
                        <div class="row event_item">
                            <div class="col">
                                <div class="row d-flex flex-row align-items-end">

                                    <div class="col-lg-2 order-lg-1 order-2">
                                        <div class="event_date d-flex flex-column align-items-center justify-content-center">
                                            <div class="event_day">07</div>
                                            <div class="event_month">January</div>
                                        </div>
                                    </div>

                                    <div class="col-lg-6 order-lg-2 order-3">
                                        <div class="event_content">
                                            <div class="event_name"><a class="trans_200" href="#">Open day in the Univesrsity campus</a></div>
                                            <div class="event_location">Grand Central Park</div>
                                            <p>In aliquam, augue a gravida rutrum, ante nisl fermentum nulla, vitae tempor nisl ligula vel nunc. Proin quis mi malesuada, finibus tortor.</p>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 order-lg-3 order-1">
                                        <div class="event_image">
                                            <img src="images/event_2.jpg" alt="https://unsplash.com/@claybanks1989">
                                        </div>
                                    </div>

                                </div>	
                            </div>
                        </div>

                        <!-- Event Item -->
                        <div class="row event_item">
                            <div class="col">
                                <div class="row d-flex flex-row align-items-end">

                                    <div class="col-lg-2 order-lg-1 order-2">
                                        <div class="event_date d-flex flex-column align-items-center justify-content-center">
                                            <div class="event_day">07</div>
                                            <div class="event_month">January</div>
                                        </div>
                                    </div>

                                    <div class="col-lg-6 order-lg-2 order-3">
                                        <div class="event_content">
                                            <div class="event_name"><a class="trans_200" href="#">Student Graduation Ceremony</a></div>
                                            <div class="event_location">Grand Central Park</div>
                                            <p>In aliquam, augue a gravida rutrum, ante nisl fermentum nulla, vitae tempor nisl ligula vel nunc. Proin quis mi malesuada, finibus tortor.</p>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 order-lg-3 order-1">
                                        <div class="event_image">
                                            <img src="images/event_3.jpg" alt="https://unsplash.com/@juanmramosjr">
                                        </div>
                                    </div>

                                </div>	
                            </div>
                        </div>

                    </div>

                </div>
            </div>
            <div class="events page_section" style="padding-top: 0">
                <div class="container">
                    <!-- Contact Form -->
                    <div class="row">
                        <div class="col">
                            <div class="section_title text-center">
                                <h1>Contact Us</h1>
                            </div>
                        </div>
                    </div>
                    <div class="row event_item">
                        <div class="col">
                            <div class="contact_form">
                                <div class="contact_form_container">
                                    <form action="contact" method="POST" id="contactForm">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <strong>Full Name: <span style="color: red">(*)</span></strong><br>
                                                <input style="margin-bottom: 0; background-color: #f8f4f4 " id="contact_form_name" name="name" class="input_field contact_form_name" type="text" placeholder="Please Enter FullName" data-error="Name is required."><br>
                                                <span style="color: red; font-style: italic">${msgName} </span><br> 
                                            </div>
                                            <div class="col-md-6">
                                                <strong>Contact Type: <span style="color: red">(*)</span></strong><br>
                                                <select name="contactType" style="margin-bottom: 0; background-color: #f8f4f4 " class="input_field contact_form_name">
                                                    <option value="">Select Contact Type</option>
                                                    <c:forEach items="${contactDAO.getAllContactType()}" var="item">
                                                        <option value="${item.contactTypeID}">${item.name}</option>
                                                    </c:forEach>
                                                </select>
                                                <span style="color: red; font-style: italic">${msgContactType} </span><br>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <strong>Email: <span style="color: red">(*)</span></strong><br>
                                                <input style="margin-bottom: 0; background-color: #f8f4f4 " id="contact_form_email" name="email" class="input_field contact_form_email" type="text" placeholder="Please Enter E-mail"  data-error="Valid email is required."><br>
                                                <span style="color: red; font-style: italic">${msgEmail} </span><br>
                                            </div>
                                            <div class="col-md-6">
                                                <strong>Phone: <span style="color: red">(*)</span></strong><br>
                                                <input style="margin-bottom: 0; background-color: #f8f4f4 " id="contact_form_email" name="phone" class="input_field contact_form_email" type="text" placeholder="Please Enter Phone Number"  data-error="Valid email is required."><br>
                                                <span style="color: red; font-style: italic">${msgPhone} </span><br>
                                            </div>
                                        </div>
                                        <div class="row" style="padding-left: 15px; padding-right: 15px">
                                            <strong>Subject: <span style="color: red">(*)</span></strong><br>
                                            <input style="margin-bottom: 0; background-color: #f8f4f4 " id="contact_form_email" name="subject" class="input_field contact_form_email" type="text" placeholder="Please Enter Subject"  data-error="Valid email is required."><br>
                                            <span style="color: red; font-style: italic">${msgSubject}</span><br>
                                        </div>
                                        <div class="row mt-3" style="padding-left: 15px; padding-right: 15px">
                                            <strong>Message: </strong><br>
                                            <textarea id="contact_form_message" name="message" class="text_field contact_form_message" placeholder="Please Enter Message" data-error="Please, write us a message."></textarea> 
                                        </div>
                                        <div class="row" style="padding-left: 15px; padding-right: 15px">
                                            <button id="contact_send_btn" type="submit" class="contact_send_btn trans_200" onclick="validateForm()">Send message</button>
                                        </div>
                                    </form>
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
                                        <li class="footer_list_item"><a href="blogList">Blogs</a></li>
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
        <script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
        <script src="plugins/scrollTo/jquery.scrollTo.min.js"></script>
        <script src="plugins/easing/easing.js"></script>
        <script src="js/custom.js"></script>
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