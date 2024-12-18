/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Common.Constant;
import DAO.UserDAO;
import Helper.Validator;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nahhh
 */
@WebServlet(name = "UserDetails", urlPatterns = {"/userdetails"})
public class UserDetails extends HttpServlet {

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
            out.println("<title>Servlet UserDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserDetail at " + request.getContextPath() + "</h1>");
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
            if (Validator.checkPermission("/userdetails", Constant.PAGE_PERMISSION_IS_READABLE, request, response)) {
                String uid = request.getParameter("uid");
                UserDAO udb = new UserDAO();
                User u = udb.getDetailUser(uid);

                request.setAttribute("u", u);
                request.getRequestDispatcher("./admin/admin_userdetails.jsp").forward(request, response);
            }

        } catch (Exception ex) {
            Logger.getLogger(UserDetails.class.getName()).log(Level.SEVERE, null, ex);
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

        try {
            if (Validator.checkPermission("/userdetails", Constant.PAGE_PERMISSION_IS_UPDATABLE, request, response)) {
                String userID = request.getParameter("userID");
                String fullName = request.getParameter("fullName");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
                int role_id = Integer.parseInt(request.getParameter("role_id"));
                boolean status = request.getParameter("status") != null;

                // Update User object with form data
                User updatedUser = new User();
                updatedUser.setUserID(Integer.parseInt(userID));
                updatedUser.setFullName(fullName);
                updatedUser.setPhone(phone);
                updatedUser.setGender(gender);
                updatedUser.setRole_id(role_id);
                updatedUser.setStatus(status);
                // Call the updateUserByID method to update the user in the database
                UserDAO userDAO = new UserDAO();
                boolean updateSuccess = userDAO.updateUserByID(updatedUser);

                if (updateSuccess) {
                    response.sendRedirect("userList");
                }
            }

        } catch (Exception ex) {
            ex.printStackTrace();
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
