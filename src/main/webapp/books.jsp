<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.library.beans.RegisterBean, com.library.beans.BookBean, com.library.dao.BookDao, java.util.List" %>
<%
    RegisterBean user = (RegisterBean) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    BookDao bookDao = new BookDao();
    List<BookBean> bookList = bookDao.getBooks();
    
    String message = request.getParameter("message");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library System - Books</title>
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
    
    <div class="container wide-container">
        <h2>Book Management</h2>
        
        <% if (message != null) { %>
            <div class="message success-message">
                <%= message %>
            </div>
        <% } %>
        
        <!-- Add Book Form -->
        <div style="background-color: #f8f9fa; padding: 20px; border-radius: 10px; margin-bottom: 30px;">
            <h3>Add New Book</h3>
            <form action="process_addbook.jsp" method="post">
                <div style="display: grid; grid-template-columns: 1fr 1fr 1fr auto; gap: 10px; align-items: end;">
                    <div class="form-group">
                        <label for="bookname">Book Name:</label>
                        <input type="text" id="bookname" name="bookname" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="authorname">Author Name:</label>
                        <input type="text" id="authorname" name="authorname" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="availablestatus">Available Status:</label>
                        <select id="availablestatus" name="availablestatus" required>
                            <option value="Yes">Yes</option>
                            <option value="No">No</option>
                        </select>
                    </div>
                    
                    <button type="submit" class="btn btn-small btn-success">Add Book</button>
                </div>
            </form>
        </div>
        
        <!-- Books Table -->
        <table>
            <thead>
                <tr>
                    <th>Book ID</th>
                    <th>Book Name</th>
                    <th>Author Name</th>
                    <th>Available Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% if (bookList != null && !bookList.isEmpty()) {
                    for (BookBean book : bookList) { %>
                        <tr>
                            <td><%= book.getBookid() %></td>
                            <td><%= book.getBookname() %></td>
                            <td><%= book.getAuthorname() %></td>
                            <td><%= book.getAvailablestatus() %></td>
                            <td>
                                <form action="process_updatebook.jsp" method="post" style="display: inline;">
                                    <input type="hidden" name="bookid" value="<%= book.getBookid() %>">
                                    <input type="text" name="bookname" value="<%= book.getBookname() %>" required style="width: 150px;">
                                    <input type="text" name="authorname" value="<%= book.getAuthorname() %>" required style="width: 120px;">
                                    <select name="availablestatus" required style="width: 80px;">
                                        <option value="Yes" <%= book.getAvailablestatus().equals("Yes") ? "selected" : "" %>>Yes</option>
                                        <option value="No" <%= book.getAvailablestatus().equals("No") ? "selected" : "" %>>No</option>
                                    </select>
                                    <button type="submit" class="btn btn-small btn-warning">Update</button>
                                </form>
                                
                                <form action="process_deletebook.jsp" method="post" style="display: inline;" 
                                      onsubmit="return confirm('Are you sure you want to delete this book?');">
                                    <input type="hidden" name="bookid" value="<%= book.getBookid() %>">
                                    <button type="submit" class="btn btn-small btn-danger">Delete</button>
                                </form>
                            </td>
                        </tr>
                <% } 
                } else { %>
                    <tr>
                        <td colspan="5" style="text-align: center;">No books available</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
