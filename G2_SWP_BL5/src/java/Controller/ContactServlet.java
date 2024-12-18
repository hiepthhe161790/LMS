/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.ContactDAO;
import Model.Contact;
import Model.ContactType;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Yen Do
 */
@WebServlet(name = "ContactServlet", urlPatterns = {"/contact"})
public class ContactServlet extends HttpServlet {

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
            out.println("<title>Servlet ContactServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ContactServlet at " + request.getContextPath() + "</h1>");
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
        ContactDAO dao = new ContactDAO();
        List<ContactType> listContactType = dao.getAllContactType();
        request.setAttribute("getAllContactType", listContactType);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private boolean isValidEmail(String email) {
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";

        Pattern pattern = Pattern.compile(emailRegex);
        Matcher matcher = pattern.matcher(email);

        return matcher.matches();
    }

    private boolean isValidPhone(String phone) {
        String phoneRegex = "^\\d{10}$";
        return phone.matches(phoneRegex);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ContactDAO contactDAO = new ContactDAO();
        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String message = request.getParameter("message");
            String phone = request.getParameter("phone");
            String contactType = request.getParameter("contactType");
            String subject = request.getParameter("subject");

            String msgName = "";
            String msgEmail = "";
            String msgPhone = "";
            String msgContactType = "";
            String msgSubject = "";

            if (contactType == null || contactType.trim().isEmpty()) {
                msgContactType = "Error: Please Select Contact Type!";
                request.setAttribute("msgContactType", msgContactType);
            }
            if (name == null || name.trim().isEmpty()) {
                msgName = "Error: Name is required!";
                request.setAttribute("msgName", msgName);
            }

            if (phone == null || phone.trim().isEmpty()) {
                msgPhone = "Error: Phone is required!";
                request.setAttribute("msgPhone", msgPhone);
            } else if (!isValidPhone(phone)) {
                msgPhone = "Error: Invalid phone number format!";
                request.setAttribute("msgPhone", msgPhone);
            }

            if (email == null || email.trim().isEmpty()) {
                msgEmail = "Error: Email is required!";
                request.setAttribute("msgEmail", msgEmail);
            } else if (!isValidEmail(email)) {
                msgEmail = "Error: Invalid email format!";
                request.setAttribute("msgEmail", msgEmail);
            }
            if (subject == null || subject.trim().isEmpty()) {
                msgSubject = "Error: subject is required!";
                request.setAttribute("msgSubject", msgSubject);
            } else {
                int contactTypeID = Integer.parseInt(contactType);
                ContactType type = new ContactType();
                type.setContactTypeID(contactTypeID);
                Contact contact = new Contact(0, name, email, message, phone, subject, type, null, "Processing", true);
                contactDAO.createContact(contact);
                request.setAttribute("res", "success");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<ContactType> listContactType = contactDAO.getAllContactType();
        request.setAttribute("getAllContactType", listContactType);
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
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
