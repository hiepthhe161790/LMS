<%-- 
    Document   : subjectList
    Created on : Jun 17, 2023, 7:01:03 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="boots.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"></head>
    <!--<link href="CSS/styles.css" rel="stylesheet" type="text/css"/>-->
    <style>
    .action-links {
        display: flex;
        flex-direction: row;
        margin: auto;
    }

    .action-links a {
        margin-right: 10px; /* Điều này tạo ra một khoảng trống giữa các liên kết */
    }
</style>
</head>


<%@include file="header.jsp" %>
<body >

    <div class="container" style="color: black;margin-top: 200px;">
        <h1 style="text-align: center;">Class List</h1>
        <div class="row " >  
            <div class="col-md-3">
                <form method="get" action="subject" style="margin-top: 30px;  ">
                    <input type="hidden" name="sortCate" value="${param.sortCate}">
                    <input type="hidden" name="sortStatus" value="${param.sortStatus}">
                    Search Class: <input placeholder="Search by name..." type="text" name="search" value="${param.search}">
                    <button class="btn btn-primary "> <i class="fa fa-search"></i> Search</button>
                </form>
            </div>
            <div class="col-md-3"> 
                <form method="GET" action="subject"  style="margin-top: 30px;">
                    Filter Subject:    
                    <input type="hidden" name="search" value="${param.search}" >
                    <input type="hidden" name="sortStatus" value="${param.sortStatus}" >
                    <select name="sortCate" onchange="this.form.submit()">
                        <option value=""> all</option>
                        <c:forEach var="sc" items="${requestScope.subjectSC}">
                            <option value="${sc.id}" ${param.sortCate == sc.id ? "selected" : ""} >${sc.name}</option>
                        </c:forEach>
                    </select>     
                </form>
            </div>
            <div class="col-md-3"> 
                <form method="GET" action="subject"  style="margin-top: 30px;">
                    Filter Status:   
                    <input type="hidden" name="search" value="${param.search}" >
                    <input type="hidden" name="sortCate" value="${param.sortCate}" >
                    <select name="sortStatus" onchange="this.form.submit()">
                        <option value="" > all</option>
                        <option value="1" ${param.sortStatus == "1" ? "selected" : ""} >Active</option>
                        <option value="0" ${param.sortStatus == "0" ? "selected" : ""} >Deactive</option>
                    </select>     
                </form>
            </div>
            <div class="col-md-3" >
                <a style="margin: 10px; margin-top: 20px;" href="CreateClass" class="btn btn-success float-right">
                    <i class="fa fa-plus"></i> New Class
                </a>
            </div>
        </div> 


        <div class="row">    
            <table class="table custom-table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>ID</th> 
                        <th>Name Class</th>
                        <th>Subject </th>
                        <th>Number of lessons</th>
                        <th>Teacher</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="s" items="${requestScope.subjectC}">
                        <tr>
                            <td>${s.course_id}</td>
                            <td>${s.name}</td>
                            <td>${s.cateName}</td>
                            <td>${s.lessons}</td>
                            <td>${s.user_name}</td>
                            <td>${s.status ? "Active" : "Deactive" }</td>
                              <td>
                                  <div class="action-links">
                                  <a href="classDetail?courseId=${s.course_id}">View</a>
                           <a href="editClass?courseId=${s.course_id}" style="margin: auto;">Edit</a>
                                  </div>
                                  </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

        </div>
        <div class="row ">
            <ul class="pagination justify-content-center">
                <li class="page-item disabled"><a class="page-link" href="subject?index=${i}">Previous</a></li>
                    <c:forEach begin="1" end="${totalPage}" var="i">
                    <li class="page-item"><a class="page-link" href="subject?index=${i}">${i}</a></li>
                    </c:forEach>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
        </div>
    </div>   
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
        integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
        integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous">
</script>
<jsp:include page="footer.jsp"/>
</html>