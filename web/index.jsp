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
    <title>Student Counseling Appointment System - Sitemap</title>
    <link rel="stylesheet" href="assets/styles.css">
</head>
<body>
    <header>
        <h1>Student Counseling Appointment System</h1>
        <p>Storyboard & Navigation Map</p>
    </header>
    
    <main>
        <section>
            <h2>Project Overview</h2>
            <p>Purpose: A web application for managing student counseling appointments, counselor schedules, and session records.</p>
        </section>
        
        <section>
            <h2>Sitemap - All Pages</h2>
            
            <h3>Authentication Module</h3>
            <ul>
                <li><a href="auth/login.jsp">Login Page</a></li>
                <li><a href="auth/register.jsp">Register Page</a></li>
            </ul>
            
            <h3>Dashboard Module</h3>
            <ul>
                <a href="<%=request.getContextPath()%>/DashboardServlet">Main Dashboard</a>
            </ul>
            
            <h3>Appointments Module (CRUD)</h3>
            <ul>
                <li><a href="appointments/list.jsp">List All Appointments</a></li>
                <li><a href="appointments/create.jsp">Book New Appointment</a></li>
                <li><a href="appointments/details.jsp">Appointment Details</a></li>
                <li><a href="appointments/edit.jsp">Edit Appointment</a></li>
            </ul>
            
            <h3>Counselors Module</h3>
            <ul>
                <li><a href="counselors/list.jsp">List All Counselors</a></li>
                <li><a href="counselors/create.jsp">Add New Counselor</a></li>
                <li><a href="counselors/details.jsp">Counselor Profile</a></li>
                <li><a href="counselors/edit.jsp">Edit Counselor</a></li>
            </ul>
            
            <h3>Students Module</h3>
            <ul>
                <li><a href="students/list.jsp">List All Students</a></li>
                <li><a href="students/create.jsp">Add New Student</a></li>
            </ul>
            
            <h3>Session Notes Module</h3>
            <ul>
                <li><a href="sessions/list.jsp">View Session Notes</a></li>
                <li><a href="sessions/create.jsp">Create Session Note</a></li>
            </ul>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2025 Student Counseling Appointment System</p>
    </footer>
</body>
</html>