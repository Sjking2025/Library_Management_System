package com.library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.library.beans.RegisterBean;
import com.library.util.PasswordUtil;

public class RegisterDao {
    
    public boolean createUser(RegisterBean user) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean isCreated = false;
        
        try {
            conn = DatabaseConnection.getConnection();
            
            // Hash password before storing
            String hashedPassword = PasswordUtil.hashPassword(user.getPassword());
            
            String sql = "INSERT INTO libraryuser (username, email, phoneno, password) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPhoneno());
            pstmt.setString(4, hashedPassword);
            
            int rowsAffected = pstmt.executeUpdate();
            isCreated = rowsAffected > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) DatabaseConnection.closeConnection(conn);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return isCreated;
    }
    
    public RegisterBean validateUser(String username, String password) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        RegisterBean user = null;
        
        try {
            conn = DatabaseConnection.getConnection();
            
            String sql = "SELECT * FROM libraryuser WHERE username = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                String storedHash = rs.getString("password");
                
                // Verify password
                if (PasswordUtil.verifyPassword(password, storedHash)) {
                    user = new RegisterBean();
                    user.setUserid(rs.getInt("userid"));
                    user.setUsername(rs.getString("username"));
                    user.setEmail(rs.getString("email"));
                    user.setPhoneno(rs.getString("phoneno"));
                }
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) DatabaseConnection.closeConnection(conn);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return user;
    }
    
    public boolean updateUser(RegisterBean user) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean isUpdated = false;
        
        try {
            conn = DatabaseConnection.getConnection();
            
            String sql = "UPDATE libraryuser SET username = ?, email = ?, phoneno = ? WHERE userid = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPhoneno());
            pstmt.setInt(4, user.getUserid());
            
            int rowsAffected = pstmt.executeUpdate();
            isUpdated = rowsAffected > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) DatabaseConnection.closeConnection(conn);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return isUpdated;
    }
    
    public RegisterBean getUserById(int userid) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        RegisterBean user = null;
        
        try {
            conn = DatabaseConnection.getConnection();
            
            String sql = "SELECT * FROM libraryuser WHERE userid = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userid);
            
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                user = new RegisterBean();
                user.setUserid(rs.getInt("userid"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setPhoneno(rs.getString("phoneno"));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) DatabaseConnection.closeConnection(conn);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return user;
    }
}
