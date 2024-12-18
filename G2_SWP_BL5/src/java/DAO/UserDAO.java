/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Context.DBContext;
import Helper.EncryptionUtil;
import Model.Registration;
import Model.Role;
import Model.User;
import Model.Class;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author THTP
 */
public class UserDAO extends DBContext {

    public boolean createUser(User user) {

        String sql = "INSERT INTO User (Email, Password, FullName, Phone,Status,Role_ID,Gender,is_verified,verification_code) VALUES (?, ?, ?,  ?,1,3,?,0,123456)";

        try ( PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, user.getEmail());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getFullName());
            statement.setString(4, user.getPhone());
//            statement.setDate(5, new java.sql.Date(user.getBirthDate().getTime()));
//            statement.setString(5, user.getAddress());
            statement.setBoolean(5, user.getGender());
            int rowsAffected = statement.executeUpdate();

            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
            return false;
        }
    }

    public boolean updateUser(User user) {
        String sql = "UPDATE User SET  FullName=?, Phone=?, Gender=?, Avatar=? WHERE Email=?";

        try ( PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, user.getFullName());
            statement.setString(2, user.getPhone());
            statement.setBoolean(3, user.getGender());
            statement.setString(4, user.getAvatar());
            statement.setString(5, user.getEmail());

            int rowsAffected = statement.executeUpdate();

            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
            return false;
        }
    }

    public boolean updatePasswordUser(String email, String newPassword) {
        String sql = "UPDATE User SET  Password=? WHERE Email=?";

        try ( PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, newPassword);
            statement.setString(2, email);
            int rowsAffected = statement.executeUpdate();

            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateUserByID(User user) {
        String sql = "UPDATE user SET fullname=?, phone=?, gender=?, role_id = ?, status=? WHERE user_id=?";

        try ( PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, user.getFullName());
            statement.setString(2, user.getPhone());
            statement.setBoolean(3, user.getGender());
            statement.setInt(4, user.getRole_id());
            statement.setBoolean(5, user.isStatus());
            statement.setInt(6, user.getUserID());

            int rowsAffected = statement.executeUpdate();

            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
            return false;
        }
    }

    public boolean checkEmail(String email) {
        String sql = "SELECT * FROM User WHERE Email=?";
        User user = null;

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, email);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                user = new User();
                user.setUserID(resultSet.getInt("UserID"));
                user.setEmail(resultSet.getString("Email"));
                user.setPassword(resultSet.getString("Password"));

                user.setRole_id(resultSet.getInt("RoleID"));

                user.setFullName(resultSet.getString("FullName"));
                user.setPhone(resultSet.getString("Phone"));
//                user.setAddress(resultSet.getString("Address"));
                user.setAvatar(resultSet.getString("Avatar"));
                user.setStatus(resultSet.getBoolean("Status"));
                user.setGender(resultSet.getBoolean("Gender"));
