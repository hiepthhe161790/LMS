<%-- 
    Document   : verifyEmail
    Created on : Nov 28, 2023, 11:25:35 PM
    Author     : VIETHUNG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="style/verifyEmail.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
         <link href="admin/css/bootstrap.min.css" rel="stylesheet">
         <link href="admin/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    </head>
   
    <body class="container-fluid bg-body-tertiary d-block" >
         <div> 

  <div class="row justify-content-center" style="zoom: 200%;">
      <div class="col-12 col-md-6 col-lg-4" style="min-width: 500px;">
        <div class="card bg-white mb-5 mt-5 border-0" style="box-shadow: 0 12px 15px rgba(0, 0, 0, 0.02);">
          <div class="card-body p-5 text-center" style="background-image: linear-gradient(#FFFCCE, #FFB330 )">
            <h4>Verify Email</h4>
            <p>Your code was sent to you via email</p>

                <div class="otp-text"> 
                    <%
                        if(request.getAttribute("message")!=null) {
                            out.print(request.getAttribute("message")+"</p>");
                        }
                    %>
                </div>
                <form id="register-form" action="verify" class="form" method="post">
                    <div class="otp-value">
                        <input id="opt" name="otp" placeholder="Enter OTP" type="text">
                    </div>
                    <br>
                    <div class="reset-password">
                       <button  class="btn btn-primary mb-3">
              Verify
            </button>
                    </div>
                </form> 

            

            <p class="resend text-muted mb-0">
              Didn't receive code? <a href="register.jsp">Request again</a>
            </p>
          </div>
        </div>
      </div>
    </div>
    </div> 
 
</body>
</html>
