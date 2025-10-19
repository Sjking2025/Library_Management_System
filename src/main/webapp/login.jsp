<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library System - Login</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h2>Library System Login Page</h2>
        
        <%
            String error = request.getParameter("error");
            if (error != null && error.equals("invalid")) {
        %>
            <div class="message error-message">
                Login got failed. Please try again
            </div>
        <% } %>
        
        <form action="process_login.jsp" method="post">
            <div class="form-group">
                <label for="username">UserName:</label>
                <input type="text" id="username" name="username" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            
            <button type="submit" class="btn">Login</button>
        </form>
        
        <div class="link-text">
            Don't have an account? <a href="register.jsp">Signup / Registration</a>
        </div>
    </div>
</body>
</html>
