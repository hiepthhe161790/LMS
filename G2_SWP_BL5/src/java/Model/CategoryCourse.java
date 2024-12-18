/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Yen Do
 */
public class CategoryCourse {

    private int categoryID;
    private String categoryName;
    private String description;
    private Boolean Status;

    public CategoryCourse() {
    }

    public CategoryCourse(int categoryID, String categoryName, String description, Boolean Status) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.description = description;
        this.Status = Status;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getStatus() {
        return Status;
    }

    public void setStatus(Boolean Status) {
        this.Status = Status;
    }

    @Override
    public String toString() {
        return "Category{" + "categoryID=" + categoryID + ", categoryName=" + categoryName + ", description=" + description + ", Status=" + Status + '}';
    }

    

}
