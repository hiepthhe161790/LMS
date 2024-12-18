/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author THTP
 */
public class PagePermission {

    private int id;
    private int pageId;
    private int roleId;
    private boolean isReadable;
    private boolean isCreatable;
    private boolean isUpdatable;
    private boolean isDeletable;

    // Constructors
    public PagePermission() {
    }

    public PagePermission(int pageId, int roleId, boolean isReadable, boolean isCreatable, boolean isUpdatable, boolean isDeletable) {
        this.pageId = pageId;
        this.roleId = roleId;
        this.isReadable = isReadable;
        this.isCreatable = isCreatable;
        this.isUpdatable = isUpdatable;
        this.isDeletable = isDeletable;
    }

    public PagePermission(int id, int pageId, int roleId, boolean isReadable, boolean isCreatable, boolean isUpdatable, boolean isDeletable) {
        this.id = id;
        this.pageId = pageId;
        this.roleId = roleId;
        this.isReadable = isReadable;
        this.isCreatable = isCreatable;
        this.isUpdatable = isUpdatable;
        this.isDeletable = isDeletable;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPageId() {
        return pageId;
    }

    public void setPageId(int pageId) {
        this.pageId = pageId;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public boolean isReadable() {
        return isReadable;
    }

    public void setReadable(boolean readable) {
        isReadable = readable;
    }

    public boolean isCreatable() {
        return isCreatable;
    }

    public void setCreatable(boolean creatable) {
        isCreatable = creatable;
    }

    public boolean isUpdatable() {
        return isUpdatable;
    }

    public void setUpdatable(boolean updatable) {
        isUpdatable = updatable;
    }

    public boolean isDeletable() {
        return isDeletable;
    }

    public void setDeletable(boolean deletable) {
        isDeletable = deletable;
    }

    @Override
    public String toString() {
        return "PagePermission{"
                + "id=" + id
                + ", pageId=" + pageId
                + ", roleId=" + roleId
                + ", isReadable=" + isReadable
                + ", isCreatable=" + isCreatable
                + ", isUpdatable=" + isUpdatable
                + ", isDeletable=" + isDeletable
                + '}';
    }
}
