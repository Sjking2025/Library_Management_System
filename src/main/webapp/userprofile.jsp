<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.library.beans.RegisterBean" %>
<%
    RegisterBean user = (RegisterBean) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    String message = request.getParameter("message");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library System - User Profile</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="header">
        <div class="logo">
            <img src="images/library-logo.png" alt="Library Logo" onerror="this.style.display='none'">
            <h1>Library System</h1>
        </div>
        <nav class="nav">
            <a href="home.jsp">Home</a>
            <a href="books.jsp">Library System</a>
            <a href="userprofile.jsp">User Profile</a>
            <a href="logout.jsp">Logout</a>
        </nav>
    </div>
    
    <div class="container">
        <h2>Update Profile</h2>
        
        <% if (message != null && message.equals("success")) { %>
            <div class="message success-message">
                Profile updated Successfully
            </div>
        <% } %>
        
        <form action="process_updateprofile.jsp" method="post">
            <div class="form-group">
                <label for="username">UserName:</label>
                <input type="text" id="username" name="username" value="<%= user.getUsername() %>" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="<%= user.getEmail() %>" required>
            </div>
            
            <div class="form-group">
                <label for="phoneno">PhoneNo:</label>
                <input type="text" id="phoneno" name="phoneno" value="<%= user.getPhoneno() %>" required>
            </div>
            
            <button type="submit" class="btn">Update Profile</button>
        </form>
    </div>
</body>
</html>
