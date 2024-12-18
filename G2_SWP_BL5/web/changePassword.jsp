<!DOCTYPE html>
<html>
<head>
    <title>Change Password</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="style/changepassword.css" rel="stylesheet" type="text/css"/>
    <link href="CSS/styles.css" rel="stylesheet" type="text/css"/>
    <link href="CSS/userprofile.css" rel="stylesheet" type="text/css"/>
    <style>
        .main-body {
            margin-top: 10%;
        }
        .change2 {
            margin-bottom: 0;
            font-size: 24px;
            color: #333;
        }
        .change {
            margin-bottom: 0;
            font-size: 18px;
            color: #333;
        }
        .fullname {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: #fff;
            font-size: 18px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .notice-message {
            margin-top: 20px;
            text-align: center;
            color: red;
        }
    </style>
</head>
<body>
      <%@include file="header.jsp" %>
    <div class="container" style="color: black;margin-top: 200px;">
        <div class="main-body">
            <div class="row gutters-sm">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <div class="card mb-3">
                        <form  style="background-image: linear-gradient(#FFFCCE, #FFB330 )" action="changepassword" method="post">
                            <div class="card-body">
                                <div class="row">
                                    <h6 class="mb-0 change2">Change Password</h6>
                                </div>
                                <hr>
                                <div class="row">
                                    <h6 class="mb-0 change">Old Password</h6>
                                    <input type="password" class="fullname" name="oldpass">
                                </div>
                                <hr>
                                <div class="row">
                                    <h6 class="mb-0 change">New Password</h6>
                                    <input type="password" class="fullname" name="newpass">
                                </div>
                                <hr>
                                <div class="row">
                                    <h6 class="mb-0 change">Confirm Password</h6>
                                    <input type="password" class="fullname" name="renewpass">
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <input type ="submit" value="Save Change">
                                    </div>
                                </div>
                            </div>
                            <div class="notice-message">
                                <h1>${status}</h1>
                                <h1>${errorMessage}</h1>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
                            <jsp:include page="footer.jsp"/>
</body>
</html>
