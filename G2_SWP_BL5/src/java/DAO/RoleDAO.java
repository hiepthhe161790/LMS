/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.util.ArrayList;
import java.util.List;
import Model.Role;


public class RoleDAO extends MyDAO {

    public String getRoleNameByUserId(int id) {
        String roleName = null;
        String statement = "SELECT r.role_name FROM [User] u INNER JOIN [Role] r ON u.role_id = r.role_id WHERE u.UserID = ?";
        try {
            ps = con.prepareStatement(statement);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                roleName = rs.getString("role_name");
            }
            return roleName;
        } catch (Exception e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return roleName;
    }
        public String getRoleNameByRoleId(int id) {
        String roleName = null;
        String statement = "SELECT r.role_name from role r where r.role_id = ?";
        try {
            ps = con.prepareStatement(statement);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                roleName = rs.getString("role_name");
            }
            return roleName;
        } catch (Exception e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return roleName;
    }

    public List<Role> getAllRole() {
        List<Role> roles = new ArrayList<>();
        String statement = "SELECT * from role r ";
        try {
            ps = con.prepareStatement(statement);
            rs = ps.executeQuery();
            while (rs.next()) {
                Role role = new Role();
                role.setRole_id(rs.getInt("role_id"));
                role.setRole_name(rs.getString("role_name"));
                roles.add(role);
            }
        } catch (Exception e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return roles;
    }
    
        public String getRoleNameById(int id) {
        String roleName = null;
        String statement = "SELECT role_name FROM Role WHERE role_id = ?";
        try {
            ps = con.prepareStatement(statement);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                roleName = rs.getString("role_name");
            }
            return roleName;
        } catch (Exception e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return roleName;
    }

    public List<Role> getAllRoles() {
        List<Role> roles = new ArrayList<>();
        String statement = "SELECT role_id, role_name FROM Role";
        try {
            ps = con.prepareStatement(statement);
            rs = ps.executeQuery();
            while (rs.next()) {
                int roleId = rs.getInt("role_id");
                String roleName = rs.getString("role_name");

                Role role = new Role();
                role.setRole_id(roleId);
                role.setRole_name(roleName);

                roles.add(role);
            }
        } catch (Exception e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return roles;
    }
        public static void main(String[] args) {
        System.out.println(new RoleDAO().getAllRoles());
    }
}





