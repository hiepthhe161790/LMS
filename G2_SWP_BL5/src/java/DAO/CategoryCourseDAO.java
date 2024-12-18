/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Context.DBContext;
import Model.CategoryCourse;
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
public class CategoryCourseDAO extends DBContext {

    PreparedStatement ps;
    ResultSet rs;

    public List<CategoryCourse> ListAllCategory() {
        List<CategoryCourse> categories = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Categories WHERE Status = true";
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                CategoryCourse c = new CategoryCourse();
                c.setCategoryID(rs.getInt(1));
                c.setCategoryName(rs.getString(2));
                c.setDescription(rs.getString(3));
                c.setStatus(rs.getBoolean(4));
                categories.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return categories;
    }

    public CategoryCourse GetCategoryByID(int categoryCourseID) {
        CategoryCourse category = null;
        try {
            String sql = "SELECT * FROM Categories WHERE CategoryID = ?";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, categoryCourseID);
            rs = ps.executeQuery();
            if (rs.next()) {
                category = new CategoryCourse();
                category.setCategoryID(rs.getInt("CategoryID"));
                category.setCategoryName(rs.getString("CategoryName"));
                category.setDescription(rs.getString("Description"));
                category.setStatus(rs.getBoolean("Status"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return category;
    }

    public void CreateCategoryCourse(CategoryCourse categoryCourse) {
        String sql = "INSERT INTO Categories (CategoryName, Description, Status) VALUES (?, ?, ?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, categoryCourse.getCategoryName());
            ps.setString(2, categoryCourse.getDescription());
            ps.setBoolean(3, true);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateCategory(CategoryCourse categoryCourse) {
        String sql = "UPDATE Categories SET CategoryName = ?, Description = ?, Status = ? WHERE CategoryID = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, categoryCourse.getCategoryName());
            ps.setString(2, categoryCourse.getDescription());
            ps.setBoolean(3, true);
            ps.setInt(4, categoryCourse.getCategoryID());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

//    public static void main(String[] args) {
//        CategoryCourseDAO dao = new CategoryCourseDAO();
//      List<CategoryCourse> listCat = dao.ListAllCategory();
//        CategoryCourse CatID = dao.GetCategoryByID(1);
//        System.out.println(CatID);
//    }
}
