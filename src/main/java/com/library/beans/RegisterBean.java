package com.library.beans;

public class RegisterBean {
    
    private int userid;
    private String username;
    private String email;
    private String phoneno;
    private String password;
    
    // Default Constructor
    public RegisterBean() {
    }
    
    // Parameterized Constructor
    public RegisterBean(String username, String email, String phoneno, String password) {
        this.username = username;
        this.email = email;
        this.phoneno = phoneno;
        this.password = password;
    }
    
    // Getters and Setters
    public int getUserid() {
        return userid;
    }
    
    public void setUserid(int userid) {
        this.userid = userid;
    }
    
    public String getUsername() {
        return username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getPhoneno() {
        return phoneno;
    }
    
    public void setPhoneno(String phoneno) {
        this.phoneno = phoneno;
    }
    
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
}
