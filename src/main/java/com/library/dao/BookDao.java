package com.library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.library.beans.BookBean;

public class BookDao {
    
    public List<BookBean> getBooks() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<BookBean> bookList = new ArrayList<>();
        
        try {
            conn = DatabaseConnection.getConnection();
            
            String sql = "SELECT * FROM books ORDER BY bookid";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                BookBean book = new BookBean();
                book.setBookid(rs.getInt("bookid"));
                book.setBookname(rs.getString("bookname"));
                book.setAuthorname(rs.getString("authorname"));
                book.setAvailablestatus(rs.getString("availablestatus"));
                bookList.add(book);
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
        
        return bookList;
    }
    
    public boolean addBook(BookBean book) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean isAdded = false;
        
        try {
            conn = DatabaseConnection.getConnection();
            
            String sql = "INSERT INTO books (bookname, authorname, availablestatus) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, book.getBookname());
            pstmt.setString(2, book.getAuthorname());
            pstmt.setString(3, book.getAvailablestatus());
            
            int rowsAffected = pstmt.executeUpdate();
            isAdded = rowsAffected > 0;
            
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
        
        return isAdded;
    }
    
    public boolean updateBook(BookBean book) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean isUpdated = false;
        
        try {
            conn = DatabaseConnection.getConnection();
            
            String sql = "UPDATE books SET bookname = ?, authorname = ?, availablestatus = ? WHERE bookid = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, book.getBookname());
            pstmt.setString(2, book.getAuthorname());
            pstmt.setString(3, book.getAvailablestatus());
            pstmt.setInt(4, book.getBookid());
            
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
    
    public boolean deleteBook(int bookid) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean isDeleted = false;
        
        try {
            conn = DatabaseConnection.getConnection();
            
            String sql = "DELETE FROM books WHERE bookid = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, bookid);
            
            int rowsAffected = pstmt.executeUpdate();
            isDeleted = rowsAffected > 0;
            
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
        
        return isDeleted;
    }
    
    public BookBean getBookById(int bookid) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BookBean book = null;
        
        try {
            conn = DatabaseConnection.getConnection();
            
            String sql = "SELECT * FROM books WHERE bookid = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, bookid);
            
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                book = new BookBean();
                book.setBookid(rs.getInt("bookid"));
                book.setBookname(rs.getString("bookname"));
                book.setAuthorname(rs.getString("authorname"));
                book.setAvailablestatus(rs.getString("availablestatus"));
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
        
        return book;
    }
}
