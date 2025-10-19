package com.library.beans;

public class BookBean {
    
    private int bookid;
    private String bookname;
    private String authorname;
    private String availablestatus;
    
    // Default Constructor
    public BookBean() {
    }
    
    // Parameterized Constructor
    public BookBean(String bookname, String authorname, String availablestatus) {
        this.bookname = bookname;
        this.authorname = authorname;
        this.availablestatus = availablestatus;
    }
    
    // Getters and Setters
    public int getBookid() {
        return bookid;
    }
    
    public void setBookid(int bookid) {
        this.bookid = bookid;
    }
    
    public String getBookname() {
        return bookname;
    }
    
    public void setBookname(String bookname) {
        this.bookname = bookname;
    }
    
    public String getAuthorname() {
        return authorname;
    }
    
    public void setAuthorname(String authorname) {
        this.authorname = authorname;
    }
    
    public String getAvailablestatus() {
        return availablestatus;
    }
    
    public void setAvailablestatus(String availablestatus) {
        this.availablestatus = availablestatus;
    }
}
