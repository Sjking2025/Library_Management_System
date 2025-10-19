# Library Management System

A comprehensive web-based application for managing a library's book collection and user base. This system provides a user-friendly interface for librarian (ADMIN) to interact with the library's resources.

## ✨ Features

*   **User Authentication:** Secure user registration and login functionality.
*   **Book Management:**
    *   Add new books to the collection.
    *   Update existing book details.
    *   Delete books from the collection.
    *   View a list of all available books.
*   **Admin Profile Management:** Admin can view and update their profile information.
*   **Responsive Design:** A clean and responsive user interface built with HTML and CSS.

## 🛠️ Technologies Used

*   **Backend:**
    *   Java
    *   Java Server Pages (JSP)
    *   Java Servlets
*   **Database:**
    *   PostgreSQL
*   **Frontend:**
    *   HTML
    *   CSS

## 🚀 Setup and Installation

To run this project locally, you will need to have the following installed:

*   Java Development Kit (JDK) 8 or higher
*   Apache Tomcat Server 9 or higher
*   PostgreSQL Database

**1. Clone the repository:**

```bash
git clone https://github.com/Sjking2025/Library_Management_System.git
```

**2. Database Setup:**

*   Create a new database in PostgreSQL.
*   Execute the following SQL scripts to create the necessary tables:

```sql
CREATE TABLE libraryuser (
    userid SERIAL PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phoneno VARCHAR(15),
    password VARCHAR(255) NOT NULL
);

CREATE TABLE books (
    bookid SERIAL PRIMARY KEY,
    bookname VARCHAR(255) NOT NULL,
    authorname VARCHAR(255) NOT NULL,
    availablestatus VARCHAR(20) NOT NULL
);
```

**3. Configure Database Connection:**

*   Open the `DatabaseConnection.java` file in `src/main/java/com/library/dao/` to configure your database credentials.

**4. Deploy the application:**

*   Deploy the project to your Apache Tomcat server.
*   Access the application in your web browser at `http://localhost:8080/LibraryManagementSystem/`.

## 🤝 How to Contribute

Contributions are welcome! If you would like to contribute to this project, please follow these steps:

1.  Fork the repository.
2.  Create a new branch (`git checkout -b feature/your-feature-name`).
3.  Make your changes.
4.  Commit your changes (`git commit -m 'Add some feature'`).
5.  Push to the branch (`git push origin feature/your-feature-name`).
6.  Open a pull request.

Please make sure to update tests as appropriate.

