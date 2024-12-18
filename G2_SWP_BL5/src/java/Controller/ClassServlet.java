/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;


import DAO.classDAO;
import Model.Subject;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import Model.Class;

@WebServlet(name = "SubjectServlet", urlPatterns = {"/subject"})
public class ClassServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {

            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SubjectServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubjectServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        String sname = request.getParameter("search") == null ? "" : request.getParameter("search");
        String sortCate = request.getParameter("sortCate") == null ? "" : request.getParameter("sortCate");
        String sortStatus = request.getParameter("sortStatus") == null ? "" : request.getParameter("sortStatus");
        String index = request.getParameter("index") == null ? "1" : request.getParameter("index");
        classDAO dtb = new classDAO();
//        int count = dtb.getTotalSubject();
//        int numberPage = count/10;
//        if(count % 10 !=0){
//            numberPage++;
//        }
            
        try {
            int index_page = Integer.parseInt(index);
            int totalPage = (int)Math.ceil((double)dtb.getTotalSubject() / 8);
            request.setAttribute("totalPage", totalPage);
            List<Subject> listSC = dtb.getFilterCate();
            request.setAttribute("subjectSC", listSC);
            List<Class> listC  = dtb.getSubjectList(sname, sortCate, sortStatus, index_page);
            request.setAttribute("subjectC", listC);
// request.getRequestDispatcher("./teacher/admin-books.jsp").forward(request, response);
            request.getRequestDispatcher("subjectList.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
