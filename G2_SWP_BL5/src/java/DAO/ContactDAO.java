/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Context.DBContext;
import Model.Contact;
import Model.ContactType;
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
public class ContactDAO extends DBContext {

    PreparedStatement ps;
    ResultSet rs;

    public List<ContactType> getAllContactType() {
        List<ContactType> contactTypes = new ArrayList<>();
        String sql = "SELECT * FROM ContactType";

        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                int contactTypeID = rs.getInt("ContactTypeID");
                String name = rs.getString("Name");
                String description = rs.getString("Description");

                ContactType contactType = new ContactType(contactTypeID, name, description);
                contactTypes.add(contactType);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return contactTypes;
    }

    public void createContact(Contact contact) {
        String sql = "INSERT INTO Contact (Name, Email, Message, Phone, Subject, ContactTypeID, Status, IsDelete) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, contact.getName());
            ps.setString(2, contact.getEmail());
            ps.setString(3, contact.getMessage());
            ps.setString(4, contact.getPhone());
            ps.setString(5, contact.getSubject());
            ps.setInt(6, contact.getContactType().getContactTypeID());
            ps.setString(7,contact.getStatus());
            ps.setBoolean(8, true);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateStatus(int contactID) {
        String sql = "UPDATE Contact SET IsDelete = ? WHERE ContactID = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setBoolean(1, false);
            ps.setInt(2, contactID);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Contact getContactById(int contactID) {
        String sql = "SELECT c.ContactID, c.Name AS ContactName, c.Email, c.Phone, c.Subject, c.Message, cp.ContactTypeID, cp.Name AS ContactTypeName, cp.Description "
                + "FROM Contact c JOIN ContactType cp ON c.ContactTypeID = cp.ContactTypeID WHERE c.ContactID= ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, contactID);
            rs = ps.executeQuery();
            if (rs.next()) {
                Contact contact = new Contact();
                contact.setContactID(rs.getInt("ContactID"));
                contact.setName(rs.getString("ContactName"));
                contact.setEmail(rs.getString("Email"));
                contact.setPhone(rs.getString("Phone"));
                contact.setSubject(rs.getString("Subject"));
                contact.setMessage(rs.getString("Message"));

                ContactType contactType = new ContactType();
                contactType.setContactTypeID(rs.getInt("ContactTypeID"));
                contactType.setName(rs.getString("ContactTypeName"));
                contactType.setDescription(rs.getString("Description"));

                contact.setContactType(contactType);
                return contact;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public List<Contact> getAllContact(String searchName, int page, int pageSize) {
        List<Contact> listontCact = new ArrayList<>();
        String sql = "SELECT c.ContactID, c.Name AS ContactName, c.Email, c.Phone, c.Subject, c.Message, cp.ContactTypeID, cp.Name AS ContactTypeName, cp.Description, c.Status "
                + "FROM Contact c JOIN ContactType cp ON c.ContactTypeID = cp.ContactTypeID"
                + " WHERE c.Status = true";

        String searchCondition = "";
        if (searchName != null && !searchName.isEmpty()) {
            searchCondition = " AND (c.Name LIKE ? OR c.Phone LIKE ? OR c.Email LIKE ?)";
        }

        String limitClause = " LIMIT ?, ?";

        sql += searchCondition + limitClause;

        try {
            ps = connection.prepareStatement(sql);
            int paramIndex = 1;
            if (searchName != null && !searchName.isEmpty()) {
                String searchValue = "%" + searchName + "%";
                ps.setString(paramIndex++, searchValue);
                ps.setString(paramIndex++, searchValue);
                ps.setString(paramIndex++, searchValue);
            }
            int start = (page - 1) * pageSize;
            ps.setInt(paramIndex++, start);
            ps.setInt(paramIndex++, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                Contact contact = new Contact();
                contact.setContactID(rs.getInt("ContactID"));
                contact.setName(rs.getString("ContactName"));
                contact.setEmail(rs.getString("Email"));
                contact.setPhone(rs.getString("Phone"));
                contact.setSubject(rs.getString("Subject"));
                contact.setMessage(rs.getString("Message"));
                contact.setMessage(rs.getString("Status"));

                ContactType contactType = new ContactType();
                contactType.setContactTypeID(rs.getInt("ContactTypeID"));
                contactType.setName(rs.getString("ContactTypeName"));
                contactType.setDescription(rs.getString("Description"));

                contact.setContactType(contactType);
                listontCact.add(contact);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listontCact;
    }

    public List<Contact> getAllContact(int page, int pageSize) {
        return getAllContact(null, page, pageSize);
    }

    public int getTotalContacts(String searchName) {
        int total = 0;

        String sql = "SELECT COUNT(*) FROM Contact c JOIN ContactType cp ON c.ContactTypeID = cp.ContactTypeID WHERE c.Status = true";
        String searchCondition = "";
        if (searchName != null && !searchName.isEmpty()) {
            searchCondition = " AND (c.Name LIKE ? OR c.Phone LIKE ? OR c.Email LIKE ?)";
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

    public int getTotalContacts() {
        return getTotalContacts(null);
    }

    public List<Contact> getAllContactByEmail(String email) {
        List<Contact> listontCact = new ArrayList<>();
        String sql = "SELECT c.ContactID, c.Name AS ContactName, c.Email, c.Phone, c.Message, cp.ContactTypeID, cp.Name AS ContactTypeName, cp.Description "
                + "FROM Contact c JOIN ContactType cp ON c.ContactTypeID = cp.ContactTypeID"
                + " WHERE c.Email = ?";

        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                Contact contact = new Contact();
                contact.setContactID(rs.getInt("ContactID"));
                contact.setName(rs.getString("ContactName"));
                contact.setEmail(rs.getString("Email"));
                contact.setPhone(rs.getString("Phone"));
                contact.setMessage(rs.getString("Message"));
                ContactType contactType = new ContactType();
                contactType.setContactTypeID(rs.getInt("ContactTypeID"));
                contactType.setName(rs.getString("ContactTypeName"));
                contactType.setDescription(rs.getString("Description"));

                contact.setContactType(contactType);
                listontCact.add(contact);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listontCact;
    }

    public static void main(String[] args) {
        ContactDAO dao = new ContactDAO();
        List<Contact> listCon = dao.getAllContact(1, 5);
        System.out.println(listCon.toString());
    }
}
