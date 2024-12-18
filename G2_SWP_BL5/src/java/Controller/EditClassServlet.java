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
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "EditClassServlet", urlPatterns = {"/editClass"})
public class EditClassServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    classDAO classdao = new classDAO();
 UserDAO userDAO = new UserDAO();
    // Retrieve the list of subjects and top 3 courses
    List<Subject> cc = classdao.getBlogCategories();
    List<Model.Class> top3 = classdao.getTop3ListCourses();
 List<User> list = userDAO.getAllTeacher();
        request.setAttribute("list", list);
    // Set the attributes in the request
    request.setAttribute("clist", cc);
    request.setAttribute("top3", top3);

    String courseIdStr = request.getParameter("courseId");

    if (courseIdStr != null && !courseIdStr.isEmpty()) {
        try {
            int courseId = Integer.parseInt(courseIdStr);

            // Retrieve the edited class information
            Class editedClass = classdao.findByClassId(courseId);

            if (editedClass != null) {
                request.setAttribute("editedClass", editedClass);
                request.getRequestDispatcher("EditClass.jsp").forward(request, response);
            } else {
                // Handle the case where the edited class is not found
                response.sendRedirect("subjectList.jsp");
            }
        } catch (NumberFormatException ex) {
            Logger.getLogger(EditClassServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("subjectList.jsp"); // Handle the error
        }
    } else {
        // Handle the case where there is no courseId in the request
        response.sendRedirect("subjectList.jsp");
    }
}

    private static final long serialVersionUID = 1L;

       @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String courseIdStr = request.getParameter("courseId");
    String name = request.getParameter("name");
    int cate_id = Integer.parseInt(request.getParameter("cate_id"));
    int lessons = 10;
    int user_id = Integer.parseInt(request.getParameter("user_id"));
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



    // Gọi phương thức updateClass để cập nhật thông tin vào cơ sở dữ liệu
    classDAO courseDAO = new classDAO();

        courseDAO.editClass(courseIdStr, name, cate_id, lessons, user_id, status, brief_infor, sale_id, image, courseDate, title);
     

    // Chuyển hướng về trang JSP hoặc trang khác sau khi chỉnh sửa thành công
    response.sendRedirect("subject");
}
}
