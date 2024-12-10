public class BookData {
    private String title;
    private String authorname;
    private String genre;
    private String id;
    // Constructor
   

    //public BookData(String title, String authorname, int copies, String genre) {
     //   this.title = title;
     //   this.authorname = authorname;
     //   this.copies = copies;
     //   this.genre = genre;
    //}

    // Getters and Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthorname() {
        return authorname;
    }

    public void setAuthorname(String authorname) {
        this.authorname = authorname;
    }


    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }
}
