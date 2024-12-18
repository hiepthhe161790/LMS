/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author THTP
 */
import java.util.Date;

public class Assignment {

    private int assignmentId;
    private int lessonId;
    private String assignmentName;
    private Date dueDate;
    private String description;
    private String status;
    private byte[] file;
    private Boolean isDeleted;

    public Assignment() {
    }

    public Assignment(int assignmentId, int lessonId, String assignmentName, Date dueDate, String description, String status, byte[] file, Boolean isDeleted) {
        this.assignmentId = assignmentId;
        this.lessonId = lessonId;
        this.assignmentName = assignmentName;
        this.dueDate = dueDate;
        this.description = description;
        this.status = status;
        this.file = file;
        this.isDeleted = isDeleted;
    }

    public Assignment(int lessonId, String assignmentName, Date dueDate, String description, String status, byte[] file, Boolean isDeleted) {
        this.lessonId = lessonId;
        this.assignmentName = assignmentName;
        this.dueDate = dueDate;
        this.description = description;
        this.status = status;
        this.file = file;
        this.isDeleted = isDeleted;
    }

    public int getAssignmentId() {
        return assignmentId;
    }

    public void setAssignmentId(int assignmentId) {
        this.assignmentId = assignmentId;
    }

    public int getLessonId() {
        return lessonId;
    }

    public void setLessonId(int lessonId) {
        this.lessonId = lessonId;
    }

    public String getAssignmentName() {
        return assignmentName;
    }

    public void setAssignmentName(String assignmentName) {
        this.assignmentName = assignmentName;
    }

    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public byte[] getFile() {
        return file;
    }

    public void setFile(byte[] file) {
        this.file = file;
    }

    public Boolean getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Boolean isDeleted) {
        this.isDeleted = isDeleted;
    }

    @Override
    public String toString() {
        return "Assignment{" + "assignmentId=" + assignmentId + ", lessonId=" + lessonId + ", assignmentName=" + assignmentName + ", dueDate=" + dueDate + ", description=" + description + ", status=" + status + ", file=" + file + ", isDeleted=" + isDeleted + '}';
    }

}
