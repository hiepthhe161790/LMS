/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.registrationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author VIETHUNG
 */
@WebServlet(name="AAUpdateRegistrationStatusServlet", urlPatterns={"/aUpdateRegistrationStatusServlet"})
public class AAUpdateRegistrationStatusServlet extends HttpServlet {
   
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
         // Lấy các thông tin cần thiết từ request
        int registrationId = Integer.parseInt(request.getParameter("registrationId"));
        String newStatus = "Registered";

        // Gọi hàm updateRegistrationStatus từ registrationDAO
        registrationDAO registrationDao = new registrationDAO();
        boolean success = registrationDao.updateRegistrationStatus(registrationId, newStatus);

        if (success) {
            // Nếu cập nhật thành công, có thể đặt thông báo thành công và chuyển hướng
            request.setAttribute("successMessage", "Update registration status successfully");
        } else {
            // Nếu cập nhật không thành công, có thể đặt thông báo thất bại và chuyển hướng
            request.setAttribute("errorMessage", "Failed to update registration status");
        }

        // Chuyển hướng về trang trước đó (có thể là trang chi tiết đăng ký)
        response.sendRedirect(request.getHeader("Referer"));
    }    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
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
