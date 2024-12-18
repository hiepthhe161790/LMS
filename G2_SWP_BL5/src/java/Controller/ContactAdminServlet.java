/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.ContactDAO;
import Model.Contact;
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
@WebServlet(name = "ContactAdminServlet", urlPatterns = {"/managecontact"})
public class ContactAdminServlet extends HttpServlet {

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
            out.println("<title>Servlet ContactAdminServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ContactAdminServlet at " + request.getContextPath() + "</h1>");
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
            ContactDAO dao = new ContactDAO();
            String searchName = request.getParameter("searchName");
            int page = 1;
            int pageSize = 5;

            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }

            List<Contact> listAllContact;
            int totalContacts;

            if (searchName != null && !searchName.isEmpty()) {
                listAllContact = dao.getAllContact(searchName, page, pageSize);
                totalContacts = dao.getTotalContacts(searchName);
            } else {
                listAllContact = dao.getAllContact(page, pageSize);
                totalContacts = dao.getTotalContacts();
            }

            int numPages = (int) Math.ceil((double) totalContacts / pageSize);
            request.setAttribute("numPages", numPages);
            request.setAttribute("getAllContact", listAllContact);
            request.setAttribute("currentPage", page);
            request.setAttribute("searchName", searchName);
            request.getRequestDispatcher("./admin/admin_contact.jsp").forward(request, response);
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
        try {
            ContactDAO dao = new ContactDAO();
            int contactId = Integer.parseInt(request.getParameter("contactID"));
            dao.updateStatus(contactId);
            request.setAttribute("res", "success");
            response.sendRedirect("managecontact");
        } catch (Exception e) {
            // Xử lý ngoại lệ (nếu cần)
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
