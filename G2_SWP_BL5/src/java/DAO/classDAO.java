package DAO;

import Context.DBContext;
import Model.Class;
import Model.Subject;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
public class classDAO extends DBContext {

    public List<Class> getAllCourse() {
        ResultSet rs = null;

        List<Class> listC = new ArrayList<>();
        String sql = "select * from Class";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                listC.add(new Class(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return listC;
    }

    public List<Class> getAllCourseList() {
        ResultSet rs = null;

        List<Class> cList = new ArrayList<>();
        String sql = "select * from Class";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Class c = new Class(rs.getInt(1),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getDate(7)
                );
                cList.add(c);
            }
        } catch (Exception e) {
        }
        return cList;
    }

    public List<Class> searchCourseByName(String searchCourse) {
        ResultSet rs = null;

        List<Class> listC = new ArrayList<>();
        String sql = "select * from Class where [name] like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + searchCourse + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                listC.add(new Class(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return listC;
    }

    public List<Class> getListCourses(String search, String cateId, String sortType, String index) {
        int curIndex = Integer.valueOf(index);
        String orderBy = "ORDER BY c.course_id ASC";
        switch (sortType) {
            case "1":
                orderBy = "ORDER BY c.name ASC";
                break;
            case "2":
                orderBy = "ORDER BY c.name DESC";
                break;
            case "3":
                orderBy = "ORDER BY c.course_id DESC";
                break;
        }
        List<Class> listB = new ArrayList<>();
        String sql = "SELECT c.*, cc.* FROM Class c JOIN Subject cc ON c.cate_id = cc.id \n"
                + "WHERE c.name LIKE ? ";
        if (!cateId.isEmpty()) {
            sql += "AND c.cate_id = ? ";
        }
        sql += orderBy + " LIMIT ?, 9";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + search + "%");
            int paramIndex = 2;
            if (!cateId.isEmpty()) {
                stm.setString(2, cateId);
                paramIndex++;
            }
            stm.setInt(paramIndex, (curIndex - 1) * 9);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Class b = new Class(
                        rs.getInt("course_id"),
                        rs.getString("name"),
                        rs.getString("title"),                      
                        rs.getString("brief_infor"),
                        rs.getInt("cate_id"),
                        rs.getInt("sale_id"),
                        rs.getString("image"),
                        rs.getDate("course_date"),
                        rs.getInt("user_id")
                );
                b.setCateName(rs.getString("name")); // Assuming the category name is in the 'name' column of Subject table
            
