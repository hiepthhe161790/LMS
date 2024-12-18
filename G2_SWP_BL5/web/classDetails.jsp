<%-- 
    Document   : courseDetail
    Created on : Jun 5, 2023, 11:10:07 PM
    Author     : admin
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.3/js/bootstrap.min.js" integrity="sha512-1/RvZTcCDEUjY/CypiMz+iqqtaoQfAITmNSJY17Myp4Ms5mdxPS5UV7iOfdZoxcGhzFbOm6sntTKJppjvuhg4g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.3/css/bootstrap.min.css" integrity="sha512-SbiR/eusphKoMVVXysTKG/7VseWii+Y3FdHrt0EpKgpToZeemhqHeZeLWLhJutz/2ut2Vw1uQEj2MbRF+TVBUA==" crossorigin="anonymous" referrerpolicy="no-referrer" />     
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="style/detail.css">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Class Detail</title>
    </head>

    <body>

        <div class="container" style="margin-top:50px">
            <div class="row">
                <div class="col-md-3">
                    <div class="Blog-Nav">
                        <div>
                            <h2 style="text-align: center"> Search Course:</h2>
                            <form method="get" action="courses" style="margin: 10px; width: 100%;">
                                <input type="hidden" name="sortType" value="${param.sortType}">
                                <input type="hidden" name="cid" value="${param.cid}">
                                <input style=" padding: 5px; font-size: 15px; border-radius: 10px;" placeholder="Search by name..." type="text" name="search" value="${param.search}">
                                <button style=" padding: 5px 12px; font-size: 15px; border-radius: 10px;" type="submit" >Go</button>
                            </form>
                        </div>
                        <div>
                            <h2 style="text-align: center"> Categories</h2>
                            <ul class="side-bar"><a style="text-decoration: none; font-size: 18px; ${param.cid==""?"font-weight: bold":""}" href="courses?cid=&search=${param.search}&sortType=${param.sortType}"> All</a></ul>
                            <c:forEach var="c" items="${clist}">
                                <ul class="side-bar"><a style="text-decoration: none; font-size: 18px; ${param.cid==c.id?"font-weight: bold":""}" href="courses?cid=${c.id}&search=${param.search}&sortType=${param.sortType}"> ${c.name}</a></ul>
                            </c:forEach>   
                        </div>
                        <div>
                            <h2 style="text-align: center">   Latest Class </h2>
                            <c:forEach var="b" items="${top3}">
                                <div style="width: 100%; padding: 5px 25px;">
                                    <img style="width: 100%;height: auto;" src="${b.image}">
                                    <p style="text-align: center;">${b.cateName} </p>
                                   

                                    <h3 style="text-align: center"><a style="text-decoration: none;" href="coursesdetail?bid=${b.course_id}">${b.title}</a></h3>
                                </div>
                            </c:forEach>   

                        </div>
                    </div>
                </div>
                <div class="col-md-9" >
                 <div class="course-container">
    <div class="course-info">
        <h1 class="course-name">${course.name}</h1>
        <h2 class="course-title">${course.title}</h2>
        <p class="course-description">${course.brief_infor}</p>
        <div class="register-button">
            <c:if test="${checkRegister eq false}">
                <button class="register-btn" onclick="showModal('registerCourseModal')">Learn Class</button>
            </c:if>
        </div>
    </div>
    <div class="course-image">
        <img src="https://www.aeccglobal.in/images/easyblog_articles/213/bsc-computer-science.webp">
    </div>
</div>
                </div>
                <!-- Register Course Modal -->
                <div class="modal" id="registerCourseModal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Learn Class</h5>

                            </div>
                            <div class="modal-body">
                                <form method="POST" action="register">
                                    <input type="hidden" value="${course.course_id}" name="courseId">
                                    Choose your price packages: 
                                    <select name="price_packageId">
                                        <c:forEach items="${price_packages}" var="pp">
                                            <option value="${pp.id}">${pp.price}/${pp.duration}</option>
                                        </c:forEach>
                                    </select>
                                    <button>Learn</button>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" onclick="hideModal('registerCourseModal')">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>       
        </div>   

    </body>

    <script>
        function showModal(modalId) {
            document.getElementById(modalId).style.display = "block";
        }

        function hideModal(modalId) {
            document.getElementById(modalId).style.display = "none";
        }
    </script>
    <jsp:include page="footer.jsp"/>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
        integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
        integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous">
</script>
</html>