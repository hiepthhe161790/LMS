/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;
import Model.User;
import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author Huy Linh
 */
public class Registration {
    private int registration_id;
    private Class course_id;
    private User user_id;
    private Timestamp created;
    private String regis_status;
    
    public Registration() {
    }

    public Registration(int registration_id, Class course_id, User user_id, Timestamp created, String regis_status) {
        this.registration_id = registration_id;
        this.course_id = course_id;
        this.user_id = user_id;
        this.created = created;
        this.regis_status = regis_status;
    }

    public int getRegistration_id() {
        return registration_id;
    }

    public void setRegistration_id(int registration_id) {
        this.registration_id = registration_id;
    }

    public Class getCourse_id() {
        return course_id;
    }

    public void setCourse_id(Class course_id) {
        this.course_id = course_id;
    }

    

    public User getUser_id() {
        return user_id;
    }

    public void setUser_id(User user_id) {
        this.user_id = user_id;
    }

    public Timestamp getCreated() {
        return created;
    }

    public void setCreated(Timestamp created) {
        this.created = created;
    }

    public String getRegis_status() {
        return regis_status;
    }

    public void setRegis_status(String regis_status) {
        this.regis_status = regis_status;
    }

}
