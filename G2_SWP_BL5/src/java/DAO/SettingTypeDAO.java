/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Context.DBContext;
import Model.Setting;
import Model.SettingType;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class SettingTypeDAO extends DBContext {

    PreparedStatement ps;
    ResultSet rs;

    private SettingType toSettingType(ResultSet rs) {
        SettingType settingType = new SettingType();

        try {
            settingType.setId(rs.getInt("id"));
            settingType.setName(rs.getString("name"));
        } catch (SQLException ex) {
            Logger.getLogger(SettingTypeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return settingType;
    }

    public SettingType getSettingById(int id) {
        String sql = "select * from setting_type where id = ? ";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return toSettingType(rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<SettingType> getAllSettingType() {
        List<SettingType> settingTypes = new ArrayList<>();
        String sql = "select * from setting_type ";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                settingTypes.add(toSettingType(rs));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return settingTypes;
    }
}
