/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Context.DBContext;
import Model.Contact;
import Model.ContactType;
import Model.Role;
import Model.Setting;
import Model.SettingType;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class SettingDAO extends DBContext {

    PreparedStatement ps;
    ResultSet rs;

    public Setting toSetting(ResultSet rs) {
        Setting setting = new Setting();
        RoleDAO dbRole = new RoleDAO();
        SubjectDAO dbSubject = new SubjectDAO();
        ContactTypeDAO dbContactType = new ContactTypeDAO();
        SettingTypeDAO dbSettingType = new SettingTypeDAO();
        try {
            setting.setId(rs.getInt("setting_id"));
            setting.setName(rs.getString("setting_name"));
            setting.setStatus(rs.getBoolean("status"));

            SettingType settingType = dbSettingType.getSettingById(rs.getInt("setting_type_id"));

            setting.setSettingType(settingType);
            setting.setOrder(rs.getInt("order"));

            setting.setDescription(rs.getString("description"));
            setting.setMapped_values(rs.getString("mapped_values"));
        } catch (SQLException ex) {
            Logger.getLogger(SettingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return setting;
    }

    public List<Setting> getAllSettingType() {
        List<Setting> settings = new ArrayList<>();
        String sql = "select * from setting";

        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                settings.add(toSetting(rs));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return settings;
    }

    public List<Setting> getAllSetting(String searchName, int page, int pageSize) {
        List<Setting> settings = new ArrayList<>();
        String sql = "SELECT * "
                + "FROM setting s ";

        String searchCondition = "";
        if (searchName != null && !searchName.isEmpty()) {
            searchCondition = " WHERE s.setting_name LIKE ? OR s.description LIKE ? OR s.mapped_values LIKE ?";
        }

        String limitClause = " LIMIT ?, ?";

        sql += searchCondition + limitClause;

        try {
            ps = connection.prepareStatement(sql);
            int paramIndex = 1;
            if (searchName != null && !searchName.isEmpty()) { // Đặt các tham số cho câu lệnh SQL (nếu có điều kiện tìm kiếm)
                String searchValue = "%" + searchName + "%";
                ps.setString(paramIndex++, searchValue);
                ps.setString(paramIndex++, searchValue);
                ps.setString(paramIndex++, searchValue);
            }
            int start = (page - 1) * pageSize; // Đặt các tham số cho phần giới hạn (limit) của câu lệnh SQL
            ps.setInt(paramIndex++, start);
            ps.setInt(paramIndex++, pageSize);
            rs = ps.executeQuery();  // Thực hiện truy vấn cơ sở dữ liệu
            while (rs.next()) {
                settings.add(toSetting(rs));// Xử lý kết quả truy vấn và thêm các đối tượng Setting vào danh sách
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return settings;
    }

    public List<Setting> getAllSetting(int page, int pageSize) {
        return getAllSetting(null, page, pageSize);
    }

    public int getTotalSetting(String searchName) {
        int total = 0;

        String sql = "SELECT COUNT(*) FROM Setting s ";
        String searchCondition = "";
        if (searchName != null && !searchName.isEmpty()) {
            searchCondition = " WHERE c.Name LIKE ? OR c.Phone LIKE ? OR c.Email LIKE ?";
        }
        sql += searchCondition;

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            if (searchName != null && !searchName.isEmpty()) {
                ps.setString(1, "%" + searchName + "%");
                ps.setString(2, "%" + searchName + "%");
                ps.setString(3, "%" + searchName + "%");
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

    public int getTotalSetting() {
        return getTotalSetting(null);
    }

    public void updateStatus(int id, boolean value) {
        String sql = "UPDATE setting SET status = ? WHERE setting_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setBoolean(1, value);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Setting getSettingById(int id) {
        String sql = "select * from setting where setting_id = ? ";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return toSetting(rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateSetting(Setting setting) {
        String sql = "UPDATE setting SET setting_name = ?, mapped_values = ?, `order` = ?, description = ?, status = ?, setting_type_id = ? WHERE setting_id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, setting.getName());
            ps.setString(2, setting.getMapped_values());
            ps.setInt(3, setting.getOrder());
            ps.setString(4, setting.getDescription());
            ps.setBoolean(5, setting.isStatus());
            ps.setInt(6, setting.getSettingType().getId());
            ps.setInt(7, setting.getId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addSetting(String name, String mapped_values, boolean status, int order, String description, int type) {

        String sql = "INSERT INTO setting(setting_name,status,`order`,description,mapped_values,setting_type_id) VALUES(?,?,?,?,?,?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setBoolean(2, status);
            ps.setInt(3, order);
            ps.setString(4, description);
            ps.setString(5, mapped_values);
            ps.setInt(6, type);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
