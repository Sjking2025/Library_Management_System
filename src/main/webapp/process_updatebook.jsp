<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.library.dao.BookDao, com.library.beans.BookBean" %>
<%
    int bookid = Integer.parseInt(request.getParameter("bookid"));
    String bookname = request.getParameter("bookname");
    String authorname = request.getParameter("authorname");
    String availablestatus = request.getParameter("availablestatus");
    
    BookBean book = new BookBean(bookname, authorname, availablestatus);
    book.setBookid(bookid);
    
    BookDao dao = new BookDao();
    boolean isUpdated = dao.updateBook(book);
    
    if (isUpdated) {
        response.sendRedirect("books.jsp?message=Book updated successfully");
    } else {
        response.sendRedirect("books.jsp?message=Failed to update book");
    }
%>
