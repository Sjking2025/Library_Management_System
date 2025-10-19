<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.library.dao.RegisterDao, com.library.beans.RegisterBean" %>
<%
    RegisterBean user = (RegisterBean) session.getAttribute("user");
    
    if (user != null) {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phoneno = request.getParameter("phoneno");
        
        user.setUsername(username);
        user.setEmail(email);
        user.setPhoneno(phoneno);
        
        RegisterDao dao = new RegisterDao();
        boolean isUpdated = dao.updateUser(user);
        
        if (isUpdated) {
            session.setAttribute("user", user);
            response.sendRedirect("userprofile.jsp?message=success");
        } else {
            response.sendRedirect("userprofile.jsp?message=failed");
        }
    } else {
        response.sendRedirect("login.jsp");
    }
%>
