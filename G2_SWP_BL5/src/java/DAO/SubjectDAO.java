/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Context.DBContext;
import Model.Setting;
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
 * @author nocol
 */
public class SubjectDAO extends DBContext {

    PreparedStatement ps;
    ResultSet rs;

    public Subject toSubject(ResultSet rs) {
        Subject subject = new Subject();
        try {
            subject.setId(rs.getInt("id"));
            subject.setName(rs.getString("name"));
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return subject;

    }

    public Subject getSubjectById(int id) {
        String sql = "select * from subject where id = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {

                return toSubject(rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Subject> getAllSubject() {
        List<Subject> subjects = new ArrayList<>();
        String sql = "select * from subject";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                subjects.add(toSubject(rs));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return subjects;
    }

}

