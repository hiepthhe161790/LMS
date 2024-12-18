<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>BlogDetail</title>
        <link href="CSS/blogList.css" rel="stylesheet">
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
                    <div>
                        <h1 style="text-align: center;">${b.title}</h1>
                        <div class="text-center">
                            <div style="display: inline-block; margin-right: 20px;">
                                <p style="font-size: 13px; margin-bottom: 0;">By ${authorName}</p>
                            </div>
                            <div style="display: inline-block; margin-right: 20px;">
                                <p style="font-size: 13px; margin-bottom: 0;">Date: ${b.createDate}</p>
                            </div>
                            
                            <div style="display: inline-block;">
                                <p style="font-size: 18px; margin-bottom: 0;"> <c:if test="${user ne null}">

                            <c:if test="${user.userID eq b.author}">

                                <a href="loadBlog?bid=${b.blog_id}">
                                    <button type="button" class="btn btn_detail" style="background: orange;"><i class="fa fa-info-circle"></i> Edit
                                    </button>
                                </a>
                                <a href="updateStatusBlog?blogId=${b.blog_id}" onclick="return confirmDelete();">
                                    <button type="button" class="btn btn_detail" style="background: #C88E00;"><i class="fa fa-info-circle"></i> Delete</button>
                                </a>
                            </c:if>
                        </c:if>
</p>
                            </div>
                        </div>
                        <img src="${b.image}" style="padding: 20px 50px;width: 100% !important; height: auto;" >                  
                        <p style="font-size: 13px;padding: 20px 50px;width: 100% !important;overflow: hidden;">
                            ${b.blog_content}
                        </p>
                       
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
                            <c:forEach var="ba" items="${top3}">

                                <div style="width: 100%; padding: 5px 25px;">
                                    <img style="width: 100%;height: auto;" src="${ba.image}">
                                    <P style="text-align: center">${ba.createDate}</P>
                                    <h3 style="text-align: center"><a style="text-decoration: none;" href="blogdetail?bid=${ba.blog_id}">${ba.title}</a></h3>
                                </div>
                            </c:forEach>   

                        </div>
                    </div>
                </div>

            </div>  
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete this blog?");
        }
    </script>
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
