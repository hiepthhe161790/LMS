<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="CSS/myRegis.css" rel="stylesheet" type="text/css"/>            
        <link href="CSS/styles.css" rel="stylesheet" type="text/css"/> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <jsp:include page="header.jsp" />   
        <div class="container"  style="margin-right: 2px; margin-left: 12%;">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-3">
                            <h2>User <b>Search</b></h2>                                
                        </div> 
                        <br><div class="col-sm-9">
                            <form action="searchUserBy" method="post">
                                Name <input type="text" name="name" style="color: black;">     
                                Email <input type="text" name="email" style="color: black;">                          
                                Phone <input type="text" name="phone" style="color: black;">
                                <button style="color: black; padding: 2px;"><i class="fa-solid fa-magnifying-glass"></i></button>
                            </form>             
                            <button style="color: black;">Add new</button>
                            <form action="sortUser" method="post">
                                <select name="opU" onchange="this.form.submit()" style="color: black;">
                                    <option value="all">All</option>
                                    <option value="op1">Name</option>
                                    <option value="op2">Email</option>
                                    <option value="op3">Gender</option>
                                    <option value="op4">Phone number</option>
                                    <option value="op5">Role</option>
                                    <option value="op6">Status</option>
                                    <option value="op7">ID</option>
                                </select>(Sort increase) 
                            </form>
                        </div>

                    </div>
                </div>
                 <table id="user-list-table" class="table table-striped table-bordered mt-4" role="grid" aria-describedby="user-list-page-info">
                                                            <thead>
                                                                <tr>
                                                                    <th>No.</th>
                                                                    <th>Full Name</th>
                                                                    <th>Phone</th>
                                                                    <th>Email</th>
                                                                    <th>Role</th>
                                                                    <th>Status</th>
                                                                    <th>Action</th>

                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach items="${listC}" var="o" varStatus="status">
                                                                    <tr class="mt-30">
                                                                        <td>${o.userID}</td>
                                                                        <td>${o.fullName}</td>
                                                                        <td>${o.phone}</td>
                                                                        <td>${o.email}</td>
                                                                        <td>${o.role_id == 1 ? "Admin" : o.role_id == 2 ? "Teacher" : "Learner"}</td>
                                                                        <td style="color: ${o.status ? 'green' : 'red'}">${o.status ? 'Active' : 'Inactive'}</td>
                                                                        <td>
                                                                            <div class="flex align-items-center list-user-action" style="display: flex">
                                                                                <a class="iq-bg-primary" data-toggle="modal" data-original-title="Details" data-target=".bd-example-modal-lg" href="userdetails?uid=${o.userID}">
                                                                                    <i class="ri-pencil-line"></i>
                                                                                </a>
                                                                                <a class="iq-bg-primary" data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete" href="#" onclick="showConfirmDialog('${o.userID}')">
                                                                                    <i class="ri-shut-down-line"></i>
                                                                                </a>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                              

                                                            </tbody>
                                                        </table>
            </div>
        </div> 
        <jsp:include page="footer.jsp" />
    </body>
</html>
