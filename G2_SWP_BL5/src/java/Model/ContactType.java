/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Yen Do
 */
public class ContactType {

    private int contactTypeID;
    private String name;
    private String description;

    public ContactType() {
    }

    public ContactType(int contactTypeID, String name, String description) {
        this.contactTypeID = contactTypeID;
        this.name = name;
        this.description = description;
    }

    // Getter and Setter methods
    public int getContactTypeID() {
        return contactTypeID;
    }

    public void setContactTypeID(int contactTypeID) {
        this.contactTypeID = contactTypeID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    // toString method (for debugging or logging purposes)
    @Override
    public String toString() {
        return "ContactType{"
                + "contactTypeID=" + contactTypeID
                + ", name='" + name + '\''
                + ", description='" + description + '\''
                + '}';
    }
}
