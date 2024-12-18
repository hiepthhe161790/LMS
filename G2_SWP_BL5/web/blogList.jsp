<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <title>BlogList</title>
        <link rel="stylesheet" href="./CSS/blogList.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
              integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
              crossorigin="anonymous" />
    </head>


    <c:if test="${param['index']==null }">   
        <c:set var = "index" scope = "page" value = "1"/>
    </c:if>
    <c:if test="${param['index']!=null}">
        <c:set var = "index" scope = "page" value = "${param['index']}"/>
    </c:if>
    <body>
        <%@include file="header.jsp" %>
        <div class="container" style="color: black;margin-top: 200px;">
            <div class="row">

                <div class="col-md-9">
                    <div style="width: 100%; margin-bottom: 10px; margin-left: 20px;">
                        <form method="get" action="blog">
                            <input type="hidden" name="search" value="${param.search}">
                            <input type="hidden" name="cid" value="${param.cid}">
                            <label style="font-size: 15px;">Sort: </label> <select name="sortType" style=" padding: 5px; font-size: 15px; border-radius: 10px;" onchange="this.form.submit()">
                                <option value="" >ALL</option>
                                <option value="1" ${param.sortType=="1"?"selected":""}>Title A-Z</option>
                                <option value="2" ${param.sortType=="2"?"selected":""}>Title Z-A</option>
                                <option value="3" ${param.sortType=="3"?"selected":""}>New release</option>
                            </select>  
                        </form>
                        <div class="col-md-12"> <!-- Chỉnh kích thước cột cho phần "Create New Blog" -->
                            <div style="width: 100%; margin-bottom: 10px; text-align: right;">
                                <a href="createBlogServlet" style="text-decoration: none;">
                                    <i class="fas fa-plus-circle"></i> <!-- Biểu tượng "plus-circle" từ Font Awesome -->
                                    New Blog
                                </a>
                            </div>
                        </div>
                    </div>

                    <section class="store">
                        <div class="container">
                            <div class="row">
                                <!-- Iterate through each blog -->
                                <c:forEach var="p" items="${blist}">
                                    <div class="col-md-12">
                                        <div class="card shadow-sm">
                                            <div class="card-body">
                                                <h3 style="text-align: center;">${p.title}</h3>
                                                <img style="width: 100% !important; height: 170px;" src="${p.image}">
                                                <p>Date: ${p.createDate}</p>
                                                <p class="card-text" style="height: 45px;">${p.brief_info}</p>
                                                <div class="">
                                                    <a href="blogdetail?bid=${p.blog_id}">
                                                        <button type="button" class="btn btn_detail" style="background: orange;"><i
                                                                class="fa fa-info-circle"></i> Details
                                                        </button>
                                                    </a>
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
                                <li class="page-item"><a href="./blog?sortType=${param['sortType']}&cid=${param['cid']}&index=1&search=${param['search']}" class="page-link"><i class="fa fa-angle-left" aria-hidden="true"></i></a></li>
                                <li class="page-item">
                                    <a href="./blog?sortType=${param['sortType']}&cid=${param['cid']}&index=${index-2}&search=${param['search']}" class="page-link ${index-2<1?"d-none":""}">${index-2}</a></li>
                                <li class="page-item">
                                    <a href="./blog?sortType=${param['sortType']}&cid=${param['cid']}&index=${index-1}&search=${param['search']}" class="page-link ${index-1<1?"d-none":""}">${index-1}</a></li>
                                <li class="page-item active">
                                    <a href="./blog?sortType=${param['sortType']}&cid=${param['cid']}&index=${index}&search=${param['search']}" class="page-link">${index}</a></li>
                                <li class="page-item">
                                    <a href="./blog?sortType=${param['sortType']}&cid=${param['cid']}&index=${index+1}&search=${param['search']}" class="page-link ${index+1>numberPage?"d-none":""}" >${index+1}</a></li>
                                <li class="page-item">
                                    <a href="./blog?sortType=${param['sortType']}&cid=${param['cid']}&index=${index+2}&search=${param['search']}" class="page-link ${index+2>numberPage?"d-none":""}">${index+2}</a></li>
                                <li><a href="./blog?sortType=${param['sortType']}&cid=${param['cid']}&index=${numberPage}&search=${param['search']}" class="page-link"><i class="fa fa-angle-right" aria-hidden="true"></i></a></li>
                            </ul>
                        </div>  
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="Blog-Nav">
                        <div>
                            <h2 style="text-align: center"> Search Blog:</h2>
                            <form method="get" action="blog" style="margin: 10px; width: 100%;">
                                <input type="hidden" name="sortType" value="${param.sortType}">
                                <input type="hidden" name="cid" value="${param.cid}">
                                <input style=" padding: 5px; font-size: 15px; border-radius: 10px;" type="text" name="search" value="${param.search}">
                                <button style=" padding: 5px 12px; font-size: 15px; border-radius: 10px;" type="submit" >Go</button>
                            </form>
                        </div>
                        <div>
                            <h2 style="text-align: center"> Categories</h2>
                            <ul class="side-bar"><a style="text-decoration: none; font-size: 18px; ${param.cid==""?"font-weight: bold":""}" href="blog?cid=&search=${param.search}&sortType=${param.sortType}"> All</a></ul>
                            <c:forEach var="c" items="${clist}">
                                <ul class="side-bar"><a style="text-decoration: none; font-size: 18px; ${param.cid==c.id?"font-weight: bold":""}" href="blog?cid=${c.id}&search=${param.search}&sortType=${param.sortType}"> ${c.name}</a></ul>
                            </c:forEach>   
                        </div>
                        <div>
                            <h2 style="text-align: center">   Latest posts </h2>
                            <c:forEach var="b" items="${top3}">

                                <div style="width: 100%; padding: 5px 25px;">
                                    <img style="width: 100%;height: auto;" src="${b.image}">
                                    <P style="text-align: center">${b.createDate}</P>
                                    <h3 style="text-align: center"><a style="text-decoration: none;" href="blogdetail?bid=${b.blog_id}">${b.title}</a></h3>
                                </div>
                            </c:forEach>   

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
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
