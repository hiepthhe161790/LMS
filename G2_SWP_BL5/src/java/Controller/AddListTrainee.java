/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.UserDAO;
import DAO.registrationDAO;
import Model.Registration;
import Model.User;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author VIETHUNG
 */
@WebServlet(name="AddListTrainee", urlPatterns={"/addListTrainee"})
public class AddListTrainee extends HttpServlet {
   
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
            out.println("<title>Servlet AddListTrainee</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddListTrainee at " + request.getContextPath () + "</h1>");
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
        try {
            // Lấy courseId từ request (thay thế 1 bằng cách lấy từ request theo nhu cầu của bạn)
            int courseId = Integer.parseInt(request.getParameter("courseId"));;

            // Gọi hàm để lấy danh sách user_id và name của user
            UserDAO userDAO = new UserDAO();
            List<User> userList = userDAO.getAllUser();

            // Lấy danh sách đăng ký cho khóa học
            registrationDAO registrationDAOo = new registrationDAO();
            List<Registration> registrations = registrationDAOo.getRegistrationsByCourseId(courseId);

            // Đánh dấu người dùng đã đăng ký trong danh sách
            for (User user : userList) {
                for (Registration registration : registrations) {
                    // Chuyển đổi user.getUserID() sang String để so sánh
                    if (String.valueOf(user.getUserID()).equals(registration.getUser_id().getUserID())) {
                        user.setRegistered(true);
                        break;
                    }
                }
            }
            // Truyền danh sách người dùng vào request
            request.setAttribute("listC", userList);
            // Chuyển hướng đến trang JSP
            request.getRequestDispatcher("AddtestPage.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AddListTrainee.class.getName()).log(Level.SEVERE, null, ex);
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
