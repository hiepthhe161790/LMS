/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Context.DBContext;
import Model.Price_package;
import Model.Registration;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import Model.Class;
import Model.User;
/**
 *
 * @author VIETHUNG
 */
public class registrationDAO extends DBContext {

    PreparedStatement ps;
    ResultSet rs;
// Hàm lấy thông tin đăng ký dựa trên course_id
   public List<Registration> getRegistrationsByCourseId(int courseId) {
        List<Registration> registrations = new ArrayList<>();

        String sql = "SELECT * FROM registration WHERE course_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, courseId);
            rs = ps.executeQuery();

            while (rs.next()) {
                int registrationId = rs.getInt("registration_id");
                Timestamp created = rs.getTimestamp("created");
                String regisStatus = rs.getString("regis_status");

                // Lấy thông tin Class từ course_id
                int classId = rs.getInt("course_id");
                classDAO classDAo = new classDAO();
                Class course = classDAo.findByCouseId(classId);

                // Lấy thông tin User từ user_id
                String userId = rs.getString("user_id");
                UserDAO userDAO = new UserDAO();
                User user = userDAO.getDetailUser(userId);

                // Tạo đối tượng Registration từ dữ liệu lấy ra
                Registration registration = new Registration(registrationId, course, user, created, regisStatus);

                // Thêm đối tượng Registration vào danh sách
                registrations.add(registration);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return registrations;
        
   } 
   
    public void addRegistrationsForCourse(int courseId, List<String> userIds, String regisStatus) {
        // Query SQL để thêm user_id vào bảng registration cho một course_id
        String sql = "INSERT INTO registration (user_id, course_id, created, regis_status) " +
                     "SELECT ?, ?, NOW(), ? " +
                     "FROM dual " +
                     "WHERE NOT EXISTS (SELECT 1 FROM registration WHERE user_id = ? AND course_id = ?)";

        try (
             PreparedStatement ps = connection.prepareStatement(sql)) {

            // Lặp qua danh sách user_id và thêm vào bảng registration
            for (String userId : userIds) {
                // Thiết lập các tham số cho PreparedStatement
                ps.setString(1, userId);
                ps.setInt(2, courseId);
                ps.setString(3, regisStatus);
                ps.setString(4, userId);
                ps.setInt(5, courseId);

                // Thực hiện câu lệnh SQL
                ps.executeUpdate();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
      public boolean updateRegistrationStatus(int registrationId, String newStatus) {
        String sql = "UPDATE registration SET regis_status = ? WHERE registration_id = ?";

        try (
            PreparedStatement ps = connection.prepareStatement(sql)
        ) {
            ps.setString(1, newStatus);
            ps.setInt(2, registrationId);

            int rowsAffected = ps.executeUpdate();

            // Kiểm tra xem có bản ghi nào được cập nhật hay không
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            // Xử lý ngoại lệ SQL
            return false;
        }
    }
//     public Registration toRegistration(ResultSet rs) {
//        classDAO dbClass = new classDAO();
//        UserDAO dbUser = new UserDAO();
//        SubjectDAO sdao = new SubjectDAO();
//        try {
//            Registration registra = new Registration();
//            registra.setId(rs.getInt("registration_id"));
//            registra.setCourse(sdao.getSubjectById(rs.getInt("course_id")));
//            Price_package pp = new Price_package();
//            pp.setId(rs.getInt("price_package_id"));
//            registra.setPrice_package(pp);
//            registra.setUser(dbUser.getDetailUser(rs.getInt("user_id") + ""));
//            registra.setCreated(rs.getDate("created"));
//            registra.setStatus(rs.getBoolean("regis_status"));
//            return registra;
//        } catch (SQLException ex) {
//            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return null;
//    }

//    public List<Registration> findRegistrationByUserId(int user_id) {
//        List<Registration> registrations = new ArrayList<>();
//        try {
//            PreparedStatement ps;
//            ResultSet rs;
//            String sql = "select * from registration where user_id = ? and regis_status = 1";
//            ps = connection.prepareStatement(sql);
//            ps.setInt(1, user_id);
//            rs = ps.executeQuery();
//
//            while (rs.next()) {
//                registrations.add(toRegistration(rs));
//            }
//            return registrations;
//        } catch (SQLException ex) {
//            Logger.getLogger(RegistrationDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//        return null;
//    }
   public static void main(String[] args) {
    // Tạo đối tượng registrationDAO để sử dụng các phương thức của nó
    registrationDAO registrationDao = new registrationDAO();
registrationDao.updateRegistrationStatus(18, "Pending");

}

    }


