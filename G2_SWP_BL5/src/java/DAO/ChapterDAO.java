/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Context.DBContext;
import Model.Chapter;
import Model.Lesson;
import Model.Subject;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Yen Do
 */
public class ChapterDAO extends DBContext {

    PreparedStatement ps;
    ResultSet rs;

    public List<Subject> getAllSubject() {
        List<Subject> listSubject = new ArrayList<>();
        String sql = "SELECT * FROM Subject";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject();
                subject.setId(rs.getInt(1));
                subject.setName(rs.getString(2));
                listSubject.add(subject);
            }

        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listSubject;
    }

    public List<Chapter> getAllChapter(String searchName, int page, int pageSize) {
        List<Chapter> listChapter = new ArrayList<>();
        String sql = "SELECT c.chapter_id, c.chapter_name, c.chapter_order, s.name, c.status "
                + "FROM chapter c JOIN subject s ON c.subject_id = s.id";

        String searchCondition = "";
        if (searchName != null && !searchName.isEmpty()) {
            searchCondition = " WHERE c.chapter_name LIKE ?";
        }

        String limitClause = " LIMIT ?, ?";

        sql += searchCondition + limitClause;

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            int paramIndex = 1;
            if (searchName != null && !searchName.isEmpty()) {
                String searchValue = "%" + searchName + "%";
                ps.setString(paramIndex++, searchValue);
            }
            int start = (page - 1) * pageSize;
            ps.setInt(paramIndex++, start);
            ps.setInt(paramIndex++, pageSize);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Chapter chapter = new Chapter();
                chapter.setChapterId(rs.getInt("chapter_id"));
                chapter.setChapterName(rs.getString("chapter_name"));
                chapter.setChapterOrder(rs.getInt("chapter_order"));

                Subject subject = new Subject();
                subject.setName(rs.getString("name"));

                chapter.setSubjectType(subject);
                chapter.setStatus(rs.getString("status"));

                listChapter.add(chapter);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listChapter;
    }

    public List<Chapter> getAllChapter(int page, int pageSize) {
        return getAllChapter(null, page, pageSize);
    }

    public int getTotalChapter(String searchName) {
        int total = 0;

        String sql = "SELECT COUNT(*) FROM chapter c JOIN subject s ON c.subject_id = s.id";
        String searchCondition = "";
        if (searchName != null && !searchName.isEmpty()) {
            searchCondition = " WHERE c.chapter_name LIKE ?";
        }
        sql += searchCondition;

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            if (searchName != null && !searchName.isEmpty()) {
                ps.setString(1, "%" + searchName + "%");
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

    public int getTotalChapter() {
        return getTotalChapter(null);
    }

    public boolean createChapter(Chapter chapter) {
        String sql = "INSERT INTO Chapter (chapter_name, chapter_order, subject_id, status) VALUES (?, ?, ?, ?)";

        try ( PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, chapter.getChapterName());
            statement.setInt(2, chapter.getChapterOrder());
            statement.setInt(3, chapter.getSubjectType().getId());
            statement.setString(4, chapter.getStatus());

            statement.executeUpdate();

            return true;
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
            return false;
        }
    }

    public boolean updateChapter(Chapter chapter) {
        String sql = "UPDATE Chapter SET chapter_name = ?, chapter_order = ?, subject_id = ?, status = ? WHERE chapter_id = ?";

        try ( PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, chapter.getChapterName());
            statement.setInt(2, chapter.getChapterOrder());
            statement.setInt(3, chapter.getSubjectType().getId());
            statement.setString(4, chapter.getStatus());
            statement.setInt(5, chapter.getChapterId());
            statement.executeUpdate();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
            return false;
        }
    }

    public boolean updateStatusChapter(Chapter chapter) {
        String sql = "UPDATE Chapter SET status = ? WHERE chapter_id = ?";

        try ( PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, "Inactive");
            statement.setInt(2, chapter.getChapterId());
            statement.executeUpdate();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
            return false;
        }
    }
        public List<Chapter> getAllChapterBySubjectId(int subject_id) {
        List<Chapter> listChapter = new ArrayList<>();
        String sql = "SELECT c.chapter_id, c.chapter_name, c.chapter_order, s.name, c.status "
                + "FROM chapter c JOIN subject s ON c.subject_id = s.id where c.subject_id = ?";

        try {
            LessonDao dbLesson = new LessonDao();

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, subject_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                Chapter chapter = new Chapter();
                chapter.setChapterId(rs.getInt("chapter_id"));
                chapter.setChapterName(rs.getString("chapter_name"));
                chapter.setChapterOrder(rs.getInt("chapter_order"));

                Subject subject = new Subject();
                subject.setName(rs.getString("name"));

                chapter.setSubjectType(subject);
                chapter.setStatus(rs.getString("status"));
                List<Lesson> lessons = dbLesson.getAllLessonByChapterId(rs.getInt("chapter_id"));
                chapter.setLessons(lessons);

                listChapter.add(chapter);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listChapter;
    }



    public Chapter getChapterById(int chapterId) {
        String sql = "SELECT c.chapter_id, c.chapter_name, c.chapter_order, s.id, s.name, c.status "
                + "FROM chapter c JOIN subject s ON c.subject_id = s.id WHERE c.chapter_id = ?";

        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, chapterId);
            rs = ps.executeQuery();
            if (rs.next()) {
                Chapter chapter = new Chapter();
                chapter.setChapterId(rs.getInt("chapter_id"));
                chapter.setChapterName(rs.getString("chapter_name"));
                chapter.setChapterOrder(rs.getInt("chapter_order"));

                Subject subject = new Subject();
                subject.setId(rs.getInt("id"));
                subject.setName(rs.getString("name"));

                chapter.setSubjectType(subject);
                chapter.setStatus(rs.getString("status"));

                return chapter;
            }
        } catch (SQLException e) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
        }

        return null;
    }

    public static void main(String[] args) {
        ChapterDAO dao = new ChapterDAO();
        List<Subject> listCon = dao.getAllSubject();
        System.out.println(listCon.toString());
    }

}
