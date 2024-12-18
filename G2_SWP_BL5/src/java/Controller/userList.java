///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
// */
//package Controller;
//
//import Common.Constant;
//import DAO.UserDAO;
//import Helper.Validator;
//import Model.User;
//import java.io.IOException;
//import java.io.PrintWriter;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.util.List;
//
//@WebServlet(name = "userList", urlPatterns = {"/userList"})
//public class userList extends HttpServlet {
//
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try ( PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet userList</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet userList at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
////        try {
////            UserDAO udb = new UserDAO();
////            List<User> listC = udb.getAllUser();
////            request.setAttribute("listC", listC);
////            request.getRequestDispatcher("./admin/admin_userlist.jsp").forward(request, response);
////        } catch (Exception ex) {
////            Logger.getLogger(userList.class.getName()).log(Level.SEVERE, null, ex);
////        }
//        try {
//            if (Validator.checkPermission("/userList", Constant.PAGE_PERMISSION_IS_READABLE, request, response)) {
//                UserDAO udb = new UserDAO();
//                String searchName = request.getParameter("searchName");
//                int page = 1;
//                int pageSize = 5;
//
//                if (request.getParameter("page") != null) {
//                    page = Integer.parseInt(request.getParameter("page"));
//                }
//
//                List<User> listAllUser;
//                int totalUsers;
//
//                if (searchName != null && !searchName.isEmpty()) {
//                    listAllUser = udb.getAllUser(searchName, page, pageSize);
//                    totalUsers = udb.getTotalUsers(searchName);
//                } else {
//                    listAllUser = udb.getAllUser(page, pageSize);
//                    totalUsers = udb.getTotalUsers();
//                }
//
//                int numPages = (int) Math.ceil((double) totalUsers / pageSize);
//                request.setAttribute("numPages", numPages);
//                request.setAttribute("listC", listAllUser);
//                request.setAttribute("currentPage", page);
//                request.setAttribute("searchName", searchName);
//                request.getRequestDispatcher("./admin/admin_userlist.jsp").forward(request, response);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        try {
//            UserDAO u = new UserDAO();
//            int userID = Integer.parseInt(request.getParameter("userID"));
////            List<User> users = u.updateUserStatus(userID);
//            u.updateUserStatus(userID);
//            request.setAttribute("res", "success");
////            request.setAttribute("users", users);
//
//            response.sendRedirect("userList");
//        } catch (Exception e) {
//            // Xử lý ngoại lệ (nếu cần)
//        }
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
