/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Context.DBContext;
import Model.ContactType;
import Model.Subject;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ContactTypeDAO extends DBContext {

    PreparedStatement ps;
    ResultSet rs;

    public ContactType toContactType(ResultSet rs) {
        ContactType contactType = new ContactType();
        try {
            contactType.setContactTypeID(rs.getInt("ContactTypeID"));
            contactType.setName(rs.getString("Name"));
            contactType.setDescription(rs.getString("description"));
            return contactType;
        } catch (SQLException ex) {
            Logger.getLogger(ContactTypeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return contactType;

    }

    public ContactType getContactTypeById(int id) {
        String sql = "select * from contacttype where ContactTypeID = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return toContactType(rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<ContactType> getAllContactType() {
        List<ContactType> contactTypes = new ArrayList<>();
        String sql = "select * from contacttype";
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                contactTypes.add(toContactType(rs));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return contactTypes;
    }

}
