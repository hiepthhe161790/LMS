/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.UserDAO;
import DAO.classDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Model.Class;
import Model.Subject;
import Model.User;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author VIETHUNG
 */
@WebServlet(name = "CreateClassServlet", urlPatterns = {"/CreateClass"})
public class CreateClassServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final long serialVersionUID = 1L;
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // In case someone tries to access this servlet using the GET method
        // You can redirect them to an appropriate page or handle it accordingly
             classDAO courseDAO = new classDAO();
         UserDAO userDAO = new UserDAO();
        List<Model.Class> top3 = courseDAO.getTop3ListCourses();
        List<Subject> cc = courseDAO.getBlogCategories();
        List<User> list = userDAO.getAllTeacher();
        request.setAttribute("list", list);
        request.setAttribute("clist", cc);
        request.setAttribute("top3", top3);
        request.getRequestDispatcher("createrClass.jsp").forward(request, response);
        
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy dữ liệu từ trường input trong form
        String name = request.getParameter("name");
        int cate_id = Integer.parseInt(request.getParameter("cate_id"));
        int lessons = 10;
        HttpSession session = request.getSession();
    User user = (User) session.getAttribute("usersession"); // Assuming User object is stored in the session
        if (user == null) {
        // If userID is not found in the session, redirect to login page
        response.sendRedirect("login");
        return; // Stop further processing
    }
    // Assuming user_id is a property of the User object
         int user_id = (int) session.getAttribute("userID"); 
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        String brief_infor = request.getParameter("brief_infor");
        int sale_id = Integer.parseInt(request.getParameter("sale_id"));
        String image = request.getParameter("image");
        String courseDateStr = request.getParameter("courseDate");
        String title = "Manager";

        // Chuyển đổi ngày tháng từ chuỗi sang đối tượng Date
        java.util.Date courseDateUtil = null;
        try {
            courseDateUtil = new java.text.SimpleDateFormat("yyyy-MM-dd").parse(courseDateStr);
        } catch (java.text.ParseException e) {
            e.printStackTrace(); // Xử lý lỗi chuyển đổi
        }

// Chuyển đổi java.util.Date sang java.sql.Date
        java.sql.Date courseDate = new java.sql.Date(courseDateUtil.getTime());

        // Xây dựng đối tượng Class từ dữ liệu
        Class newClass = new Class();
        newClass.setName(name);
        newClass.setCate_id(cate_id);
        newClass.setLessons(lessons);
        newClass.setUser_id(user_id);
        newClass.setStatus(status);
        newClass.setBrief_infor(brief_infor);
        newClass.setSale_id(sale_id);
        newClass.setImage(image);
        newClass.setCourse_date((Date) courseDate);
        newClass.setTitle(title);

        // Gọi phương thức insertClass để thêm lớp học vào cơ sở dữ liệu
        classDAO courseDAO = new classDAO();
        courseDAO.insertClass(newClass);

        // Chuyển hướng về trang JSP hoặc trang khác sau khi thêm thành công
        response.sendRedirect("subject");
    }
}
