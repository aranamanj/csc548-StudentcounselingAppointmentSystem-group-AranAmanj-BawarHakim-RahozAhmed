<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        return;
    }
    
    String userName = (String) session.getAttribute("userName"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Session Notes - Student Counseling System</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>Session Notes</h1>
        <p>Purpose: View confidential counseling session notes and records</p>
    </header>
    
    <nav>
        <a href="<%= request.getContextPath() %>/DashboardServlet">← Back to Dashboard</a> | 
        <a href="../index.jsp">Sitemap</a>
    </nav>
    
    <main>
        <section>
            <div class="toolbar">
                <a href="create.jsp" class="btn-primary">+ Create New Session Note</a>
            </div>
            
            <h2>Session Notes Records [Placeholder]</h2>
            <p><em>Note: Session notes are confidential and only accessible to authorized counselors and administrators.</em></p>
            
            <table class="data-table">
                <thead>
                    <tr>
                        <th>Session ID</th>
                        <th>Appointment ID</th>
                        <th>Student Name</th>
                        <th>Counselor</th>
                        <th>Date</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="6">[Placeholder: Session notes will be displayed here for authorized users only]</td>
                    </tr>
                </tbody>
            </table>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2025 Student Counseling System</p>
    </footer>
</body>
</html>