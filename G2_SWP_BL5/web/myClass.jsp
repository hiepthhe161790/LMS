

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./CSS/blogList.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
              integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
              crossorigin="anonymous" />
    </head>
    <body>        
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="Blog-Nav">
                        <div>
                            <h1>My Class</h1>
                            Progress
                            <br><select id="" name="" style="padding: 7px;">
                                <option value="">Not yet</option>
                                <option value="">In progress</option>                                
                                <option value="">Done</option>                                
                            </select>
                        </div>

                    </div>
                </div>
                <div class="col-md-9">                   
                    <section class="store">
                        <div class="container">
                            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-3 g-3"  style="height: 100%;">

                                <c:forEach var="o" items="${listCC}">
                                    
                                        <div class="col">
                                            <div class="card shadow-sm">
                                                <div class="card-body">
                                                    <h3 style="text-align: center;">${o.course_id.name}</h3>
                                                    <img style="width: 100% !important; height: 170px;"  src="${o.course_id.image}">                                                
                                                    <p class="card-text" style="height: 45px;">${o.course_id.brief_infor}</p>
                                                    <p>Progress: </p>
                                                    <div class="">                           
                                                        <a  href=""><button type="button" class="btn btn_detail "><i class="fa fa-info-circle"></i>
                                                                Start course </button> </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    
                                </c:forEach>  
                            </div>
                        </div>
                    </section>                    
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
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
