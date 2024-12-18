
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="style/userprofile.css" rel="stylesheet" type="text/css"/> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </head>
    <body>
        <div class="modal" id="editModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit profile</h5>
                        <button type="button" class="close" onclick="hideModal('editModal')">&times;</button>
                    </div>

                    <div class="modal-body">                     
                        <div class="form-outline mb-4">
                            <form action="loadEditUser" method="post">
                                <label for="username">Role</label>                           
                                <select>                                    
                                    <c:forEach var="o" items="${listC}">
                                        <option value="${o.role_id}" <c:if test="${user.role_id} eq ${role.role_id}">
                                            selected
                                            </c:if>   >${o.role_name}</option>
                                    </c:forEach>                             
                                </select>  
                            </form>
                        </div>
                        <div class="form-outline mb-4">
                            <label for="password">Status</label>
                            <select>
                                <c:forEach var="o" items="${listC}">
                                    <option value="${o.userID}">${o.status}</option>
                                </c:forEach>  
                            </select>
                        </div>
                        <button type="button" class="btn btn-primary btn-block mb-4">Save change</button>                          
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" onclick="hideModal('editModal')">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="container" style="margin-top: 50px;">
            <div class="main-body">             
                <div class="row gutters-sm">
                    <div class="col-md-4 mb-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex flex-column align-items-center text-center">
                                    <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin" class="rounded-circle" width="250">                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="card mb-3">
                            <div class="card-body">
                                <div class="row">
                                    <h6 class="mb-0" style="margin-left: 15px; font-size: 20px">Full Name:</h6>
                                    <input type="text" class="fullname" value="${u.fullName}" />
                                </div>
                                <hr>
                                <div class="row">
                                    <h6 class="mb-0" style="margin-left: 15px; font-size: 20px">Gender</h6>
                                    <input type="text" class="fullname" value="${u.gender ? "Male" : "Female"}">
                                </div>
                                <hr>
                                <div class="row">
                                    <h6 class="mb-0" style="margin-left: 15px; font-size: 20px">Email</h6>
                                    <input type="text" class="fullname" value="${u.email}">
                                </div>
                                <hr>
                                <div class="row">
                                    <h6 class="mb-0" style="margin-left: 15px; font-size: 20px">Phone number</h6>
                                    <input type="text" class="fullname" value="${u.phone}">
                                </div>
                                <hr>
                                <div class="row">
                                    <h6 class="mb-0" style="margin-left: 15px; font-size: 20px">Role</h6>
                                    <input type="text" class="fullname" value="${u.role.role_name}">                                  
                                </div>
                                <div class="row">
                                    <h6 class="mb-0" style="margin-left: 15px; font-size: 20px">Address</h6>
                                    <input type="text" class="fullname" value="${u.address}">
                                </div>
                                <div class="row">
                                    <h6 class="mb-0" style="margin-left: 15px; font-size: 20px">Status</h6>
                                    <input type="text" class="fullname" value="${u.status ? "Active" : "Inactive"}">
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <button onclick="showModal('editModal')" style="color: black; padding: 5px; font-size: 20px;" >Edit profile</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function showModal(modalId) {
                document.getElementById(modalId).style.display = "block";
            }

            function hideModal(modalId) {
                document.getElementById(modalId).style.display = "none";
            }

            function showDoNotAccountOrLogin(modalIdOpen, modalIdClose) {
                hideModal(modalIdClose)
                showModal(modalIdOpen)
            }
        </script>
    </body>
</html>
