/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Context.DBContext;
import Model.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author THTP
 */
public class PagePermissionDAO extends DBContext {
    // Insert a new page permission into the database

    public void addPagePermission(PagePermission pagePermission) {
        try ( PreparedStatement preparedStatement = connection.prepareStatement(
                "INSERT INTO page_permission (page_id, role_id, isReadable, isCreatable, isUpdatable, isDeletable) VALUES (?, ?, ?, ?, ?, ?)")) {
            preparedStatement.setInt(1, pagePermission.getPageId());
            preparedStatement.setInt(2, pagePermission.getRoleId());
            preparedStatement.setBoolean(3, pagePermission.isReadable());
            preparedStatement.setBoolean(4, pagePermission.isCreatable());
            preparedStatement.setBoolean(5, pagePermission.isUpdatable());
            preparedStatement.setBoolean(6, pagePermission.isDeletable());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately
        }
    }

    public void addPagePermissionsForRoles(int pageId) {
        try ( PreparedStatement preparedStatement = connection.prepareStatement(
                "INSERT INTO page_permission (page_id, role_id, isReadable, isCreatable, isUpdatable, isDeletable) "
                + "SELECT ?, role_id, 1, 1, 1, 1 FROM role")) {
            preparedStatement.setInt(1, pageId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately
        }
    }

    // Retrieve a page permission by ID from the database
    public PagePermission getPagePermissionById(int pagePermissionId) {
        PagePermission pagePermission = null;
        try ( PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT * FROM page_permission WHERE id = ?")) {
            preparedStatement.setInt(1, pagePermissionId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                pagePermission = new PagePermission();
                pagePermission.setId(resultSet.getInt("id"));
                pagePermission.setPageId(resultSet.getInt("page_id"));
                pagePermission.setRoleId(resultSet.getInt("role_id"));
                pagePermission.setReadable(resultSet.getBoolean("isReadable"));
                pagePermission.setCreatable(resultSet.getBoolean("isCreatable"));
                pagePermission.setUpdatable(resultSet.getBoolean("isUpdatable"));
                pagePermission.setDeletable(resultSet.getBoolean("isDeletable"));
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately
        }
        return pagePermission;
    }

    public List<PagePermission> getPagePermissionByPageId(int pageId) {
        List<PagePermission> listPG = new ArrayList<>();
        try ( PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT * FROM page_permission WHERE page_id = ?")) {
            preparedStatement.setInt(1, pageId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                PagePermission pagePermission = new PagePermission();
                pagePermission.setId(resultSet.getInt("id"));
                pagePermission.setPageId(resultSet.getInt("page_id"));
                pagePermission.setRoleId(resultSet.getInt("role_id"));
                pagePermission.setReadable(resultSet.getBoolean("isReadable"));
                pagePermission.setCreatable(resultSet.getBoolean("isCreatable"));
                pagePermission.setUpdatable(resultSet.getBoolean("isUpdatable"));
                pagePermission.setDeletable(resultSet.getBoolean("isDeletable"));
                listPG.add(pagePermission);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately
        }
        return listPG;
    }

    // Retrieve all page permissions from the database
    public List<PagePermission> getAllPagePermissions() {
        List<PagePermission> pagePermissions = new ArrayList<>();
        try ( PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT * FROM page_permission")) {
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                PagePermission pagePermission = new PagePermission();
                pagePermission.setId(resultSet.getInt("id"));
                pagePermission.setPageId(resultSet.getInt("page_id"));
                pagePermission.setRoleId(resultSet.getInt("role_id"));
                pagePermission.setReadable(resultSet.getBoolean("isReadable"));
                pagePermission.setCreatable(resultSet.getBoolean("isCreatable"));
                pagePermission.setUpdatable(resultSet.getBoolean("isUpdatable"));
                pagePermission.setDeletable(resultSet.getBoolean("isDeletable"));
                pagePermissions.add(pagePermission);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately
        }
        return pagePermissions;
    }

 
    // Update a page permission in the database
    public void togglePagePermissionOption(int pagePermissionId, String option) {
        try ( PreparedStatement preparedStatement = connection.prepareStatement(
                "UPDATE page_permission SET " + option + " = NOT " + option + " WHERE id = ?")) {
            preparedStatement.setInt(1, pagePermissionId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately
        }
    }

    // Delete a page permission from the database
    public void deletePagePermission(int pagePermissionId) {
        try ( PreparedStatement preparedStatement = connection.prepareStatement(
                "DELETE FROM page_permission WHERE id = ?")) {
            preparedStatement.setInt(1, pagePermissionId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Handle exceptions appropriately
        }
    }

    public static void main(String[] args) {

//        new PagePermissionDAO().togglePagePermissionOption(2, "isUpdatable");
//        System.out.println(new PagePermissionDAO().getPagePermissionByPageId(2));
 
//        System.out.println(new PagePermissionDAO().getPagePermissionByPageId(2));
    }
}
