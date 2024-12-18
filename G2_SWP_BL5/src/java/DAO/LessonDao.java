/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Context.DBContext;
import Model.Chapter;
import Model.Lesson;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Yen Do
 */
public class LessonDao extends DBContext {

    PreparedStatement ps;
    ResultSet rs;

    
     public String extractVideoId(String youtubeUrl) {
        String videoId = null;

        String pattern = "(?<=watch\\?v=|/videos/|embed\\/|youtu.be\\/|\\/v\\/|\\/e\\/|watch\\?v%3D|watch\\?feature=player_embedded&v=|%2Fvideos%2F|embed%\u200C\u200B2F|youtu.be%\u200C\u200B2F|%2Fv%2F)[^#\\&\\?\\n]*";

        Pattern compiledPattern = Pattern.compile(pattern);
        Matcher matcher = compiledPattern.matcher(youtubeUrl);

        if (matcher.find()) {
            videoId = matcher.group();
        }

        return videoId;
    }
    
    public List<Lesson> getAllLesson(int subjectId, String status, String searchName, int page, int pageSize) {
        List<Lesson> listLesson = new ArrayList<>();
        String sql = "SELECT c.chapter_id, c.chapter_name, l.lesson_id, l.lesson_name, l.lesson_video, l.status FROM lesson l"
                + " JOIN chapter c ON l.chapter_id = c.chapter_id"
                + " JOIN subject s ON c.subject_id = s.id";

        String searchCondition = "";
        List<Object> params = new ArrayList<>();

        if (subjectId > 0) {
            System.out.println("Đã vào TH SubjectID trong DAO ");
            System.out.println("subejctId: " + subjectId);
            searchCondition += " WHERE s.id = ?";
            params.add(subjectId);
        }
        if (status != null && !status.isEmpty()) {
            if (searchCondition.isEmpty()) {
                searchCondition += " WHERE l.status = ?";
            } else {
                System.out.println("Trương hợp subjectId và status");
                searchCondition += " AND l.status = ?";
            }
            params.add(status);
        }

        if (searchName != null && !searchName.isEmpty()) {
            if (subjectId > 0 || !searchCondition.isEmpty()) {
                searchCondition += " AND (l.lesson_name LIKE ? OR c.chapter_name LIKE ?)";
            } else {
                searchCondition += " WHERE (l.lesson_name LIKE ? OR c.chapter_name LIKE ?)";
            }
            params.add("%" + searchName + "%");
            params.add("%" + searchName + "%");
        }

        // Thêm điều kiện tìm kiếm vào câu truy vấn
        sql += searchCondition;

        // Thêm phần giới hạn và phân trang vào câu truy vấn
        String limitClause = " LIMIT ?, ?";
        sql += limitClause;
        System.out.println("Biến đổi SQL: " + sql);
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            int paramIndex = 1;
            for (Object param : params) {
                ps.setObject(paramIndex++, param);
            }
            int start = (page - 1) * pageSize;
            ps.setInt(paramIndex++, start);
            ps.setInt(paramIndex++, pageSize);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Lesson lesson = new Lesson();
                lesson.setLessonId(rs.getInt("lesson_id"));
                lesson.setLessonName(rs.getString("lesson_name"));
                lesson.setLessonVideo(rs.getString("lesson_video"));

                Chapter chapter = new Chapter();
                chapter.setChapterId(rs.getInt("chapter_id"));
                chapter.setChapterName(rs.getString("chapter_name"));

                lesson.setChapterType(chapter);

                chapter.setStatus(rs.getString("status"));
                lesson.setStatus(rs.getString("status"));

                listLesson.add(lesson);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listLesson;
    }

    public List<Lesson> getAllLesson(int page, int pageSize) {
        return getAllLesson(0, null, null, page, pageSize);
    }

