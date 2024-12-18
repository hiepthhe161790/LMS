<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Test Page</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                padding: 20px;
            }

            .mt-3 {
                margin-top: 1rem;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2 class="mt-3">Registrations for Class</h2>
            <c:set var="courseId" value="${param.courseId}" />

            <c:if test="${not empty registrations}">
                <div class="table-responsive mt-3">
                    <table class="table table-bordered table-hover">
                        <thead class="thead-light">
                            <tr>
                                <th scope="col" style="background: #f3f3f3;">Registration ID</th>
                                <th scope="col" style="background: #f3f3f3;">Course Name</th>
                                <th scope="col" style="background: #f3f3f3;">User Name</th>
                                <th scope="col" style="background: #f3f3f3;">Created</th>
                                <th scope="col" style="background: #f3f3f3;">Registration Status</th>
                                <th scope="col" style="background: #f3f3f3;">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="registration" items="${registrations}">
                                <tr>
                                    <td>${registration.registration_id}</td>
                                    <td>${registration.course_id.name}</td>
                                    <td>${registration.user_id.fullName}</td>
                                    <td>${registration.created}</td>
                                    <td>${registration.regis_status}</td>
                                    <td>
                                       
                                                        <a href="updateRegistrationStatusServlet?registrationId=${registration.registration_id}" class="btn btn-danger">Off</a>
                                          <a href="aUpdateRegistrationStatusServlet?registrationId=${registration.registration_id}" class="btn btn-danger">On</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>

            <c:if test="${empty registrations}">
                <div class="alert alert-info mt-3" role="alert">
                    There are no students for this class. Please add new students.
                </div>
            </c:if>

            <div class="mt-3">
                <a href="addListTrainee?courseId=${courseId}" class="btn btn-primary">Add Trainee</a>
            </div>
        </div>

        <!-- Bootstrap JS and Popper.js for interactive components -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
