package model.Blogs;

/**
 *
 * @author lap21
 */
public class Blogs {
    int id;
    String title;
    String path;
    String description;

    public Blogs() {
    }

    public Blogs(int id, String title, String path, String description) {
        this.id = id;
        this.title = title;
        this.path = path;
        this.description = description;
    }
    
    public Blogs(String title, String path, String description) {
        this.title = title;
        this.path = path;
        this.description = description;
    }
    public Blogs(String title, String path) {
        this.title = title;
        this.path = path;
        this.description = "";
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getPath() {
        return path;
    }

    public String getDescription() {
        return description;
    }
}
