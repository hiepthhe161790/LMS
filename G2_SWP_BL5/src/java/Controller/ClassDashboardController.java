///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
//package Controller;
//
//import DAO.AssignmentDAO;
//import DAO.ChapterDAO;
//import DAO.LessonDao;
//import DAO.RegistrationDAO;
//import Model.Chapter;
//import Model.Lesson;
//import Model.Registration;
//import Model.User;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.List;
//
///**
// *
// * @author Nahhh
// */
//@WebServlet(name = "ClassDashboardController", urlPatterns = {"/classdashboard"})
//public class ClassDashboardController extends HttpServlet {
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        User user = (User) request.getSession().getAttribute("user");
//        if (user == null) {
//            request.getRequestDispatcher("login.jsp").forward(request, response);
//        }
//
//        RegistrationDAO dbRegistration = new RegistrationDAO();
//
//        List<Registration> registrations = dbRegistration.findRegistrationByUserId(user.getUserID());
//
//        String raw_courseId = request.getParameter("courseId");
//
//        if (raw_courseId == null || raw_courseId.length() == 0) {
//            raw_courseId = registrations.get(0).getCourse().getId() + "";
//        }
//
//        try {
//            int courseId = Integer.parseInt(raw_courseId);
//            ChapterDAO dbChapter = new ChapterDAO();
//            List<Chapter> chapters = dbChapter.getAllChapterBySubjectId(courseId);
//            request.setAttribute("courseId", courseId);
//            request.setAttribute("chapters", chapters);
//            if (chapters.isEmpty()) {
//                response.getWriter().print("Chapter of course is empty");
//            }
//            String raw_chapterId = request.getParameter("chapterId");
//
//            if (raw_chapterId == null || raw_chapterId.length() == 0) {
//                raw_chapterId = chapters.get(0).getChapterId() + "";
//            }
//
//            try {
//                int chapterId = Integer.parseInt(raw_chapterId);
//
//                LessonDao dbLesson = new LessonDao();
//                List<Lesson> lessons = dbLesson.getAllLessonByChapterId(chapterId);
//                request.setAttribute("chapter", dbChapter.getChapterById(chapterId));
//                request.setAttribute("lessons", lessons);
//
//                if (lessons.isEmpty()) {
//                    response.getWriter().print("Lessons of all chapter is empty");
//                }
//
//                String raw_LessonId = request.getParameter("lessonId");
//                if (raw_LessonId == null || raw_LessonId.length() == 0) {
//                    raw_LessonId = lessons.get(0).getLessonId() + "";
//                }
//
//                try {
//                    int lessonId = Integer.parseInt(raw_LessonId);
//                    Lesson lesson = dbLesson.getLessonByLessonId(lessonId);
//                    request.setAttribute("lesson", lesson);
//                    request.setAttribute("al", new AssignmentDAO().getAllAssignmentsByLID(request.getParameter("lessonId")));
//
//                } catch (NumberFormatException e) {
//                }
//            } catch (NumberFormatException e) {
//                e.printStackTrace();
//            }
//        } catch (NumberFormatException e) {
//            e.printStackTrace();
//        }
//
//        request.setAttribute("registrations", registrations);
//        request.getRequestDispatcher("classDashboard.jsp").forward(request, response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//    }
//
//}
