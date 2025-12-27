<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.counseling.model.*" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null) {
        response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        return;
    }
    List<Appointment> appointments = (List<Appointment>) request.getAttribute("appointments");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Appointments - Student Counseling System</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/styles.css">
</head>
<body>
    <header>
        <h1>All Appointments</h1>
        <p>View and manage counseling appointments</p>
    </header>
    
    <nav>
        <a href="<%= request.getContextPath() %>/DashboardServlet">← Back to Dashboard</a>
        <a href="<%= request.getContextPath() %>/LogoutServlet">Logout</a>
    </nav>
    
    <main>
        <section>
            <div class="toolbar">
                <% if ("student".equals(currentUser.getRole()) || "admin".equals(currentUser.getRole())) { %>
                    <a href="<%= request.getContextPath() %>/appointments/create" class="btn-primary">+ Book New Appointment</a>
                <% } %>
            </div>
            
            <h2>Appointments Table</h2>
            <table class="data-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Student</th>
                        <th>Counselor</th>
                        <th>Date & Time</th>
                        <th>Type</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (appointments != null && !appointments.isEmpty()) {
                        for (Appointment appt : appointments) { %>
                    <tr>
                        <td>APT<%= appt.getAppointmentId() %></td>
                        <td><%= appt.getStudentName() %></td>
                        <td><%= appt.getCounselorName() %></td>
                        <td><%= appt.getAppointmentDate() %> <%= appt.getAppointmentTime() %></td>
                        <td><%= appt.getAppointmentType() %></td>
                        <td><span class="badge-<%= appt.getStatus() %>"><%= appt.getStatus() %></span></td>
                        <td>
                            <a href="<%= request.getContextPath() %>/appointments/details?id=<%= appt.getAppointmentId() %>">View</a>
                            <% if ("counselor".equals(currentUser.getRole()) || "admin".equals(currentUser.getRole())) { %>
                                | <a href="<%= request.getContextPath() %>/appointments/edit?id=<%= appt.getAppointmentId() %>">Edit</a>
                            <% } %>
                            <% if ("admin".equals(currentUser.getRole())) { %>
                                <form action="<%= request.getContextPath() %>/appointments/delete" method="post" style="display:inline;" onsubmit="return confirm('Delete this appointment?');">
                                    <input type="hidden" name="id" value="<%= appt.getAppointmentId() %>">
                                    <button type="submit" class="btn-danger" style="padding:4px 8px; font-size:0.9em;">Delete</button>
                                </form>
                            <% } %>
                        </td>
                    </tr>
                    <% }
                    } else { %>
                    <tr>
                        <td colspan="7" style="text-align:center;">No appointments found.</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2025 Student Counseling System</p>
    </footer>
</body>
</html>
