/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.registrationDAO;
import Model.Registration;
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
 * @author VIETHUNG
 */
@WebServlet(name="AlistTrainee", urlPatterns={"/listTrainee"})
public class AlistTrainee extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AlistTrainee</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AlistTrainee at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    // Lấy giá trị của tham số courseId từ URL
    String courseIdParam = request.getParameter("courseId");

    // Kiểm tra xem tham số có tồn tại hay không
    if (courseIdParam != null && !courseIdParam.isEmpty()) {
        try {
            // Chuyển đổi giá trị từ chuỗi sang số nguyên
            int courseId = Integer.parseInt(courseIdParam);

            // Gọi hàm getRegistrationsByCourseId từ registrationDAO
            registrationDAO registrationDao = new registrationDAO();
            List<Registration> registrations = registrationDao.getRegistrationsByCourseId(courseId);

            // Đặt danh sách registrations vào thuộc tính của request
            request.setAttribute("registrations", registrations);

            // Chuyển hướng đến trang JSP để hiển thị kết quả
            request.getRequestDispatcher("AtestPage.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            // Xử lý lỗi nếu không thể chuyển đổi thành số nguyên
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid courseId parameter");
        }
    } else {
        // Xử lý trường hợp courseId không được cung cấp
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing courseId parameter");
    }
}


    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