    public int getTotalLesson(int subjectId, String status, String searchName) {
        int total = 0;

        String sql = "SELECT COUNT(*) FROM lesson l"
                + " JOIN chapter c ON l.chapter_id = c.chapter_id"
                + " JOIN subject s ON c.subject_id = s.id";

        String searchCondition = "";
        List<Object> params = new ArrayList<>();

        if (subjectId > 0) {
            searchCondition += " WHERE s.id = ?";
            params.add(subjectId);
        }
        if (status != null && !status.isEmpty()) {
            if (searchCondition.isEmpty()) {
                searchCondition += " WHERE l.status = ?";
            } else {
                searchCondition += " AND l.status = ?";
            }
            params.add(status);
        }

        if (searchName != null && !searchName.isEmpty()) {
            if (subjectId > 0 || !searchCondition.isEmpty()) {
                searchCondition += " AND (l.lesson_name LIKE ? OR c.chapter_name LIKE ?)";
            } else {
                searchCondition += " WHERE (l.lesson_name LIKE ? OR c.chapter_name LIKE ?)";
            }
            params.add("%" + searchName + "%");
            params.add("%" + searchName + "%");
        }

        // Thêm điều kiện tìm kiếm vào câu truy vấn
        sql += searchCondition;

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            int paramIndex = 1;
            for (Object param : params) {
                ps.setObject(paramIndex++, param);
            }
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                total = rs.getInt(1);
            }

            rs.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return total;
    }

    public int getTotalLesson() {
        return getTotalLesson(0, null, null);
    }

    public List<Lesson> getAllLessonByChapterId(int chapterId) {
        List<Lesson> listLesson = new ArrayList<>();
        String sql = "SELECT c.chapter_id, c.chapter_name, l.lesson_id, l.title, l.lesson_video, l.status FROM lesson l"
                + " JOIN chapter c ON l.chapter_id = c.chapter_id"
                + " JOIN subject s ON c.subject_id = s.id where l.chapter_id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, chapterId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Lesson lesson = new Lesson();
                lesson.setLessonId(rs.getInt("lesson_id"));
                lesson.setLessonName(rs.getString("title"));
                lesson.setLessonVideo(rs.getString("lesson_video"));

                Chapter chapter = new Chapter();
                chapter.setChapterId(rs.getInt("chapter_id"));
                chapter.setChapterName(rs.getString("chapter_name"));

                lesson.setChapterType(chapter);

                chapter.setStatus(rs.getString("status"));
                lesson.setStatus(rs.getString("status"));

                listLesson.add(lesson);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listLesson;
    }

    
     public Lesson getLessonByLessonId(int lesson_id) {
        String sql = "SELECT c.chapter_id, c.chapter_name, l.lesson_id, l.title, l.lesson_video, l.status FROM lesson l"
                + " JOIN chapter c ON l.chapter_id = c.chapter_id"
                + " JOIN subject s ON c.subject_id = s.id where l.lesson_id = ?";

        // Thêm phần giới hạn và phân trang vào câu truy vấn
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, lesson_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Lesson lesson = new Lesson();
                lesson.setLessonId(rs.getInt("lesson_id"));
                lesson.setLessonName(rs.getString("title"));
                lesson.setLessonVideo(rs.getString("lesson_video"));
                lesson.setLessonVideo(extractVideoId(lesson.getLessonVideo()));
                System.out.println(lesson.getLessonVideo());
                Chapter chapter = new Chapter();
                chapter.setChapterId(rs.getInt("chapter_id"));
                chapter.setChapterName(rs.getString("chapter_name"));

                lesson.setChapterType(chapter);

                chapter.setStatus(rs.getString("status"));
                lesson.setStatus(rs.getString("status"));

                return lesson;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
//    public static void main(String[] args) {
//        LessonDao dao = new LessonDao();
//        List<Lesson> listLess = dao.getAllLesson(0, "", "", 1, 5);
//        System.out.println("Dữ liệu: " + listLess.toString());
//    }
}
