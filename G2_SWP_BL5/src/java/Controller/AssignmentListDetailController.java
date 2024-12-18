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
@WebServlet("/assignmentListDetail")

public class AssignmentListDetailController extends HttpServlet {

    private AssignmentSubmissionDAO assignmentSubmissionDAO = new AssignmentSubmissionDAO();
    private AssignmentDAO assignmentDAO = new AssignmentDAO();
    private UserDAO userDAO = new UserDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String assignmentId = request.getParameter("assignment_id");
            if (assignmentId == null || assignmentId.isEmpty()) {
                // Handle invalid or missing parameters
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid or missing assignment_id parameter");
                return;
            }

            int submissionId = Integer.parseInt(assignmentId);
            String search = request.getParameter("search") == null ? "" : request.getParameter("search");
            List<AssignmentSubmission> submission = assignmentSubmissionDAO.getListAssignmentSubmissionByAssignmentID(submissionId,search);

            if (submission == null) {
                // Handle the case where no submission is found for the given ID
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "No submission found for the given ID");
                return;
            }
            String assignmentName = assignmentDAO.getAssignmentById(submissionId).getAssignmentName();
            request.setAttribute("submissionList", submission);
            request.setAttribute("assignmentName", assignmentName);
            request.setAttribute("uDAO", userDAO);
            request.getRequestDispatcher("./admin/admin_assignment_list_detail.jsp").forward(request, response);
        } catch (IOException ex) {
            ex.printStackTrace(); // Handle the exception appropriately
        }
    }

}
