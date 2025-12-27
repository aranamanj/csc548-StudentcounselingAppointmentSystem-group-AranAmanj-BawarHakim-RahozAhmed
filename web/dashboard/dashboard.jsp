<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.counseling.model.*" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null) {
        response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Student Counseling System</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/styles.css">
</head>
<body>
    <header>
        <h1>Dashboard</h1>
        <p>Welcome, <%= currentUser.getFullName() %> (<%= currentUser.getRole() %>)</p>
    </header>
    
    <nav>
        <a href="<%= request.getContextPath() %>/index.jsp">← Home</a> | 
        <a href="<%= request.getContextPath() %>/appointments/list">Appointments</a> | 
        <a href="<%= request.getContextPath() %>/LogoutServlet">Logout</a>
    </nav>
    
    <main>
        <section class="kpi-section">
            <h2>Key Performance Indicators</h2>
            <div class="kpi-container">
                <div class="kpi-box">
                    <h3>Total Appointments</h3>
                    <p class="kpi-value"><%= request.getAttribute("kpiAppointments") %></p>
                </div>
                
                <div class="kpi-box">
                    <h3>Active Students</h3>
                    <p class="kpi-value"><%= request.getAttribute("kpiStudents") %></p>
                </div>
                
                <div class="kpi-box">
                    <h3>Available Counselors</h3>
                    <p class="kpi-value"><%= request.getAttribute("kpiCounselors") %></p>
                </div>
                
                <div class="kpi-box">
                    <h3>Pending Appointments</h3>
                    <p class="kpi-value"><%= request.getAttribute("kpiPending") %></p>
                </div>
            </div>
        </section>
        
        <section class="quick-links">
            <h2>Quick Actions</h2>
            <ul>
                <% if ("student".equals(currentUser.getRole()) || "admin".equals(currentUser.getRole())) { %>
                    <li><a href="<%= request.getContextPath() %>/appointments/create" class="btn-primary">Book New Appointment</a></li>
                <% } %>
                <li><a href="<%= request.getContextPath() %>/appointments/list" class="btn-secondary">View All Appointments</a></li>
            </ul>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2025 Student Counseling System</p>
    </footer>
</body>
</html>
