/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Context.DBContext;
import java.sql.PreparedStatement;
import Model.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import Common.Constant;

/**
 *
 * @author THTP
 */
public class PageDAO extends DBContext {

    public int addPageAndGetId(Page page) {
        int generatedId = -1;  // Giá trị mặc định nếu không có ID được tạo ra

        try ( PreparedStatement preparedStatement = connection.prepareStatement(
                "INSERT INTO page (name, url) VALUES (?, ?)", Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setString(1, page.getName());
            preparedStatement.setString(2, page.getUrl());
            preparedStatement.executeUpdate();

            // Lấy ResultSet chứa các ID được tạo ra
            try ( ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    generatedId = generatedKeys.getInt(1);  // Lấy ID đầu tiên (thường là ID tự tăng)
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý các ngoại lệ phù hợp
        }

        return generatedId;
    }

    // Retrieve a page by ID from the database
    public Page getPageById(int pageId) {
        Page page = null;
        try ( PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT * FROM page WHERE id = ?")) {
            preparedStatement.setInt(1, pageId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                page = new Page();
                page.setId(resultSet.getInt("id"));
                page.setName(resultSet.getString("name"));
                page.setUrl(resultSet.getString("url"));
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately
        }
        return page;
    }

    // Retrieve all pages from the database
    public List<Page> getAllPages() {
        List<Page> pages = new ArrayList<>();
        try ( PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT * FROM page")) {
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Page page = new Page();
                page.setId(resultSet.getInt("id"));
                page.setName(resultSet.getString("name"));
                page.setUrl(resultSet.getString("url"));
                pages.add(page);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately
        }
        return pages;
    }

    // Update a page in the database
    public void updatePage(Page page) {
        try ( PreparedStatement preparedStatement = connection.prepareStatement(
                "UPDATE page SET name = ?, url = ? WHERE id = ?")) {
            preparedStatement.setString(1, page.getName());
            preparedStatement.setString(2, page.getUrl());
            preparedStatement.setInt(3, page.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately
        }
    }

    // Delete a page from the database
    public void deletePage(int pageId) {
        try ( PreparedStatement preparedStatement = connection.prepareStatement(
                "DELETE FROM page WHERE id = ?")) {
            preparedStatement.setInt(1, pageId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately
        }
    }

    public boolean isApproval(String url, String role_id, String option) {
        boolean isApproved = false;
        String sql = "SELECT * "
                + "FROM page p "
                + "LEFT JOIN page_permission pageP ON p.id = pageP.page_id "
                + "WHERE p.url = ? AND pageP.role_id = ? AND pageP." + option + " = true";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, url);
            preparedStatement.setString(2, role_id);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                isApproved = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Xử lý các ngoại lệ phù hợp
        }
        return isApproved;

    }

    public List<Page> searchPagesByName(String name) {
        List<Page> pages = new ArrayList<>();
        try ( PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT * FROM page WHERE name LIKE ?")) {
            preparedStatement.setString(1, "%" + name + "%");
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Page page = new Page();
                page.setId(resultSet.getInt("id"));
                page.setName(resultSet.getString("name"));
                page.setUrl(resultSet.getString("url"));
                pages.add(page);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately
        }
        return pages;
    }

    public static void main(String[] args) {
        Page newPage = new Page();
        System.out.println(new PageDAO().searchPagesByName("page"));
    }
}
