<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.library.dao.RegisterDao, com.library.beans.RegisterBean" %>
<%
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String phoneno = request.getParameter("phoneno");
    String password = request.getParameter("password");
    
    RegisterBean user = new RegisterBean(username, email, phoneno, password);
    RegisterDao dao = new RegisterDao();
    
    boolean isCreated = dao.createUser(user);
    
    if (isCreated) {
        response.sendRedirect("register.jsp?success=true");
    } else {
        response.sendRedirect("register.jsp?error=failed");
    }
%>
