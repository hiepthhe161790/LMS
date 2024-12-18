/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author THTP
 */
import java.util.Arrays;

public class AssignmentSubmission {

    private int assignmentSubmissionId;
    private int assignmentId;
    private int studentId;
    private byte[] submitFile;
    private String submitComment;
    private String submitFileContextType;
    public AssignmentSubmission() {
    }

    public AssignmentSubmission(int assignmentSubmissionId, int assignmentId, int studentId, byte[] submitFile, String submitComment,String submitFileContextType) {
        this.assignmentSubmissionId = assignmentSubmissionId;
        this.assignmentId = assignmentId;
        this.studentId = studentId;
        this.submitFile = submitFile;
        this.submitComment = submitComment;
        this.submitFileContextType = submitFileContextType;
    }

    public AssignmentSubmission(int assignmentId, int studentId, byte[] submitFile, String submitComment) {
        this.assignmentId = assignmentId;
        this.studentId = studentId;
        this.submitFile = submitFile;
        this.submitComment = submitComment;
    }

   
    public int getAssignmentSubmissionId() {
        return assignmentSubmissionId;
    }

    public void setAssignmentSubmissionId(int assignmentSubmissionId) {
        this.assignmentSubmissionId = assignmentSubmissionId;
    }

    public int getAssignmentId() {
        return assignmentId;
    }

    public void setAssignmentId(int assignmentId) {
        this.assignmentId = assignmentId;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public byte[] getSubmitFile() {
        return submitFile;
    }

    public void setSubmitFile(byte[] submitFile) {
        this.submitFile = submitFile;
    }

    public String getSubmitComment() {
        return submitComment;
    }

    public void setSubmitComment(String submitComment) {
        this.submitComment = submitComment;
    }

    public String getSubmitFileContextType() {
        return submitFileContextType;
    }

    public void setSubmitFileContextType(String submitFileContextType) {
        this.submitFileContextType = submitFileContextType;
    }

    @Override
    public String toString() {
        return "AssignmentSubmission{" + "assignmentSubmissionId=" + assignmentSubmissionId + ", assignmentId=" + assignmentId + ", studentId=" + studentId + ", submitFile=" + submitFile + ", submitComment=" + submitComment + ", submitFileContextType=" + submitFileContextType + '}';
    }

  
}
