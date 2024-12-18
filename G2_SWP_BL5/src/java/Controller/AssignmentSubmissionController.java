/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Common.Constant;
import DAO.AssignmentDAO;
import DAO.AssignmentSubmissionDAO;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import Model.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;

/**
 *
 * @author THTP
 */
@WebServlet("/assignmentSubmission")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 50) // 50 MB
public class AssignmentSubmissionController extends HttpServlet {
    
    private AssignmentDAO aDAO = new AssignmentDAO();
    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String assignmentId = req.getParameter("assignment_id");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        if (user.getRole_id() == Integer.parseInt(Constant.USER_LEARNER)) {
            Assignment ass = aDAO.getAssignmentById(Integer.parseInt(assignmentId));
            req.setAttribute("ass", ass);
            req.getRequestDispatcher("/assignment.jsp").forward(req, resp);
        }
    }
    
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Get other form parameters
        String comments = req.getParameter("comments");
        String assignmentId = req.getParameter("assignment_id");

        // Get the Part for the file
        Part filePart = req.getPart("file");

        // Lấy tên tệp
        String fileName = getSubmittedFileName(filePart);

        // Lấy đuôi của tệp
        String fileExtension = getFileExtension(fileName);

        // Convert the InputStream of the file to byte array
        byte[] fileBytes = getByteArrayFromInputStream(filePart.getInputStream());

        // Determine the file type using Apache Tika
        // Determine the file extension based on the detected content type
//        String fileExtension = getFileExtension(fileType);
        // Set a preferred file extension if it is known
//        if ("application/pdf".equals(fileType)) {
//            fileExtension = "pdf";
//        } else if ("application/vnd.openxmlformats-officedocument.wordprocessingml.document".equals(fileType)) {
//            fileExtension = "docx";
//        } // Add more cases for other known file types
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        // Create an AssignmentSubmission object
        AssignmentSubmission submission = new AssignmentSubmission();
        submission.setAssignmentId(Integer.parseInt(assignmentId));
        submission.setSubmitFile(fileBytes);
        submission.setSubmitComment(comments);
        submission.setStudentId(user.getRole_id());
        submission.setSubmitFileContextType(fileExtension); // Store the file extension in the database

        // Save the submission to the database using your DAO method
        AssignmentSubmissionDAO assignmentSubmissionDAO = new AssignmentSubmissionDAO();
        assignmentSubmissionDAO.addAssignmentSubmission(submission);

        resp.getWriter().print("<script>\n"
                + "	alert(\"Submit assignment successfully\");\n"
                + "	window.location = \"./classdashboard\";\n"
                + "</script>");
    }
    
    private String getSubmittedFileName(Part part) {
        String header = part.getHeader("content-disposition");
        for (String headerPart : header.split(";")) {
            if (headerPart.trim().startsWith("filename")) {
                return headerPart.substring(headerPart.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    // Phương thức để lấy đuôi của tệp
    private String getFileExtension(String fileName) {
        if (fileName != null && fileName.lastIndexOf(".") != -1) {
            return fileName.substring(fileName.lastIndexOf(".") + 1);
        }
        return null;
    }

//    // Method to get file extension from content type
//    private String getFileExtension(String contentType) {
//        // Map content type to file extension
//        switch (contentType) {
//            case "application/x-tika-ooxml":
//                return contentType;
//            case "application/vnd.openxmlformats-officedocument.wordprocessingml.document":
//                return contentType;
//            // Add more cases for other known file types
//            default:
//                return contentType; // Default to a generic extension if unknown
//        }
//    }
    private byte[] getByteArrayFromInputStream(InputStream inputStream) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];
        int bytesRead;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            byteArrayOutputStream.write(buffer, 0, bytesRead);
        }
        return byteArrayOutputStream.toByteArray();
    }
    
}
