<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library System - Registration</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h2>Library System Registration Page</h2>
        
        <%
            String error = request.getParameter("error");
            String success = request.getParameter("success");
            
            if (error != null && error.equals("failed")) {
        %>
            <div class="message error-message">
                Registration got failed. Please try again
            </div>
        <% } %>
        
        <% if (success != null && success.equals("true")) { %>
            <div class="message success-message">
                Registration Done Successfully
            </div>
        <% } %>
        
        <form action="process_register.jsp" method="post">
            <div class="form-group">
                <label for="username">UserName:</label>
                <input type="text" id="username" name="username" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label for="phoneno">PhoneNo:</label>
                <input type="text" id="phoneno" name="phoneno" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            
            <button type="submit" class="btn">Register</button>
        </form>
        
        <div class="link-text">
            Already have an account? <a href="login.jsp">Login</a>
        </div>
    </div>
</body>
</html>
