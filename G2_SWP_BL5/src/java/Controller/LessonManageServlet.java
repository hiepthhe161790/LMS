/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.ChapterDAO;
import DAO.LessonDao;
import Model.Lesson;
import Model.Subject;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Yen Do
 */
@WebServlet(name = "LessonManageServlet", urlPatterns = {"/lessonManage"})
public class LessonManageServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LessonManageServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LessonManageServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            LessonDao dao = new LessonDao();
            ChapterDAO chapterDao = new ChapterDAO();
            String subjectId_row = request.getParameter("subject");
            String status = request.getParameter("status");
            String searchName = request.getParameter("searchName");

            System.out.println("subjectId: " + subjectId_row);
            System.out.println("status: " + status);
            System.out.println("searchName: " + searchName);

            int page = 1;
            int pageSize = 5;

            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }

            List<Lesson> listAllLesson;
            int totalContacts;

            if (subjectId_row != null && !subjectId_row.isEmpty() && status != null && !status.isEmpty() && searchName != null && !searchName.isEmpty()) {
                int subjectId = Integer.parseInt(subjectId_row);
                listAllLesson = dao.getAllLesson(subjectId, status, searchName, page, pageSize);
                totalContacts = dao.getTotalLesson(subjectId, status, searchName);
            } else if (subjectId_row != null && !subjectId_row.isEmpty() && (status == null || status.isEmpty()) && (searchName == null || searchName.isEmpty())) {
                int subjectId = Integer.parseInt(subjectId_row);
                System.out.println("Trường hợp SubjectID");
                listAllLesson = dao.getAllLesson(subjectId, null, null, page, pageSize);
                totalContacts = dao.getTotalLesson(subjectId, null, null);
            } else if ((subjectId_row == null || subjectId_row.isEmpty()) && status != null && !status.isEmpty() && (searchName == null || searchName.isEmpty())) {
                listAllLesson = dao.getAllLesson(0, status, null, page, pageSize);
                totalContacts = dao.getTotalLesson(0, status, null);
            } else if ((subjectId_row == null || subjectId_row.isEmpty()) && (status == null || status.isEmpty()) && searchName != null && !searchName.isEmpty()) {
                listAllLesson = dao.getAllLesson(0, null, searchName, page, pageSize);
                totalContacts = dao.getTotalLesson(0, null, searchName);
            } else if (subjectId_row != null && !subjectId_row.isEmpty() && status != null && !status.isEmpty() && (searchName == null || searchName.isEmpty())) {
                int subjectId = Integer.parseInt(subjectId_row);
                listAllLesson = dao.getAllLesson(subjectId, status, null, page, pageSize);
                totalContacts = dao.getTotalLesson(subjectId, status, null);
            } else {
                listAllLesson = dao.getAllLesson(page, pageSize);
                totalContacts = dao.getTotalLesson();
            }
            List<Subject> listAllSubject = chapterDao.getAllSubject();

            int numPages = (int) Math.ceil((double) totalContacts / pageSize);
            request.setAttribute("numPages", numPages);
            request.setAttribute("getAllLesson", listAllLesson);
            request.setAttribute("listAllSubject", listAllSubject);
            System.out.println("getAllLesson: " + listAllLesson);
            request.setAttribute("currentPage", page);
            request.setAttribute("searchName", searchName);
            request.setAttribute("selectedSubjectId", subjectId_row);
            request.setAttribute("selectedStatus", status);
            request.getRequestDispatcher("./teacher/manage_lesson.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
