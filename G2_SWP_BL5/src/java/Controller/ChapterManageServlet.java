/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.ChapterDAO;
import Model.Chapter;
import Model.Subject;
import jakarta.servlet.RequestDispatcher;
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
@WebServlet(name = "ChapterManageServlet", urlPatterns = {"/chapterManage"})
public class ChapterManageServlet extends HttpServlet {

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
            out.println("<title>Servlet ChapterManageServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChapterManageServlet at " + request.getContextPath() + "</h1>");
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
            ChapterDAO dao = new ChapterDAO();
            String searchName = request.getParameter("searchName");
            int page = 1;
            int pageSize = 5;

            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }

            List<Chapter> listAllChapter;
            int totalContacts;

            if (searchName != null && !searchName.isEmpty()) {
                listAllChapter = dao.getAllChapter(searchName, page, pageSize);
                totalContacts = dao.getTotalChapter(searchName);
            } else {
                listAllChapter = dao.getAllChapter(page, pageSize);
                totalContacts = dao.getTotalChapter();
            }
            List<Subject> listAllSubject = dao.getAllSubject();

            int numPages = (int) Math.ceil((double) totalContacts / pageSize);
            request.setAttribute("numPages", numPages);
            request.setAttribute("getAllChapter", listAllChapter);
            request.setAttribute("listAllSubject", listAllSubject);
            request.setAttribute("currentPage", page);
            request.setAttribute("searchName", searchName);
            request.getRequestDispatcher("./teacher/manage_chapter.jsp").forward(request, response);
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
        ChapterDAO dao = new ChapterDAO();
        try {
            String chapterName = request.getParameter("chapterName");
            String subject = request.getParameter("subject");
            String chapterOrder_row = request.getParameter("chapterOrder");
            String status = request.getParameter("status");

            String msgChapterName = "";
            String msgSubject = "";
            String msgChapterOrder = "";
            if (chapterName == null || chapterName.trim().isEmpty()) {
                msgChapterName = "Error: Chapter Name is required!";
                request.setAttribute("msgChapterName", msgChapterName);
            }
            if (subject == null || subject.trim().isEmpty()) {
                msgSubject = "Error: Please Select Subject!";
                request.setAttribute("msgSubject", msgSubject);
            }
            if (chapterOrder_row == null || chapterOrder_row.trim().isEmpty()) {
                msgChapterOrder = "Error: Chapter Order is required!";
                request.setAttribute("msgChapterOrder", msgChapterOrder);
            } else {
                int subjectId = Integer.parseInt(subject);
                int chapterOrder = Integer.parseInt(chapterOrder_row);
                Subject subjectType = new Subject();
                subjectType.setId(subjectId);
                Chapter chapter = new Chapter(0, chapterName, chapterOrder, subjectType, status);
                boolean result = dao.createChapter(chapter);
                if (result) {
                    request.setAttribute("updateSuccess", true);
                    request.setAttribute("res", "success");

                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<Subject> listAllSubject = dao.getAllSubject();
        request.setAttribute("listAllSubject", listAllSubject);
        RequestDispatcher dispatcher = request.getRequestDispatcher("./teacher/manage_chapter.jsp");
        dispatcher.forward(request, response);
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
