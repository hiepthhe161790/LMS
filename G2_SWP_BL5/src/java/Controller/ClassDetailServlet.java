/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.classDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Model.Class;
/**
 *
 * @author VIETHUNG
 */
@WebServlet(name="ClassDetailServlet", urlPatterns={"/classDetail"})
public class ClassDetailServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy courseId từ request parameter
        int courseId = Integer.parseInt(request.getParameter("courseId"));

        // Gọi phương thức findByClassId để lấy thông tin lớp học
        classDAO classDAO = new classDAO();
        Class classDetail = classDAO.findByClassIdToName(courseId);

        if (classDetail != null) {
            // Đặt thông tin lớp học vào attribute để hiển thị trên trang JSP
            request.setAttribute("classDetail", classDetail);

            // Chuyển hướng đến trang JSP để hiển thị thông tin chi tiết lớp học
            request.getRequestDispatcher("classDetail.jsp").forward(request, response);
        } else {
            // Xử lý nếu không tìm thấy thông tin lớp học
            response.sendRedirect("subjectList.jsp");
        }
    }

}
