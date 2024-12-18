<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 mb-4 mb-sm-5">
                <div class="card card-style1 border-0">
                    <div class="card-body p-1-9 p-sm-2-3 p-md-6 p-lg-7">
                        <div class="row align-items-center">
                            <div class="col-lg-6 mb-4 mb-lg-0">
                                <img src="" width="100%" alt="...">
                            </div>
                            <div class="col-lg-6 px-xl-10">
                                <div class="bg-secondary d-lg-inline-block py-1-9 px-1-9 px-sm-6 mb-1-9 rounded">
                                    <h3 class="h2 text-white mb-0">${user.getFullName()} </h3>
                                </div>
                                <ul class="list-unstyled mb-1-9">
                                    <li class="mb-2 mb-xl-3 display-28"><span class="display-26 text-secondary me-2 font-weight-600">Email:</span>${user.getEmail()}</li>

                                    <li class="mb-2 mb-xl-3 display-28"><span class="display-26 text-secondary me-2 font-weight-600">Phone:</span> ${user.getPhone()}</li>
                                    <li class="mb-2 mb-xl-3 display-28"><span class="display-26 text-secondary me-2 font-weight-600">Birth Date:</span> ${user.getBirthDate()}</li>
                                        <c:if test="${user.getGender() }">
                                        <li class="mb-2 mb-xl-3 display-28"><span class="display-26 text-secondary me-2 font-weight-600">Gender:</span> Male</li>
                                        </c:if>
                                        <c:if test="${!user.getGender()}">
                                        <li class="mb-2 mb-xl-3 display-28"><span class="display-26 text-secondary me-2 font-weight-600">Gender:</span> Female</li>
                                        </c:if>
                                    <li class="display-28"><span class="display-26 text-secondary me-2 font-weight-600">Address:</span> ${user.getAddress()}</li>
                                </ul>
                                <a href="editProfile" class="btn btn-primary">Edit Profile</a>
                                <a onclick="confirmLock(${user.userID})" class="btn btn-danger" style="color: #fff" >Lock User</a>
                                <a class="btn btn-primary" style="font-size: 16px" href="changepassword" >Change Password</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>
<script>
    function confirmLock(x) {
        let text = "Are your sure to lock your account";
        if (confirm(text) == true) {
            window.location = "lockUser?uid=" + x;
        } else {

        }
    }
</script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
    body{
        margin-top:20px;
    }
    .card-style1 {
        box-shadow: 0px 0px 10px 0px rgb(89 75 128 / 9%);
    }
    .border-0 {
        border: 0!important;
    }
    .card {
        position: relative;
        display: flex;
        flex-direction: column;
        min-width: 0;
        word-wrap: break-word;
        background-color: #fff;
        background-clip: border-box;
        border: 1px solid rgba(0,0,0,.125);
        border-radius: 0.25rem;
    }

    section {
        padding: 120px 0;
        overflow: hidden;
        background: #fff;
    }
    .mb-2-3, .my-2-3 {
        margin-bottom: 2.3rem;
    }

    .section-title {
        font-weight: 600;
        letter-spacing: 2px;
        text-transform: uppercase;
        margin-bottom: 10px;
        position: relative;
        display: inline-block;
    }
    .text-primary {
        color: #ceaa4d !important;
    }
    .text-secondary {
        color: #15395A !important;
    }
    .font-weight-600 {
        font-weight: 600;
    }
    .display-26 {
        font-size: 1.3rem;
    }

    @media screen and (min-width: 992px){
        .p-lg-7 {
            padding: 4rem;
        }
    }
    @media screen and (min-width: 768px){
        .p-md-6 {
            padding: 3.5rem;
        }
    }
    @media screen and (min-width: 576px){
        .p-sm-2-3 {
            padding: 2.3rem;
        }
    }
    .p-1-9 {
        padding: 1.9rem;
    }

    .bg-secondary {
        background: #15395A !important;
    }
    @media screen and (min-width: 576px){
        .pe-sm-6, .px-sm-6 {
            padding-right: 3.5rem;
        }
    }
    @media screen and (min-width: 576px){
        .ps-sm-6, .px-sm-6 {
            padding-left: 3.5rem;
        }
    }
    .pe-1-9, .px-1-9 {
        padding-right: 1.9rem;
    }
    .ps-1-9, .px-1-9 {
        padding-left: 1.9rem;
    }
    .pb-1-9, .py-1-9 {
        padding-bottom: 1.9rem;
    }
    .pt-1-9, .py-1-9 {
        padding-top: 1.9rem;
    }
    .mb-1-9, .my-1-9 {
        margin-bottom: 1.9rem;
    }
    @media (min-width: 992px){
        .d-lg-inline-block {
            display: inline-block!important;
        }
    }
    .rounded {
        border-radius: 0.25rem!important;
    }
</style>