//                user.setBirthDate(resultSet.getDate("BirthDate"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        // Return true if a user with the given email is found, false otherwise
        return user != null;
    }

    public User login(String username, String password) {
        String sql = "SELECT * FROM User WHERE Email=? AND Password=?";
        User user = null;

        try {

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                user = new User();

                user.setUserID(resultSet.getInt("user_id"));
                user.setEmail(resultSet.getString("Email"));
                user.setPassword(resultSet.getString("Password"));
                user.setRole_id(resultSet.getInt("Role_ID"));
                user.setFullName(resultSet.getString("FullName"));
                user.setPhone(resultSet.getString("Phone"));
//                user.setAddress(resultSet.getString("Address"));
                user.setAvatar(resultSet.getString("Avatar"));
                user.setStatus(resultSet.getBoolean("Status"));
                user.setGender(resultSet.getBoolean("Gender"));
//                user.setBirthDate(resultSet.getDate("BirthDate"));
//                user.setBirthDatestr(resultSet.getString("BirthDate"));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        System.err.println(user);
        return user;
    }

    public User findByEmail(String email) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "SELECT * FROM User WHERE email = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserID(rs.getInt(1));
                user.setFullName(rs.getString(2));
                user.setEmail(rs.getString(3));
//            user.setPassword(rs.getString(4));
                user.setGender(rs.getBoolean(5));
//                user.setAddress(rs.getString(6));
                user.setPhone(rs.getString(7));
                user.setVerification_code(rs.getString(8));
                return user;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean updateUserPassword(String email, String password) {
        try {
            String sql = "UPDATE `User` SET password = ? WHERE email = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, email);
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean updateUserVerified(String email) {
        try {
            PreparedStatement ps;
            ResultSet rs;
            String sql = "UPDATE User SET is_verified = 1 WHERE email = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean createUserAdmin(User u) {

        String sql = "INSERT INTO user(fullname, email, password, phone, gender, role_id, status, is_verified) VALUES(?,?,?,?,?,?,?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getFullName());
            st.setString(2, u.getEmail());
            st.setString(3, u.getPassword());
            st.setString(4, u.getPhone());
            st.setBoolean(5, u.getGender());
            st.setInt(6, u.getRole_id());
            st.setBoolean(7, true);
            st.setBoolean(8, true);

            st.executeUpdate();

            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

//        public boolean updateUserByID(User user) {
//        String sql = "UPDATE user SET fullname=?, phone=?, gender=?, role_id = ?, status=? WHERE user_id=?";
//
//        try ( PreparedStatement statement = connection.prepareStatement(sql)) {
//            statement.setString(1, user.getFullName());
//            statement.setString(2, user.getPhone());
//            statement.setBoolean(3, user.getGender());
//            statement.setInt(4, user.getRole_id());
//            statement.setBoolean(5, user.isStatus());
//            statement.setInt(6, user.getUserID());
//
//            int rowsAffected = statement.executeUpdate();
//
//            return rowsAffected > 0;
//        } catch (SQLException e) {
//            e.printStackTrace(); // Handle the exception appropriately
//            return false;
//        }
//    }
    public boolean lockUser(String uid) {
        String sql = "Update `user` set Status  = 0 where User_ID = " + uid;
        System.out.println(sql);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public List<User> searchUserBy(String Phone, String email, String FullName) {
        ResultSet rs = null;

        List<User> listC = new ArrayList<>();
        String sql = "select u.UserID, u.FullName, u.email, u.gender, u.address, u.Phone, u.status, r.role_name from [User] u join Role r on u.role_id = r.role_id\n"
                + "where r.role_name != 'admin' and u.Phone like ? and u.email like ? and u.FullName like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + Phone + "%");
            ps.setString(2, "%" + email + "%");
            ps.setString(3, "%" + FullName + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                User u = new User();
                u.setUserID(rs.getInt(1));
                u.setFullName(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setGender(rs.getBoolean(4));
                u.setPhone(rs.getString(6));
                r.setRole_name(rs.getString(8));
                u.setRole(r);
                u.setStatus(rs.getBoolean(7));
                listC.add(u);
            }
        } catch (Exception e) {
        }
        return listC;
    }
 

    public List<Role> getAllRole() {
        ResultSet rs = null;

        List<Role> listC = new ArrayList<>();
        String sql = "select * from role";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                listC.add(new Role(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return listC;
    }

//    public List<User> updateUserStatus(int userID) {
//        List<User> users = new ArrayList<>();
//
//        try {
//            connection.setAutoCommit(true);
//            String sql = "UPDATE user SET Status = ? WHERE UserID = ?";
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setBoolean(1, false);
//            ps.setInt(2, userID);
//            ps.executeUpdate();
//            String selectAgain = "SELECT \n"
//                    + "    UserID, \n"
//                    + "    Email, \n"
//                    + "    Password, \n"
//                    + "    RoleID, \n"
//                    + "    CreateDate, \n"
//                    + "    FullName, \n"
//                    + "    Phone, \n"
//                    + "    BirthDate, \n"
//                    + "    Address, \n"
//                    + "    Avatar, \n"
//                    + "    Status, \n"
//                    + "    gender, \n"
//                    + "    is_verified, \n"
//                    + "    verification_code\n"
//                    + "FROM \n"
//                    + "    user\n"
//                    + "WHERE \n"
//                    + "    UserID != ?";
//            PreparedStatement ps_select = connection.prepareStatement(selectAgain);
//            ps.setInt(1, userID);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                 users.add(new User(
//                        rs.getInt(1),
//                        rs.getString(2),
//                        rs.getString(3),
//                        rs.getInt(4),
//                        rs.getDate(5),
//                        rs.getString(6),
//                        rs.getString(7),
//                        rs.getDate(8),
//                        rs.getString(9),
//                        rs.getString(10),
//                        rs.getBoolean(11),
//                        rs.getBoolean(12),
//                        rs.getBoolean(13),
//                        rs.getString(14)
//                ));
//            }
//
//        } catch (SQLException ex) {
//            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
//        } finally {
//            try {
//                connection.setAutoCommit(true);
//            } catch (Exception e) {
//                Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, e);
//            }
//        }
//        return users;
//    }
    public void updateUserStatus(int userID) {
        String sql = "UPDATE user SET Status = ? WHERE user_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setBoolean(1, false);
            ps.setInt(2, userID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public User getDetailUser(String uid) {
        String sql = "SELECT u.user_id, u.fullname, u.email, u.gender, u.phone, u.status, r.role_name "
                + "FROM `user` u "
                + "JOIN role r ON u.role_id = r.role_id "
                + "WHERE u.user_id = " + uid;
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Role r = new Role();
                User u = new User();
                u.setUserID(rs.getInt(1));
                u.setFullName(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setGender(rs.getBoolean(4));
                u.setPhone(rs.getString(5));
                r.setRole_name(rs.getString(7));
                u.setRole(r);
                u.setStatus(rs.getBoolean(6));
                return u;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

//    public List<User> getAllUser(String searchName, int page, int pageSize) {
//        List<User> users = new ArrayList<>();
//        String sql = "SELECT * FROM user u where is_verified = TRUE";
//
//        String searchCondition = "";
//        if (searchName != null && !searchName.isEmpty()) {
//            searchCondition = " WHERE (u.FullName LIKE ? OR u.Phone LIKE ? OR u.Email LIKE ?)";
//        }
//
//        String limitClause = " LIMIT ?, ?";
//
//        sql += searchCondition + limitClause;
//
//        try {
//            PreparedStatement ps = connection.prepareStatement(sql);
//            int paramIndex = 1;
//            if (searchName != null && !searchName.isEmpty()) {
//                String searchValue = "%" + searchName + "%";
//                ps.setString(paramIndex++, searchValue);
//                ps.setString(paramIndex++, searchValue);
//                ps.setString(paramIndex++, searchValue);
//            }
//            int start = (page - 1) * pageSize;
//            ps.setInt(paramIndex++, start);
//            ps.setInt(paramIndex++, pageSize);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                users.add(new User(
//                        rs.getInt(1),
//                        rs.getString(2),
//                        rs.getString(3),
//                        rs.getInt(4),
//                        rs.getDate(5),
//                        rs.getString(6),
//                        rs.getString(7),
//                        rs.getString(8),
//                        rs.getBoolean(9),
//                        rs.getBoolean(10),
//                        rs.getBoolean(11),
//                        rs.getString(12)
//                ));
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return users;
//    }
//
//    public List<User> getAllUser(int page, int pageSize) {
//        return getAllUser(null, page, pageSize);
//    }
//
//    public int getTotalUsers(String searchName) {
//        int total = 0;
//
//        String sql = "SELECT COUNT(*) FROM User u where is_verified = TRUE";
//        String searchCondition = "";
//        if (searchName != null && !searchName.isEmpty()) {
//            searchCondition = " WHERE (u.FullName LIKE ? OR u.Phone LIKE ? OR u.Email LIKE ?)";
//        }
//        sql += searchCondition;
//
//        try {
//            PreparedStatement ps = connection.prepareStatement(sql);
//            if (searchName != null && !searchName.isEmpty()) {
//                ps.setString(1, "%" + searchName + "%");
//                ps.setString(2, "%" + searchName + "%");
//                ps.setString(3, "%" + searchName + "%");
//            }
//            ResultSet rs = ps.executeQuery();
//
//            if (rs.next()) {
//                total = rs.getInt(1);
//            }
//
//            rs.close();
//            ps.close();
//        } catch (SQLException ex) {
//            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//        return total;
//    }
//
//    public int getTotalUsers() {
//        return getTotalUsers(null);
//    }
    
    public List<User> getAllUser(String searchName, String userRole, int page, int pageSize) {
    List<User> users = new ArrayList<>();
    String sql = "SELECT * FROM user u WHERE is_verified = TRUE";

    String searchCondition = "";
    if (searchName != null && !searchName.isEmpty()) {
        searchCondition = " AND (u.FullName LIKE ? OR u.Phone LIKE ? OR u.Email LIKE ?)";
    }

    String roleCondition = "";
    if (userRole != null && !userRole.isEmpty()) {
        roleCondition = " AND u.role_id = ?";
    }

    String limitClause = " LIMIT ?, ?";
    sql += searchCondition + roleCondition + limitClause;

    try {
        PreparedStatement ps = connection.prepareStatement(sql);
        int paramIndex = 1;
        if (searchName != null && !searchName.isEmpty()) {
            String searchValue = "%" + searchName + "%";
            ps.setString(paramIndex++, searchValue);
            ps.setString(paramIndex++, searchValue);
            ps.setString(paramIndex++, searchValue);
        }
        if (userRole != null && !userRole.isEmpty()) {
            ps.setString(paramIndex++, userRole);
        }
        int start = (page - 1) * pageSize;
        ps.setInt(paramIndex++, start);
        ps.setInt(paramIndex++, pageSize);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            users.add(new User(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getInt(4),
                    rs.getDate(5),
                    rs.getString(6),
                    rs.getString(7),
                    rs.getString(8),
                    rs.getBoolean(9),
                    rs.getBoolean(10),
                    rs.getBoolean(11),
                    rs.getString(12)
            ));
        }
    } catch (SQLException ex) {
        Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
    }
    return users;
}

public List<User> getAllUser(String userRole, int page, int pageSize) {
    return getAllUser(null, userRole, page, pageSize);
}

public int getTotalUsers(String searchName, String userRole) {
    int total = 0;

    String sql = "SELECT COUNT(*) FROM User u WHERE is_verified = TRUE";
    String searchCondition = "";
    if (searchName != null && !searchName.isEmpty()) {
        searchCondition = " AND (u.FullName LIKE ? OR u.Phone LIKE ? OR u.Email LIKE ?)";
    }
    String roleCondition = "";
    if (userRole != null && !userRole.isEmpty()) {
        roleCondition = " AND u.role_id = ?";
    }
    sql += searchCondition + roleCondition;

    try {
        PreparedStatement ps = connection.prepareStatement(sql);
        int paramIndex = 1;
        if (searchName != null && !searchName.isEmpty()) {
            ps.setString(paramIndex++, "%" + searchName + "%");
            ps.setString(paramIndex++, "%" + searchName + "%");
            ps.setString(paramIndex++, "%" + searchName + "%");
        }
        if (userRole != null && !userRole.isEmpty()) {
            ps.setString(paramIndex++, userRole);
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

public int getTotalUsers(String userRole) {
    return getTotalUsers(null, userRole);
}
public List<Registration> getUserRegistration(int user_id) throws SQLException {
    ResultSet rs = null;
    List<Registration> listC = new ArrayList<>();
    
    String sql = "SELECT u.user_id, c.name, c.image, r.created AS 'Registration time', r.regis_status AS 'Status', r.registration_id " +
                 "FROM User u " +
                 "JOIN Registration r ON u.user_id = r.user_id " +
                 "JOIN Class c ON r.course_id = c.course_id " +
                 "WHERE u.user_id = ?";
    
    try {
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, user_id);
        rs = ps.executeQuery();
        
        while (rs.next()) {
            Registration r = new Registration();
            User u = new User();

            u.setUserID(rs.getInt(1));
            r.setUser_id(u);
            Class c = new Class();
            c.setName(rs.getString(2));
            c.setImage(rs.getString(3));
            r.setCourse_id(c);
            r.setCreated(rs.getTimestamp(4));
            r.setRegis_status(rs.getString(5));
            r.setRegistration_id(rs.getInt(6));
            
            listC.add(r);
            System.out.println(r.getRegis_status());
        }
        return listC;
    } catch (Exception e) {
        // Xử lý exception ở đây nếu cần
    }
    return listC;
}

public List<User> getAllUser() {
        ResultSet rs = null;

        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM user where role_id = 3";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                users.add(new User(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getDate(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getBoolean(9),
                        rs.getBoolean(10),
                        rs.getBoolean(11),
                        rs.getString(12)
                ));
            }
        } catch (Exception e) {
            // Xử lý exception ở đây, ví dụ: ghi log hoặc báo lỗi
        }
        return users;
    }

public List<User> getAllTeacher() {
        ResultSet rs = null;

        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM user where role_id = 2";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                users.add(new User(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getDate(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getBoolean(9),
                        rs.getBoolean(10),
                        rs.getBoolean(11),
                        rs.getString(12)
                ));
            }
        } catch (Exception e) {
            // Xử lý exception ở đây, ví dụ: ghi log hoặc báo lỗi
        }
        return users;
    }

public String getAuthorNameByID(String uid) {
    String authorName = null;
    String sql = "SELECT u.fullname FROM `user` u WHERE u.user_id = ?";
    
    try {
        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setString(1, uid);
        ResultSet rs = stm.executeQuery();

        if (rs.next()) {
            authorName = rs.getString("fullname");
        }
    } catch (Exception e) {
        System.out.println(e);
    }

    return authorName;
}
    public static void main(String[] args) {
        new UserDAO().insertGGEmail("longha@gmail.com", "123456","Long");
//
//        String userIdToFetch = "1"; // Thay đổi ID người dùng tại đây để lấy thông tin của người dùng khác
//        User detailedUser = userDAO.getDetailUser(userIdToFetch);
//
//        // Kiểm tra nếu thông tin người dùng không rỗng thì in ra thông tin chi tiết
//        if (detailedUser != null) {
//            System.out.println("Detailed User Information:");
//            System.out.println("User ID: " + detailedUser.getUserID());
//            System.out.println("Full Name: " + detailedUser.getFullName());
//            System.out.println("Email: " + detailedUser.getEmail());
//            System.out.println("Gender: " + (detailedUser.getGender() ? "Male" : "Female"));
//            System.out.println("Birthday: " + detailedUser.getBirthDate());
//            System.out.println("Phone: " + detailedUser.getPhone());
//            System.out.println("Role: " + detailedUser.getRole().getRole_name());
//            System.out.println("Status: " + (detailedUser.isStatus() ? "Active" : "Inactive"));
//            System.out.println("Address: " + detailedUser.getAddress());
//        } else {
//            System.out.println("User not found or error retrieving user information.");
//        }
//        User u = new User();
//        u.setEmail("123");
//        u.setFullName("1312");
//        u.setPassword("123132");
//        u.setPhone("123123");
//        u.setGender(true);
//        System.out.println(userDAO.createUser(u));
//        EncryptionUtil encryptionUtil = new EncryptionUtil();
////        System.out.println(encryptionUtil.encryptAES("d12dd"));
//// I/gaglfSKoJzvka9+jNG16ru5YptDGIJUMoL8LkP2wY=
//// I/gaglfSKoJzvka9 jNG16ru5YptDGIJUMoL8LkP2wY=
//        String email = "duongviet123abc@gmail.com";
////        System.out.println(encryptionUtil.encryptAES(email));
////        System.out.println(encryptionUtil.decryptAES("I_gaglfSKoJzvka9-jNG1--UX1sia1TS4tPHNfz0qRk="));
////        System.out.println(encryptionUtil.getMd5("vz123xxx"));
//        System.out.println(new UserDAO().getDetailUser(String.valueOf(2)).getFullName());
//        System.out.println(userDAO.login("hungnv1402832@fpt.edu.vn", "vietoccho"));
    }

    public User getUserByEmailGG(String email) {
        String sql = "SELECT * FROM User WHERE Email=?";
        User user = null;

        try {

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, email);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                user = new User();

                user.setUserID(resultSet.getInt("user_id"));
                user.setEmail(resultSet.getString("Email"));
                user.setPassword(resultSet.getString("Password"));
                user.setRole_id(resultSet.getInt("Role_ID"));
                user.setFullName(resultSet.getString("FullName"));
                user.setPhone(resultSet.getString("Phone"));
//                user.setAddress(resultSet.getString("Address"));
                user.setAvatar(resultSet.getString("Avatar"));
                user.setStatus(resultSet.getBoolean("Status"));
                user.setGender(resultSet.getBoolean("Gender"));
//                user.setBirthDate(resultSet.getDate("BirthDate"));
//                user.setBirthDatestr(resultSet.getString("BirthDate"));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        System.err.println(user);
        return user;
    }

    public void insertGGEmail(String email, String md5,String fullname) {
        String sql = "INSERT INTO User (Email, Password,FullName,role_id,status) VALUES (?, ?,?,3,1)";

        try ( PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, email);
            statement.setString(2, md5);
            statement.setString(3, fullname);
//            statement.setDate(5, new java.sql.Date(user.getBirthDate().getTime()));
//            statement.setString(5, user.getAddress());
            statement.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
        }
    }
   
}
