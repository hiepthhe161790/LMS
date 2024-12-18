/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.BlogDAO;
import Model.Blog;
import Model.BlogCategory;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author VIETHUNG
 */
@WebServlet(name="BCreateBlogServlet", urlPatterns={"/createBlogServlet"})
public class BCreateBlogServlet extends HttpServlet {
   
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
            out.println("<title>Servlet BCreateBlogServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BCreateBlogServlet at " + request.getContextPath () + "</h1>");
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
    @Override
     protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
        String bid = request.getParameter("bid");
        BlogDAO dao = new BlogDAO();
        List<BlogCategory> clist = dao.getBlogCategories();
        Blog b = dao.getDetailBlog(bid);
        List<Blog> top3 = dao.getTop3ListBlogs();

        request.setAttribute("b", b);
        request.setAttribute("clist", clist);
        request.setAttribute("top3", top3);
        request.getRequestDispatcher("BcreateBlogForm.jsp").forward(request, response);
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
        // Retrieve data from the form
        String title = request.getParameter("title");
        
        HttpSession session = request.getSession();
    User user = (User) session.getAttribute("usersession"); // Assuming User object is stored in the session
     if (user == null) {
        // If userID is not found in the session, redirect to login page
        response.sendRedirect("login");
        return; // Stop further processing
    }
    // Assuming user_id is a property of the User object
         int authorId = (int) session.getAttribute("userID"); 
        String image = request.getParameter("image");
        String briefInfo = request.getParameter("briefInfo");
        String blogContent = request.getParameter("blogContent");
        String categoryId = request.getParameter("categoryId");
        boolean status = true;
        String thumbnail = image;
        String flag = request.getParameter("flag");
        int numberOfAccess = 0;

        // Call the createBlog method from BlogDAO
        BlogDAO blogDAO = new BlogDAO();

        try {
            blogDAO.createBlog(title, authorId, image, briefInfo, blogContent, categoryId, status, thumbnail, flag, numberOfAccess);
            // Redirect to a success page with a success message
            request.setAttribute("message", "Blog created successfully!");
           response.sendRedirect("blog");
        }catch (Exception e) {
            // Handle database-related errors
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while creating the blog.");
            request.getRequestDispatcher("createBlogError.jsp").forward(request, response);
        }
        // Handle other unexpected errors
        
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
