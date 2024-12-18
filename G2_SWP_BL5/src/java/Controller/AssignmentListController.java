/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import Model.*;
import java.util.List;

/**
 *
 * @author THTP
 */
@WebServlet("/assignmentList")

public class AssignmentListController extends HttpServlet {

    private final AssignmentDAO assignmentDAO = new AssignmentDAO();
    private final LessonDao lessonDao = new LessonDao();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            List<Assignment> assignments = assignmentDAO.getAllAssignments();

            if (assignments == null) {
                // Handle the case where no submission is found for the given ID
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "No submission found for the given ID");
                return;
            }
            request.setAttribute("assignmentList", assignments);
            request.setAttribute("lessonDAO", lessonDao);
            request.getRequestDispatcher("./admin/admin_assignment_list.jsp").forward(request, response);
        } catch (IOException ex) {
            ex.printStackTrace(); // Handle the exception appropriately
        }
    }

}
