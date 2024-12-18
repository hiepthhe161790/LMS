/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author VIETHUNG
 */
public class DashboardDAO  extends DBContext{
    


    
    // Phương thức lấy số lượng User
    public int countUsers() {
        String sql = "SELECT COUNT(*) FROM User";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Phương thức lấy số lượng Class
    public int countClasses() {
        String sql = "SELECT COUNT(*) FROM Class";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Phương thức lấy số lượng Blog
    public int countBlogs() {
        String sql = "SELECT COUNT(*) FROM Blog";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Phương thức lấy số lượng Contact
    public int countContacts() {
        String sql = "SELECT COUNT(*) FROM Contact";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    
     public static void main(String[] args) {
        DashboardDAO dashboardDAO = new DashboardDAO();

        // Test countUsers()
        int userCount = dashboardDAO.countUsers();
        System.out.println("Number of users: " + userCount);

        // Test countClasses()
        int classCount = dashboardDAO.countClasses();
        System.out.println("Number of classes: " + classCount);

        // Test countBlogs()
        int blogCount = dashboardDAO.countBlogs();
        System.out.println("Number of blogs: " + blogCount);

        // Test countContacts()
        int contactCount = dashboardDAO.countContacts();
        System.out.println("Number of contacts: " + contactCount);
    }


   
    
}
