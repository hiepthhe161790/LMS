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
public class AssignmentSubmissionDAO extends DBContext {
    // CREATE

    public void addAssignmentSubmission(AssignmentSubmission submission) {
        String query = "INSERT INTO assignment_submission (assignment_id, student_id, submit_file, submit_comment,submit_file_context_type) VALUES (?, ?, ?, ?,?)";

        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, submission.getAssignmentId());
            statement.setInt(2, submission.getStudentId());
            statement.setBytes(3, submission.getSubmitFile());
            statement.setString(4, submission.getSubmitComment());
            statement.setString(5, submission.getSubmitFileContextType());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AssignmentSubmissionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // READ
    public AssignmentSubmission getAssignmentSubmissionById(int id) {
        AssignmentSubmission submission = null;

        String query = "SELECT * FROM assignment_submission WHERE assignment_submission_id = ?";

        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);

            try ( ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    submission = mapResultSetToAssignmentSubmission(resultSet);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AssignmentSubmissionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return submission;
    }

    public List<AssignmentSubmission> getListAssignmentSubmissionByAssignmentID(int assignmentID, String search) {
        List<AssignmentSubmission> submissions = new ArrayList<>();

        String query = "SELECT * FROM assignment_submission WHERE assignment_id = ? and submit_comment like ?";

        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, assignmentID); 
            statement.setString(2, "%" +  search+"%");


            try ( ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    AssignmentSubmission submission = mapResultSetToAssignmentSubmission(resultSet);
                    submissions.add(submission);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AssignmentSubmissionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return submissions;
    }

    // UPDATE
    public void updateAssignmentSubmission(AssignmentSubmission submission) {
        String query = "UPDATE assignment_submission SET assignment_id = ?, student_id = ?, submit_file = ?, submit_comment = ? WHERE assignment_submission_id = ?";

        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, submission.getAssignmentId());
            statement.setInt(2, submission.getStudentId());
            statement.setBytes(3, submission.getSubmitFile());
            statement.setString(4, submission.getSubmitComment());
            statement.setInt(5, submission.getAssignmentSubmissionId());

            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AssignmentSubmissionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // DELETE
    public void deleteAssignmentSubmission(int id) {
        String query = "DELETE FROM assignment_submission WHERE assignment_submission_id = ?";

        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AssignmentSubmissionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Other methods...
    private AssignmentSubmission mapResultSetToAssignmentSubmission(ResultSet resultSet) throws SQLException {
        AssignmentSubmission submission = new AssignmentSubmission();
        submission.setAssignmentSubmissionId(resultSet.getInt("assignment_submission_id"));
        submission.setAssignmentId(resultSet.getInt("assignment_id"));
        submission.setStudentId(resultSet.getInt("student_id"));
        submission.setSubmitFile(resultSet.getBytes("submit_file"));
        submission.setSubmitComment(resultSet.getString("submit_comment"));
        submission.setSubmitFileContextType(resultSet.getString("submit_file_context_type"));
        return submission;
    }


}
