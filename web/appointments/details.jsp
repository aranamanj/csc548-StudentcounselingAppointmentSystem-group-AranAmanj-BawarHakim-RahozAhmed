<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.counseling.model.*" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null) {
        response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        return;
    }
    Appointment appt = (Appointment) request.getAttribute("appt");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Appointment Details - Student Counseling System</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/styles.css">
</head>
<body>
    <header>
        <h1>Appointment Details</h1>
        <p>View detailed information about this appointment</p>
    </header>
    
    <nav>
        <a href="<%= request.getContextPath() %>/appointments/list">← Back to Appointments</a>
    </nav>
    
    <main>
        <section class="detail-container">
            <h2>Appointment #APT<%= appt.getAppointmentId() %></h2>
            
            <div class="detail-grid">
                <div class="detail-section">
                    <h3>Student Information</h3>
                    <p><strong>Name:</strong> <%= appt.getStudentName() %></p>
                    <p><strong>Email:</strong> <%= appt.getContactEmail() %></p>
                    <p><strong>Phone:</strong> <%= appt.getContactPhone() %></p>
                </div>
                
                <div class="detail-section">
                    <h3>Counselor Information</h3>
                    <p><strong>Name:</strong> <%= appt.getCounselorName() %></p>
                    <p><strong>Specialization:</strong> <%= appt.getCounselorSpecialization() %></p>
                </div>
                
                <div class="detail-section">
                    <h3>Appointment Details</h3>
                    <p><strong>Date:</strong> <%= appt.getAppointmentDate() %></p>
                    <p><strong>Time:</strong> <%= appt.getAppointmentTime() %></p>
                    <p><strong>Type:</strong> <%= appt.getAppointmentType() %></p>
                    <p><strong>Status:</strong> <span class="badge-<%= appt.getStatus() %>"><%= appt.getStatus() %></span></p>
                    <p><strong>Urgency:</strong> <%= appt.getUrgency() %></p>
                    <p><strong>First Visit:</strong> <%= appt.isFirstVisit() ? "Yes" : "No" %></p>
                </div>
                
                <div class="detail-section">
                    <h3>Reason for Visit</h3>
                    <p><%= appt.getReason() %></p>
                </div>
            </div>
            
            <div class="action-buttons">
                <% if ("counselor".equals(currentUser.getRole()) || "admin".equals(currentUser.getRole())) { %>
                    <a href="<%= request.getContextPath() %>/appointments/edit?id=<%= appt.getAppointmentId() %>" class="btn-primary">Edit Appointment</a>
                <% } %>
                <% if ("admin".equals(currentUser.getRole())) { %>
                    <form action="<%= request.getContextPath() %>/appointments/delete" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this appointment?');">
                        <input type="hidden" name="id" value="<%= appt.getAppointmentId() %>">
                        <button type="submit" class="btn-danger">Delete Appointment</button>
                    </form>
                <% } %>
            </div>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2025 Student Counseling System</p>
    </footer>
</body>
</html>