                listB.add(b);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listB;
    }

    public List<Class> getTop3ListCourses() {
        String orderBy = "ORDER BY c.course_id DESC LIMIT 3";

        List<Class> listB = new ArrayList<>();
        String sql = "SELECT c.*, cc.name FROM Class c JOIN Subject cc ON c.cate_id = cc.id " + orderBy;

        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Class b = new Class(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getInt(9));

                b.setCateName(rs.getString(10));
               
                listB.add(b);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return listB;
    }

    public int countCourses(String search, String cateId) {
        String sql = "SELECT *  FROM [Course] c join Subject cc on c.cate_id = cc.id \n"
                + "where c.[name] like '%" + search + "% ";
        if (!cateId.isEmpty()) {
            sql += " and c.cate_id = " + cateId + " ";
        }
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Subject> getBlogCategories() {
        List<Subject> listB = new ArrayList<>();
        String sql = "  select * from Subject";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject b = new Subject(rs.getInt(1),
                        rs.getString(2));
                listB.add(b);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return listB;
    }

    public Class findByCouseId(int courseId) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "SELECT * FROM Class WHERE course_id = ?";

            ps = connection.prepareStatement(sql);
            ps.setInt(1, courseId);
            rs = ps.executeQuery();
            while (rs.next()) {
                Class course = new Class();
                course.setCourse_id(rs.getInt(1));
                course.setName(rs.getString(2));
                course.setTitle(rs.getString(3));
               
                course.setBrief_infor(rs.getString(6));
                return course;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Class> getSubjectList(String name, String sortCate, String status, int index) {
    List<Class> listS = new ArrayList<>();
    String sql = "SELECT c.course_id, c.name, cate.name, c.lessons, u.fullName, c.status "
            + "FROM Class c "
            + "JOIN Subject cate ON c.cate_id = cate.id "
            + "JOIN user u ON u.user_id = c.user_id "
            + "WHERE c.name LIKE ? "
            + "AND cate.id LIKE ? ";

    // Add condition for status if it's not empty and is "0" or "1"
    if (!status.isEmpty() && (status.equals("0") || status.equals("1"))) {
        sql += "AND c.status = ? ";
    }

    sql += "ORDER BY c.course_id "
            + "LIMIT ?, 8";

    try {
        PreparedStatement pre = connection.prepareStatement(sql);
        pre.setString(1, "%" + name + "%");
        pre.setString(2, "%" + sortCate + "%");

        // Set status parameter if it's not empty and is "0" or "1"
        if (!status.isEmpty() && (status.equals("0") || status.equals("1"))) {
            pre.setString(3, status);
            pre.setInt(4, (index - 1) * 8);
        } else {
            pre.setInt(3, (index - 1) * 8);
        }

        ResultSet rs = pre.executeQuery();
        while (rs.next()) {
            Class c = new Class(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getInt(4),
                    rs.getString(5),
                    rs.getBoolean(6)
            );

            listS.add(c);
        }
    } catch (SQLException e) {
        System.out.println(e);
    }

    return listS;
}


    public int getTotalSubject() {
        String sql = "select count(*) from Class";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (SQLException e) {
        }

        return 0;
    }

    public List<Subject> getFilterCate() {
        List<Subject> listCate = new ArrayList<>();
        String sql = "SELECT  * from Subject";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                Subject cateC = new Subject(
                        rs.getInt(1),
                        rs.getString(2)
                );
                listCate.add(cateC);
            }

        } catch (SQLException e) {
        }
        return listCate;
    }

    public boolean checkUserRegisterCourse(int user_id, int courseId) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "SELECT  [registration_id]\n"
                    + "      ,[course_id]\n"
                    + "      ,[price_package_id]\n"
                    + "      ,[user_id]\n"
                    + "      ,[created]\n"
                    + "  FROM [SWP391_OnlineLearning].[dbo].[registration]\n"
                    + "  where user_id = ? and course_id = ?";

            ps = connection.prepareStatement(sql);
            ps.setInt(1, user_id);
            ps.setInt(2, courseId);
            rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean registerCourse(int courseId, int user_id, int price_packageId) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "INSERT INTO [registration] (course_id,price_package_id,user_id,created) VALUES (?,?,?,?)";

            ps = connection.prepareStatement(sql);
            ps.setInt(1, courseId);
            ps.setInt(2, price_packageId);
            ps.setInt(3, user_id);
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            ps.setTimestamp(4, timestamp);
            ps.executeUpdate();
            return true;

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
 public void insertClass(Class newClass) {
    String sql = "INSERT INTO Class (name, cate_id, lessons, user_id, status, brief_infor, sale_id, image, course_date, title) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    try {
        PreparedStatement pre = connection.prepareStatement(sql);

        pre.setString(1, newClass.getName());
        pre.setInt(2, newClass.getCate_id());
        pre.setInt(3, newClass.getLessons());
        pre.setInt(4, newClass.getUser_id());
        pre.setBoolean(5, newClass.isStatus());
        pre.setString(6, newClass.getBrief_infor());
        pre.setInt(7, newClass.getSale_id());
        pre.setString(8, newClass.getImage());
        pre.setDate(9, new java.sql.Date(newClass.getCourse_date().getTime())); // Assuming course_date is a java.util.Date
        pre.setString(10, newClass.getTitle());

        int affectedRows = pre.executeUpdate();

        if (affectedRows <= 0) {
            System.out.println("Insertion failed, no rows affected.");
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
}

 public void editClass(String course_id, String name, int cate_id, int lessons, int user_id,
        boolean status, String brief_infor, int sale_id, String image, Date course_date, String title) {
    String query = "UPDATE Class SET name=?, cate_id=?, lessons=?, user_id=?, status=?, brief_infor=?, sale_id=?, image=?, course_date=?, title=? WHERE course_id=?";
    
    try {
        PreparedStatement pre = connection.prepareStatement(query);
        
        pre.setString(1, name);
        pre.setInt(2, cate_id);
        pre.setInt(3, lessons);
        pre.setInt(4, user_id);
        pre.setBoolean(5, status);
        pre.setString(6, brief_infor);
        pre.setInt(7, sale_id);
        pre.setString(8, image);
        pre.setDate(9, new java.sql.Date(course_date.getTime()));
        pre.setString(10, title);
        pre.setString(11, course_id);

        int affectedRows = pre.executeUpdate();

        if (affectedRows <= 0) {
            System.out.println("Update failed, no rows affected.");
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
}


public Class findByClassId(int courseId) {
    try {
        PreparedStatement ps;
        ResultSet rs;
        String sql = "SELECT c.course_id, c.name, c.cate_id, c.lessons, c.user_id, c.status, "
                   + "c.brief_infor, c.sale_id, c.image, c.course_date, c.title "
                   + "FROM Class c "
                   + "WHERE c.course_id = ?";

        ps = connection.prepareStatement(sql);
        ps.setInt(1, courseId);
        rs = ps.executeQuery();

        while (rs.next()) {
            Class course = new Class();
            course.setCourse_id(rs.getInt("course_id"));
            course.setName(rs.getString("name"));
            course.setCate_id(rs.getInt("cate_id")); // Sử dụng cate_id thay vì cateName
            course.setLessons(rs.getInt("lessons"));
            course.setUser_id(rs.getInt("user_id")); // Sử dụng user_id thay vì user_name
            course.setStatus(rs.getBoolean("status"));
            course.setBrief_infor(rs.getString("brief_infor"));
         
            course.setSale_id(rs.getInt("sale_id"));
            course.setImage(rs.getString("image"));
            course.setCourse_date(rs.getDate("course_date"));
            course.setTitle(rs.getString("title"));

            return course;
        }
    } catch (SQLException ex) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    return null;
}


public Class findByClassIdToName(int courseId) {
    try {
        PreparedStatement ps;
        ResultSet rs;
        String sql = "SELECT c.course_id, c.name, cate.name AS cateName, c.lessons, u.fullName AS user_name, c.status, "
                   + "c.brief_infor, c.sale_id, c.image, c.course_date, c.title "
                   + "FROM Class c "
                   + "JOIN Subject cate ON c.cate_id = cate.id "
                   + "JOIN user u ON u.user_id = c.user_id "
                   + "WHERE c.course_id = ?";

        ps = connection.prepareStatement(sql);
        ps.setInt(1, courseId);
        rs = ps.executeQuery();

        while (rs.next()) {
            Class course = new Class();
            course.setCourse_id(rs.getInt("course_id"));
            course.setName(rs.getString("name"));
            course.setCateName(rs.getString("cateName"));
            course.setLessons(rs.getInt("lessons"));
            course.setUser_name(rs.getString("user_name"));
            course.setStatus(rs.getBoolean("status"));
            course.setBrief_infor(rs.getString("brief_infor"));
         
            course.setSale_id(rs.getInt("sale_id"));
            course.setImage(rs.getString("image"));
            course.setCourse_date(rs.getDate("course_date"));
            course.setTitle(rs.getString("title"));

            return course;
        }
    } catch (SQLException ex) {
        Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
    return null;
}
   public static void main(String[] args) throws ParseException {
    // Tạo đối tượng Class để thêm vào cơ sở dữ liệu
    // Tạo đối tượng Class để cập nhật trong cơ sở dữ liệu
    classDAO classDao = new classDAO();

    // Assuming getSubjectList returns a list of Class objects
    List<Class> classes = classDao.getSubjectList("", "", "0", 1);

    for (Class c : classes) {
        System.out.println("Course ID: " + c.getCourse_id());
        System.out.println("Name: " + c.getName());
        System.out.println("Category Name: " + c.getCateName());
        System.out.println("Lessons: " + c.getLessons());
        System.out.println("User Full Name: " + c.getName());
        System.out.println("Status: " + c.isStatus());
        System.out.println("-----------------------------");
    }
   }
}
