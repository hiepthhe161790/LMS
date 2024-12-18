package Model;

public class Page {

    private int id;
    private String name;
    private String url;

    // Constructors
    public Page() {
    }

    public Page(String name, String url) {
        this.name = name;
        this.url = url;
    }

    public Page(int id, String name, String url) {
        this.id = id;
        this.name = name;
        this.url = url;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "Page [id=" + id + ", name=" + name + ", url=" + url + "]";
    }
}
