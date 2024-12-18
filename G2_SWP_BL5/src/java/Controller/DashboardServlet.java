/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.DashboardDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;

/**
 *
 * @author VIETHUNG
 */
@WebServlet(name="DashboardServlet", urlPatterns={"/dashboard"})
public class DashboardServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Khởi tạo DAO và kết nối cơ sở dữ liệu (connection) - cần thay thế phần này
        DashboardDAO dashboardDAO = new DashboardDAO(/*your connection here*/);

        // Lấy thông tin từ DAO
        int userCount = 0;
        int classCount = 0;
        int blogCount = 0;
        int contactCount = 0;
        try {
            userCount = dashboardDAO.countUsers();
            classCount = dashboardDAO.countClasses();
            blogCount = dashboardDAO.countBlogs();
            contactCount = dashboardDAO.countContacts();
        } catch (Exception e) {
            e.printStackTrace();
            // Xử lý ngoại lệ nếu cần
        }

        // Lưu các thông tin vào attributes của request để truyền sang JSP
        request.setAttribute("userCount", userCount);
        request.setAttribute("classCount", classCount);
        request.setAttribute("blogCount", blogCount);
        request.setAttribute("contactCount", contactCount);

        // Chuyển hướng (forward) request và response tới JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
        dispatcher.forward(request, response);
    }

}
