<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.library.dao.BookDao, com.library.beans.BookBean" %>
<%
    String bookname = request.getParameter("bookname");
    String authorname = request.getParameter("authorname");
    String availablestatus = request.getParameter("availablestatus");
    
    BookBean book = new BookBean(bookname, authorname, availablestatus);
    BookDao dao = new BookDao();
    
    boolean isAdded = dao.addBook(book);
    
    if (isAdded) {
        response.sendRedirect("books.jsp?message=Book added successfully");
    } else {
        response.sendRedirect("books.jsp?message=Failed to add book");
    }
%>
