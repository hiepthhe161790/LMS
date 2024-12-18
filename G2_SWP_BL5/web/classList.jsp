<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%-- 
    Document   : BlogList.jsp
    Created on : May 28, 2023, 12:10:28 AM
    Author     : ACER
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width,initial-scale=1" />
        <title>Course List</title>
        <link rel="stylesheet" type="text/css" href="style/classesList.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
              integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
              crossorigin="anonymous" />
    </head>
    <%--<%@include file="header.jsp" %>--%> 
  
    <c:if test="${param['index']==null }">   
        <c:set var = "index" scope = "page" value = "1"/>
    </c:if>
    <c:if test="${param['index']!=null}">
        <c:set var = "index" scope = "page" value = "${param['index']}"/>
    </c:if>
    <body>
 <h1 style="text-align: center">Welcome to LEARNER</h1>
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="Blog-Nav">
                        <div>
                            <h2 style="text-align: center"> Search Class:</h2>
                            <form method="get" action="classes" style="margin: 10px; width: 100%;">
                                <input type="hidden" name="sortType" value="${param.sortType}">
                                <input type="hidden" name="cid" value="${param.cid}">
                                <input style=" padding: 5px; font-size: 15px; border-radius: 10px;" placeholder="Search by name..." type="text" name="search" value="${param.search}">
                                <button style=" padding: 5px 12px; font-size: 15px; border-radius: 10px;" type="submit" >Go</button>
                            </form>
                        </div>
                        <div style="border: 2px solid black; ">
                            <h2 style="text-align: center"> Subjects</h2>
                            <ul class="side-bar"><a style="text-decoration: none; font-size: 18px; ${param.cid==""?"font-weight: bold":""}" href="classes?cid=&search=${param.search}&sortType=${param.sortType}"> All</a></ul>
                            <c:forEach var="c" items="${clist}">
                                <ul class="side-bar"><a style="text-decoration: none; font-size: 18px; ${param.cid==c.id?"font-weight: bold":""}" href="classes?cid=${c.id}&search=${param.search}&sortType=${param.sortType}"> ${c.name}</a></ul>
                            </c:forEach>   
                        </div>
                        <div>
                            <h2 style="text-align: center">   Featured </h2>
                            <c:forEach var="b" items="${top3}">
                                <div style="width: 100%; padding: 5px 25px;">
                                    <img style="width: 100%;height: auto;" src="https://www.aeccglobal.in/images/easyblog_articles/213/bsc-computer-science.webp">
                                    <p style="text-align: center;">${b.cateName} </p>
                                    

                                    <h3 style="text-align: center">${b.title}</h3>
                                </div>
                            </c:forEach>   

                        </div>
                    </div>
                </div>
                <div class="col-md-9">
                    <div style="width: 100%; margin-bottom: 10px; margin-left: 20px;">
                        <form method="get" action="classes">
                            <input type="hidden" name="search" value="${param.search}">
                            <input type="hidden" name="cid" value="${param.cid}">
                            <label style="font-size: 15px;">Sort: </label> <select name="sortType" style=" padding: 5px; font-size: 15px; border-radius: 10px;" onchange="this.form.submit()">
                                <option value="" >ALL</option>
                                <option value="1" ${param.sortType=="1"?"selected":""}>Title A-Z</option>
                                <option value="2" ${param.sortType=="2"?"selected":""}>Title Z-A</option>
                                <option value="3" ${param.sortType=="3"?"selected":""}>New release</option>
                            </select>  
                        </form>
                    </div>

                    <section class="store">
                        <div class="container">
                            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-3 g-3">
                                <c:forEach var="p" items="${listC}">
                                    <div class="col">
                                        <div class="card shadow-sm">
                                            <div class="card-body">
                                                <h3 style="text-align: center; height: 42px; font-size: large;">${p.title}</h3>
                                            
                                                <img style="width: 100% !important; height: 170px;"  src="https://www.aeccglobal.in/images/easyblog_articles/213/bsc-computer-science.webp"">
                                                <p style="text-align: center;">${p.cateName} </p>

                                                
                                                <p class="card-text" style="height: 45px; overflow: hidden;">${p.brief_infor}</p>
                                                <div class="button-content" >                           
                                                    <a  href="classDetails?courseId=${p.course_id}">  <button type="button" class="btn btn-primary" style=" background-color: #000000; border-color: #49454d;"><i class="fa fa-info-circle"></i>
                                                             Details</button> </a>
                                                             
                                                    <a  href="course/register?courseId=${p.course_id}"><button type="button" class="btn btn-success " style=" background-color: #fc8137; border-color: #df691c;"><i class='fa fa-registered'></i>
                                                            Learn </button> </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>  
                            </div>

                        </div>
                    </section>
                    <div  style="margin-left: 40%; padding: 20px;">
                        <div class="pagination-arena">
                            <ul class="pagination">
                                <li class="page-item"><a href="./classes?sortType=${param['sortType']}&cid=${param['cid']}&index=1&search=${param['search']}" class="page-link"><i class="fa fa-angle-left" aria-hidden="true"></i></a></li>
                                <li class="page-item">
                                    <a href="./classes?sortType=${param['sortType']}&cid=${param['cid']}&index=${index-2}&search=${param['search']}" class="page-link ${index-2<1?"d-none":""}">${index-2}</a></li>
                                <li class="page-item">
                                    <a href="./classes?sortType=${param['sortType']}&cid=${param['cid']}&index=${index-1}&search=${param['search']}" class="page-link ${index-1<1?"d-none":""}">${index-1}</a></li>
                                <li class="page-item active">
                                    <a href="./classes?sortType=${param['sortType']}&cid=${param['cid']}&index=${index}&search=${param['search']}" class="page-link">${index}</a></li>
                                <li class="page-item">
                                    <a href="./classes?sortType=${param['sortType']}&cid=${param['cid']}&index=${index+1}&search=${param['search']}" class="page-link ${index+1>numberPage?"d-none":""}" >${index+1}</a></li>
                                <li class="page-item">
                                    <a href="./classes?sortType=${param['sortType']}&cid=${param['cid']}&index=${index+2}&search=${param['search']}" class="page-link ${index+2>numberPage?"d-none":""}">${index+2}</a></li>
                                <li><a href="./classes?sortType=${param['sortType']}&cid=${param['cid']}&index=${numberPage}&search=${param['search']}" class="page-link"><i class="fa fa-angle-right" aria-hidden="true"></i></a></li>
                            </ul>
                        </div>  
                    </div>
                </div>
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
</html>
