//package Controller;
//
//import DAO.BlogDAO;
//import DAO.ContactDAO;
//import DAO.RegistrationDAO;
//import Model.Blog;
//import Model.Contact;
//import Model.Registration;
//import Model.User;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.sql.Date;
//import java.time.LocalDate;
//import java.util.List;
//import java.util.stream.Collectors;
//
///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
///**
// *
// * @author Nahhh
// */
//@WebServlet(name = "UserDashBoardController", urlPatterns = {"/userdashboard"})
//public class UserDashBoardController extends HttpServlet {
//
//    private int getMonth(Date date) {
//        LocalDate localDate = date.toLocalDate();
//        return localDate.getMonthValue();
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        RegistrationDAO dbRegistration = new RegistrationDAO();
//        ContactDAO dbContact = new ContactDAO();
//        BlogDAO dbBlog = new BlogDAO();
//        User user = (User) request.getSession().getAttribute("user");
//        if (user == null) {
//            request.getRequestDispatcher("login.jsp").forward(request, response);
//        }
//        List<Registration> registrations = dbRegistration.findRegistrationByUserId(user.getUserID());
//        List<Contact> contacts = dbContact.getAllContactByEmail(user.getEmail());
//        List<Blog> blogs = dbBlog.getAllBlogsByAuthor(user.getUserID());
//        List<Blog> allBlogs = dbBlog.getAllBlogsUpdated();
//
//        String labelsJSON = "[\"" + blogs.stream().map(Blog::getMonth).collect(Collectors.joining("\",\"")) + "\"]";
//
//        String series1JSON = "[" + blogs.stream().map(Blog::getMonth).map(String::valueOf).collect(Collectors.joining(",")) + "]";
//        String series2JSON = "[" + blogs.stream().map(Blog::getMonth).map(String::valueOf).collect(Collectors.joining(",")) + "]";
//
//        request.setAttribute("labelsJSON", labelsJSON);
//        request.setAttribute("series1JSON", series1JSON);
//        request.setAttribute("series2JSON", series2JSON);
//
//        request.setAttribute("registrations", registrations);
//        request.setAttribute("totalClass", registrations.size());
//        request.setAttribute("totalContact", contacts.size());
//        request.setAttribute("totalBlogs", blogs.size());
//        request.setAttribute("totalAllBlogs", allBlogs.size());
//
//        request.getRequestDispatcher("userDashboard.jsp").forward(request, response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    }
//
//}
