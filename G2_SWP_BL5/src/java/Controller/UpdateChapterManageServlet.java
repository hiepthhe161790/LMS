/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.ChapterDAO;
import Model.Chapter;
import Model.Subject;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Yen Do
 */
@WebServlet(name = "UpdateChapterManageServlet", urlPatterns = {"/updateChapter"})
public class UpdateChapterManageServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateChapterManageServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateChapterManageServlet at " + request.getContextPath() + "</h1>");
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
        response.setContentType("application/json;charset=UTF-8");
        ChapterDAO dao = new ChapterDAO();
        int chapterId = Integer.parseInt(request.getParameter("chapterId"));
        Chapter getContactByID = dao.getChapterById(chapterId);
        Gson gson = new Gson();
        String json = gson.toJson(getContactByID);

        response.getWriter().write(json);
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
            int chapterId = Integer.parseInt(request.getParameter("chapterId"));
            String chapterName = request.getParameter("chapterName");
            int chapterOrder = Integer.parseInt(request.getParameter("chapterOrder"));
            int subjectId = Integer.parseInt(request.getParameter("subject"));
            String status = request.getParameter("status");

            Chapter chapter = new Chapter();
            chapter.setChapterId(chapterId);
            chapter.setChapterName(chapterName);
            chapter.setChapterOrder(chapterOrder);

            Subject subjectType = new Subject();
            subjectType.setId(subjectId);
            chapter.setSubjectType(subjectType);
            chapter.setStatus(status);
            boolean success = dao.updateChapter(chapter);

            if (success) {
                response.sendRedirect("chapterManage");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
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