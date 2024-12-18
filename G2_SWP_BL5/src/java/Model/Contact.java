/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Yen Do
 */
public class Contact {

    private int contactID;
    private String name;
    private String email;
    private String message;
    private String phone;
    private String subject;
    private ContactType contactType;
    private String note;
    private String status;
    private Boolean isDelete;

    public Contact() {
    }

    public Contact(int contactID, String name, String email, String message, String phone, String subject, ContactType contactType, String note, String status, Boolean isDelete) {
        this.contactID = contactID;
        this.name = name;
        this.email = email;
        this.message = message;
        this.phone = phone;
        this.subject = subject;
        this.contactType = contactType;
        this.note = note;
        this.status = status;
        this.isDelete = isDelete;
    }

    public int getContactID() {
        return contactID;
    }

    public void setContactID(int contactID) {
        this.contactID = contactID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public ContactType getContactType() {
        return contactType;
    }

    public void setContactType(ContactType contactType) {
        this.contactType = contactType;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Boolean getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Boolean isDelete) {
        this.isDelete = isDelete;
    }

    @Override
    public String toString() {
        return "Contact{" + "contactID=" + contactID + ", name=" + name + ", email=" + email + ", message=" + message + ", phone=" + phone + ", subject=" + subject + ", contactType=" + contactType + ", note=" + note + ", status=" + status + ", isDelete=" + isDelete + '}';
    }

}
