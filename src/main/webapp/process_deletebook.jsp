<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.library.dao.BookDao" %>
<%
    int bookid = Integer.parseInt(request.getParameter("bookid"));
    
    BookDao dao = new BookDao();
    boolean isDeleted = dao.deleteBook(bookid);
    
    if (isDeleted) {
        response.sendRedirect("books.jsp?message=Book deleted successfully");
    } else {
        response.sendRedirect("books.jsp?message=Failed to delete book");
    }
%>
