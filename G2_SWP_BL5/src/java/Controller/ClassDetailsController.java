/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.classDAO;
import Model.Subject;
import Model.User;
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
@WebServlet(name="ClassDetailsController", urlPatterns={"/classDetails"})
public class ClassDetailsController extends HttpServlet {
   
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String courseId = request.getParameter("courseId");
        classDAO dbCourse = new classDAO();
        User user = (User) request.getSession().getAttribute("user");
        Model.Class course = dbCourse.findByCouseId(Integer.parseInt(courseId));
        boolean checkUserRegister = false;
        if (user != null) {
            checkUserRegister = dbCourse.checkUserRegisterCourse(user.getUserID(), Integer.parseInt(courseId));
        }
        
        List<Model.Class> top3 = dbCourse.getTop3ListCourses();
        List<Subject> cc = dbCourse.getBlogCategories();
        request.setAttribute("clist", cc);
        request.setAttribute("top3", top3);
        
        request.setAttribute("checkRegister", checkUserRegister);
        request.setAttribute("course", course);
        request.getRequestDispatcher("classDetails.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }
}