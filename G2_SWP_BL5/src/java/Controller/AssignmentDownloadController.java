/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.AssignmentSubmissionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import Model.*;
import java.io.OutputStream;

/**
 *
 * @author THTP
 */
@WebServlet("/assignmentDownload")

public class AssignmentDownloadController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the assignmentSubmissionId from the request parameters
        String submissionIdParam = request.getParameter("submissionId");
        if (submissionIdParam == null || submissionIdParam.isEmpty()) {
            // Handle invalid or missing parameters
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid or missing submissionId parameter");
            return;
        }

        int submissionId = Integer.parseInt(submissionIdParam);

        // Retrieve the file data and metadata from the database using your DAO method
        AssignmentSubmissionDAO assignmentSubmissionDAO = new AssignmentSubmissionDAO();
        AssignmentSubmission submission = assignmentSubmissionDAO.getAssignmentSubmissionById(submissionId);

        if (submission == null) {
            // Handle the case where no submission is found for the given ID
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "No submission found for the given ID");
            return;
        }

        // Get content type using Apache Tika
        String contentType = submission.getSubmitFileContextType();

        // Set the response headers based on the content type
        response.setContentType(contentType);
        response.setContentLength(submission.getSubmitFile().length);
        response.setHeader("Content-Disposition", "attachment; filename=\"" + submission.getSubmitComment() + "." + contentType + "\"");

        // Write the file content to the response output stream
        try ( OutputStream out = response.getOutputStream()) {
            out.write(submission.getSubmitFile());
        } catch (IOException ex) {
            ex.printStackTrace(); // Handle the exception appropriately
        }
    }


}
