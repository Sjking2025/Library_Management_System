<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.library.dao.RegisterDao, com.library.beans.RegisterBean" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    RegisterDao dao = new RegisterDao();
    RegisterBean user = dao.validateUser(username, password);
    
    if (user != null) {
        // Login successful - create session
        session.setAttribute("user", user);
        session.setMaxInactiveInterval(30 * 60); // 30 minutes
        response.sendRedirect("home.jsp");
    } else {
        // Login failed
        response.sendRedirect("login.jsp?error=invalid");
    }
%>
