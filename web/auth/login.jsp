<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Student Counseling System</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/styles.css">
</head>
<body>
    <header>
        <h1>Login</h1>
        <p>User authentication for students, counselors, and administrators</p>
    </header>
    
    <nav>
        <a href="<%= request.getContextPath() %>/index.jsp">← Back to Home</a>
    </nav>
    
    <main>
        <section class="form-container">
            <h2>Login Form</h2>
            
            <% if (request.getAttribute("error") != null) { %>
                <p style="color:#dc3545; padding:10px; background:#ffe6e6; border-radius:5px;">
                    <%= request.getAttribute("error") %>
                </p>
            <% } %>
            
            <% if (request.getAttribute("success") != null) { %>
                <p style="color:#28a745; padding:10px; background:#e6ffe6; border-radius:5px;">
                    <%= request.getAttribute("success") %>
                </p>
            <% } %>
            
            <form action="<%= request.getContextPath() %>/LoginServlet" method="post">
                <div class="form-group">
                    <label for="email">Email Address:</label>
                    <input type="email" id="email" name="email" required placeholder="student@university.edu">
                </div>
                
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required minlength="8">
                </div>
                
                <button type="submit" class="btn-primary">Login</button>
            </form>
            
            <p>Don't have an account? <a href="<%= request.getContextPath() %>/RegisterServlet">Register here</a></p>
            
            <div style="margin-top:20px; padding:15px; background:#f0f0f0; border-radius:5px;">
                <strong>Test Accounts:</strong><br>
                Student: sarah.ahmad@university.edu / password123<br>
                Counselor: lee.wei@university.edu / password123<br>
                Admin: admin@university.edu / password123
            </div>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2025 Student Counseling System</p>
    </footer>
</body>
</html>
