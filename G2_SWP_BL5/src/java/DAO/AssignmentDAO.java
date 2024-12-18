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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author THTP
 */
public class AssignmentDAO extends DBContext {

    public List<Assignment> getAllAssignments() {
        List<Assignment> assignments = new ArrayList<>();
        String query = "SELECT * FROM assignment";

        try ( PreparedStatement statement = connection.prepareStatement(query);  ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Assignment assignment = mapResultSetToAssignment(resultSet);
                assignments.add(assignment);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AssignmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return assignments;
    }

        public List<Assignment> getAllAssignmentsByLID(String lessId) {
        List<Assignment> assignments = new ArrayList<>();
        String query = "SELECT * FROM assignment where lesson_id = " + lessId;

        try ( PreparedStatement statement = connection.prepareStatement(query);  ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Assignment assignment = mapResultSetToAssignment(resultSet);
                assignments.add(assignment);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AssignmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return assignments;
    }
    public Assignment getAssignmentById(int id) {
        Assignment assignment = null; // Initialize to null

        String query = "SELECT * FROM assignment WHERE assignment_id = ?";

        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);

            try ( ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    assignment = mapResultSetToAssignment(resultSet);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AssignmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return assignment;
    }

    // Other CRUD methods (create, update, delete) can be added based on your requirements
    private Assignment mapResultSetToAssignment(ResultSet resultSet) throws SQLException {
        Assignment assignment = new Assignment();
        assignment.setAssignmentId(resultSet.getInt("assignment_id"));
        assignment.setLessonId(resultSet.getInt("lesson_id"));
        assignment.setAssignmentName(resultSet.getString("assignment_name"));
        assignment.setDueDate(resultSet.getTimestamp("due_date"));
        assignment.setDescription(resultSet.getString("description"));
        assignment.setStatus(resultSet.getString("status"));
        assignment.setFile(resultSet.getBytes("file"));
        assignment.setIsDeleted(resultSet.getBoolean("is_deleted"));
        return assignment;
    }

    public static void main(String[] args) throws SQLException {
        System.out.println(new AssignmentDAO().getAssignmentById(5));
    }
}
