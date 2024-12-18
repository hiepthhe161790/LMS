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
    <h1 style="text-align: center">Welcome to Admin Dashboard</h1>
        <!-- Sidebar  -->
         <div class="iq-sidebar">
            <div class="iq-sidebar-logo d-flex justify-content-between">
               <a href="index.html" class="header-logo">
                  <img src="images/logo.png" class="img-fluid rounded-normal" alt="">
                  <div class="logo-title">
                     <span class="text-primary text-uppercase">Classto</span>
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
                        <a href="#dashboard" class="iq-waves-effect" data-toggle="collapse" aria-expanded="false"><span class="ripple rippleEffect"></span><i class="las la-home iq-arrow-left"></i><span>Shop</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                        <ul id="dashboard" class="iq-submenu collapse" data-parent="#iq-sidebar-toggle">
                           <li class="active"><a href="index.html"><i class="las la-house-damage"></i>Home Page</a></li>
                           <li><a href="category.html"><i class="ri-function-line"></i>Subject Page</a></li>
                           <li><a href="book-page.html"><i class="ri-book-line"></i>Class Page</a></li>
                           <li><a href="book-pdf.html"><i class="ri-file-pdf-line"></i>Class PDF</a></li>
                           <li><a href="Checkout.html"><i class="ri-checkbox-multiple-blank-line"></i>Checkout</a></li>
                          <li><a href="wishlist.html"><i class="ri-heart-line"></i>wishlist</a></li>
                        </ul>
                     </li>
                     <li class="active active-menu">
                        <a href="#admin" class="iq-waves-effect" data-toggle="collapse" aria-expanded="true"><span class="ripple rippleEffect"></span><i class="las la-home iq-arrow-left"></i><span>Admin</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                        <ul id="admin" class="iq-submenu collapse show" data-parent="#iq-sidebar-toggle">
                           <li class="active"><a href="admin-dashboard.html"><i class="las la-house-damage"></i>Dashboard</a></li>
                           <li><a href="admin-category.html"><i class="ri-function-line"></i>Subject</a></li>
                           <li><a href="admin-author.html"><i class="ri-book-line"></i>Author</a></li>
                           <li><a href="admin-books.html"><i class="ri-file-pdf-line"></i>Classes</a></li>
                        </ul>
                     </li>
                     <li>
                        <a href="#userinfo" class="iq-waves-effect" data-toggle="collapse" aria-expanded="false"><span class="ripple rippleEffect"></span><i class="las la-user-tie iq-arrow-left"></i><span>User</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                        <ul id="userinfo" class="iq-submenu collapse" data-parent="#iq-sidebar-toggle" style="">
                           <li><a href="profile.html"><i class="las la-id-card-alt"></i>User Profile</a></li>
                           <li><a href="profile-edit.html"><i class="las la-edit"></i>User Edit</a></li>
                           <li><a href="add-user.html"><i class="las la-plus-circle"></i>User Add</a></li>
                           <li><a href="admin_userlist.jsp"><i class="las la-th-list"></i>User List</a></li>
                        </ul>
                     </li>
                     <li>
                        <a href="#ui-elements" class="iq-waves-effect collapsed" data-toggle="collapse" aria-expanded="false"><i class="lab la-elementor iq-arrow-left"></i><span>UI Elements</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                        <ul id="ui-elements" class="iq-submenu collapse" data-parent="#iq-sidebar-toggle">
                           <li class="elements">
                              <a href="#sub-menu" class="iq-waves-effect collapsed" data-toggle="collapse" aria-expanded="false"><i class="ri-play-circle-line"></i><span>UI Kit</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                              <ul id="sub-menu" class="iq-submenu collapse" data-parent="#ui-elements">
                                 <li><a href="ui-colors.html"><i class="las la-palette"></i>colors</a></li>
                                 <li><a href="ui-typography.html"><i class="las la-keyboard"></i>Typography</a></li>
                                 <li><a href="ui-alerts.html"><i class="las la-tag"></i>Alerts</a></li>
                                 <li><a href="ui-badges.html"><i class="lab la-atlassian"></i>Badges</a></li>
                                 <li><a href="ui-breadcrumb.html"><i class="las la-bars"></i>Breadcrumb</a></li>
                                 <li><a href="ui-buttons.html"><i class="las la-tablet"></i>Buttons</a></li>
                                 <li><a href="ui-cards.html"><i class="las la-credit-card"></i>Cards</a></li>
                                 <li><a href="ui-carousel.html"><i class="las la-film"></i>Carousel</a></li>
                                 <li><a href="ui-embed-video.html"><i class="las la-video"></i>Video</a></li>
                                 <li><a href="ui-grid.html"><i class="las la-border-all"></i>Grid</a></li>
                                 <li><a href="ui-images.html"><i class="las la-images"></i>Images</a></li>
                                 <li><a href="ui-list-group.html"><i class="las la-list"></i>list Group</a></li>
                                 <li><a href="ui-media-object.html"><i class="las la-ad"></i>Media</a></li>
                                 <li><a href="ui-modal.html"><i class="las la-columns"></i>Modal</a></li>
                                 <li><a href="ui-notifications.html"><i class="las la-bell"></i>Notifications</a></li>
                                 <li><a href="ui-pagination.html"><i class="las la-ellipsis-h"></i>Pagination</a></li>
                                 <li><a href="ui-popovers.html"><i class="las la-eraser"></i>Popovers</a></li>
                                 <li><a href="ui-progressbars.html"><i class="las la-hdd"></i>Progressbars</a></li>
                                 <li><a href="ui-tabs.html"><i class="las la-database"></i>Tabs</a></li>
                                 <li><a href="ui-tooltips.html"><i class="las la-magnet"></i>Tooltips</a></li>
                              </ul>
                           </li>
                           <li class="form">
                              <a href="#forms" class="iq-waves-effect collapsed" data-toggle="collapse" aria-expanded="false"><i class="lab la-wpforms"></i><span>Forms</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                              <ul id="forms" class="iq-submenu collapse" data-parent="#ui-elements">
                                 <li><a href="form-layout.html"><i class="las la-book"></i>Form Elements</a></li>
                                 <li><a href="form-validation.html"><i class="las la-edit"></i>Form Validation</a></li>
                                 <li><a href="form-switch.html"><i class="las la-toggle-off"></i>Form Switch</a></li>
                                 <li><a href="form-chechbox.html"><i class="las la-check-square"></i>Form Checkbox</a></li>
                                 <li><a href="form-radio.html"><i class="ri-radio-button-line"></i>Form Radio</a></li>
                              </ul>
                           </li>
                           <li>
                              <a href="#wizard-form" class="iq-waves-effect collapsed" data-toggle="collapse" aria-expanded="false"><i class="ri-archive-drawer-line"></i><span>Forms Wizard</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                              <ul id="wizard-form" class="iq-submenu collapse" data-parent="#ui-elements">
                                 <li><a href="form-wizard.html"><i class="ri-clockwise-line"></i>Simple Wizard</a></li>
                                 <li><a href="form-wizard-validate.html"><i class="ri-clockwise-2-line"></i>Validate Wizard</a></li>
                                 <li><a href="form-wizard-vertical.html"><i class="ri-anticlockwise-line"></i>Vertical Wizard</a></li>
                              </ul>
                           </li>
                           <li>
                              <a href="#tables" class="iq-waves-effect collapsed" data-toggle="collapse" aria-expanded="false"><i class="ri-table-line"></i><span>Table</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                              <ul id="tables" class="iq-submenu collapse" data-parent="#ui-elements">
                                 <li><a href="tables-basic.html"><i class="ri-table-line"></i>Basic Tables</a></li>
                                 <li><a href="data-table.html"><i class="ri-database-line"></i>Data Table</a></li>
                                 <li><a href="table-editable.html"><i class="ri-refund-line"></i>Editable Table</a></li>
                              </ul>
                           </li>
                           <li>
                              <a href="#charts" class="iq-waves-effect collapsed" data-toggle="collapse" aria-expanded="false"><i class="ri-pie-chart-box-line"></i><span>Charts</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                              <ul id="charts" class="iq-submenu collapse" data-parent="#ui-elements">
                                 <li><a href="chart-morris.html"><i class="ri-file-chart-line"></i>Morris Chart</a></li>
                                 <li><a href="chart-high.html"><i class="ri-bar-chart-line"></i>High Charts</a></li>
                                 <li><a href="chart-am.html"><i class="ri-folder-chart-line"></i>Am Charts</a></li>
                                 <li><a href="chart-apex.html"><i class="ri-folder-chart-2-line"></i>Apex Chart</a></li>
                              </ul>
                           </li>
                           <li>
                              <a href="#icons" class="iq-waves-effect collapsed" data-toggle="collapse" aria-expanded="false"><i class="ri-list-check"></i><span>Icons</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                              <ul id="icons" class="iq-submenu collapse" data-parent="#ui-elements">
                                 <li><a href="icon-dripicons.html"><i class="ri-stack-line"></i>Dripicons</a></li>
                                 <li><a href="icon-fontawesome-5.html"><i class="ri-facebook-fill"></i>Font Awesome 5</a></li>
                                 <li><a href="icon-lineawesome.html"><i class="ri-keynote-line"></i>line Awesome</a></li>
                                 <li><a href="icon-remixicon.html"><i class="ri-remixicon-line"></i>Remixicon</a></li>
                                 <li><a href="icon-unicons.html"><i class="ri-underline"></i>unicons</a></li>
                              </ul>
                           </li>
                        </ul>
                     </li>
                     <li>
                        <a href="#pages" class="iq-waves-effect collapsed" data-toggle="collapse" aria-expanded="false"><i class="las la-file-alt iq-arrow-left"></i><span>Pages</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                        <ul id="pages" class="iq-submenu collapse" data-parent="#iq-sidebar-toggle">
                           <li>
                              <a href="#authentication" class="iq-waves-effect collapsed" data-toggle="collapse" aria-expanded="false"><i class="ri-pages-line"></i><span>Authentication</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                              <ul id="authentication" class="iq-submenu collapse" data-parent="#pages">
                                 <li><a href="sign-in.html"><i class="las la-sign-in-alt"></i>Login</a></li>
                                 <li><a href="sign-up.html"><i class="ri-login-circle-line"></i>Register</a></li>
                                 <li><a href="pages-recoverpw.html"><i class="ri-record-mail-line"></i>Recover Password</a></li>
                                 <li><a href="pages-confirm-mail.html"><i class="ri-file-code-line"></i>Confirm Mail</a></li>
                                 <li><a href="pages-lock-screen.html"><i class="ri-lock-line"></i>Lock Screen</a></li>
                              </ul>
                           </li>
                           <li>
                              <a href="#extra-pages" class="iq-waves-effect collapsed" data-toggle="collapse" aria-expanded="false"><i class="ri-pantone-line"></i><span>Extra Pages</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                              <ul id="extra-pages" class="iq-submenu collapse" data-parent="#pages">
                                 <li><a href="pages-timeline.html"><i class="ri-map-pin-time-line"></i>Timeline</a></li>
                                 <li><a href="pages-invoice.html"><i class="ri-question-answer-line"></i>Invoice</a></li>
                                 <li><a href="blank-page.html"><i class="ri-invision-line"></i>Blank Page</a></li>
                                 <li><a href="pages-error.html"><i class="ri-error-warning-line"></i>Error 404</a></li>
                                 <li><a href="pages-error-500.html"><i class="ri-error-warning-line"></i>Error 500</a></li>
                                 <li><a href="pages-pricing.html"><i class="ri-price-tag-line"></i>Pricing</a></li>
                                 <li><a href="pages-pricing-one.html"><i class="ri-price-tag-2-line"></i>Pricing 1</a></li>
                                 <li><a href="pages-maintenance.html"><i class="ri-archive-line"></i>Maintenance</a></li>
                                 <li><a href="pages-comingsoon.html"><i class="ri-mastercard-line"></i>Coming Soon</a></li>
                                 <li><a href="pages-faq.html"><i class="ri-compasses-line"></i>Faq</a></li>
                              </ul>
                           </li>
                        </ul>
                     </li>
                     <li>
                        <a href="#menu-level" class="iq-waves-effect collapsed" data-toggle="collapse" aria-expanded="false"><i class="ri-record-circle-line iq-arrow-left"></i><span>Menu Level</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                        <ul id="menu-level" class="iq-submenu collapse" data-parent="#iq-sidebar-toggle">
                           <li><a href="#"><i class="ri-record-circle-line"></i>Menu 1</a></li>
                           <li>
                              <a href="#"><i class="ri-record-circle-line"></i>Menu 2</a>
                              <ul>
                                 <li class="menu-level">
                                    <a href="#sub-menus" class="iq-waves-effect collapsed" data-toggle="collapse" aria-expanded="false"><i class="ri-play-circle-line"></i><span>Sub-menu</span><i class="ri-arrow-right-s-line iq-arrow-right"></i></a>
                                    <ul id="sub-menus" class="iq-submenu iq-submenu-data collapse">
                                       <li><a href="#"><i class="ri-record-circle-line"></i>Sub-menu 1</a></li>
                                       <li><a href="#"><i class="ri-record-circle-line"></i>Sub-menu 2</a></li>
                                       <li><a href="#"><i class="ri-record-circle-line"></i>Sub-menu 3</a></li>
                                    </ul>
                                 </li>
                              </ul>
                           </li>
                           <li><a href="#"><i class="ri-record-circle-line"></i>Menu 3</a></li>
                           <li><a href="#"><i class="ri-record-circle-line"></i>Menu 4</a></li>
                        </ul>
                     </li>
                  </ul>
               </nav>
               <div id="sidebar-bottom" class="p-3 position-relative">
                  <div class="iq-card">
                     <div class="iq-card-body">
                        <div class="sidebarbottom-content">
                           <div class="image"><img src="images/page-img/side-bkg.png" alt=""></div>                           
                           <button type="submit" class="btn w-100 btn-primary mt-4 view-more">Become Membership</button>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-lg-3">
                <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                    <div class="iq-card-body">
                        <div class="d-flex align-items-center">
                            <div class="rounded-circle iq-card-icon bg-primary"><i class="ri-user-line"></i></div>
                            <div class="text-left ml-3">                                 
                                <h2 class="mb-0"><span class="counter">${userCount}</span></h2>
                                <h5 class="">Users</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-md-6 col-lg-3">
                <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                    <div class="iq-card-body">
                        <div class="d-flex align-items-center">
                            <div class="rounded-circle iq-card-icon bg-danger"><i class="ri-book-line"></i></div>
                            <div class="text-left ml-3">                                 
                                <h2 class="mb-0"><span class="counter">${classCount}</span></h2>
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
                                <h2 class="mb-0"><span class="counter">${blogCount}</span></h2>
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
                                <h2 class="mb-0"><span class="counter">${contactCount}</span></h2>
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
                           <div id="iq-sale-chart"></div>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-4">
                     <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                        <div class="iq-card-header d-flex justify-content-between align-items-center">
                           <div class="iq-header-title">
                              <h4 class="card-title mb-0">Summary</h4>
                           </div>
                        </div>
                        <div class="iq-card-body">
                           <ul class="list-inline p-0 mb-0">
                              <li>
                                 <div class="iq-details mb-2">
                                    <span class="title">Income</span>
                                    <div class="percentage float-right text-primary">95 <span>%</span></div>
                                    <div class="iq-progress-bar-linear d-inline-block w-100">
                                       <div class="iq-progress-bar iq-bg-primary">
                                          <span class="bg-primary" data-percent="90"></span>
                                       </div>
                                    </div>
                                 </div>                                       
                              </li>
                              <li>
                                 <div class="iq-details mb-2">
                                    <span class="title">Profit</span>
                                    <div class="percentage float-right text-warning">72 <span>%</span></div>
                                    <div class="iq-progress-bar-linear d-inline-block w-100">
                                       <div class="iq-progress-bar iq-bg-warning">
                                          <span class="bg-warning" data-percent="75"></span>
                                       </div>
                                    </div>
                                 </div>
                              </li>
                              <li>
                                <div class="iq-details mb-2">
                                    <span class="title">Expenses</span>
                                    <div class="percentage float-right text-info">75 <span>%</span></div>
                                    <div class="iq-progress-bar-linear d-inline-block w-100">
                                       <div class="iq-progress-bar iq-bg-info">
                                          <span class="bg-info" data-percent="65"></span>
                                       </div>
                                    </div>
                                 </div> 
                              </li>
                           </ul>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-4">
                     <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                           <div class="iq-card-body">
                              <h4 class="text-uppercase text-black mb-0">Session(Now)</h4>
                              <div class="d-flex justify-content-between align-items-center">
                                 <div class="font-size-80 text-black">12</div>
                                 <div class="text-left">
                                    <p class="m-0 text-uppercase font-size-12">1 Hours Ago</p>
                                    <div class="mb-1 text-black">5<span class="text-danger"><i class="ri-arrow-down-s-fill"></i>3.25%</span></div>
                                    <p class="m-0 text-uppercase font-size-12">1 Day Ago</p>
                                    <div class="mb-1 text-black">8<span class="text-success"><i class="ri-arrow-down-s-fill"></i>1.00%</span></div>
                                    <p class="m-0 text-uppercase font-size-12">1 Week Ago</p>
                                    <div class="text-black">2<span class="text-danger"><i class="ri-arrow-down-s-fill"></i>9.87%</span></div>
                                 </div>
                              </div>
                              <div id="wave-chart-7"></div>
                           </div>
                        </div>
                  </div>
                  <div class="col-sm-12">
                     <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
                        <div class="iq-card-header d-flex justify-content-between">
                           <div class="iq-header-title">
                              <h4 class="card-title">Open Invoices</h4>
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
                                       <th scope="col">Client</th>
                                       <th scope="col">Date</th>
                                      
                                       <th scope="col">atatus</th>
                                       <th scope="col">Action</th>

                                    </tr>
                                 </thead>
                                 <tbody>
                                    <tr>
                                       <td>Ira Membrit</td>
                                       <td>18/10/2019</td>
                                       
                                       <td><div class="badge badge-pill badge-success">Progress</div></td>
                                       <td>Copy</td>
                                    </tr>
                                    <tr>
                                       <td>Pete Sariya</td>
                                       <td>26/10/2019</td>
                                       
                                       <td><div class="badge badge-pill badge-success">Progress</div></td>
                                       <td>Send Email</td>
                                    </tr>
                                    <tr>
                                       <td>Cliff Hanger</td>
                                       <td>18/11/2019</td>
                                      
                                       <td><div class="badge badge-pill badge-danger">Pass Due</div></td>
                                       <td>Before Due</td>
                                    </tr>
                                    <tr>
                                       <td>Terry Aki</td>
                                       <td>14/12/2019</td>
                                      
                                       <td><div class="badge badge-pill badge-success">Progress</div></td>
                                       <td>Copy</td>
                                    </tr>
                                    <tr>
                                       <td>Anna Mull</td>
                                       <td>24/12/2019</td>
                                       
                                       <td><div class="badge badge-pill badge-success">Progress</div></td>
                                       <td>Send Email</td>
                                    </tr>
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
      <script src="./admin/js/chart-custom.js"></script>
</body>
</html>
