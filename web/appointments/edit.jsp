<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.counseling.model.*" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null) {
        response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        return;
    }
    Appointment appt = (Appointment) request.getAttribute("appt");
    List<Counselor> counselors = (List<Counselor>) request.getAttribute("counselors");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Appointment - Student Counseling System</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/styles.css">
</head>
<body>
    <header>
        <h1>Edit Appointment</h1>
        <p>Modify appointment details</p>
    </header>
    
    <nav>
        <a href="<%= request.getContextPath() %>/appointments/details?id=<%= appt.getAppointmentId() %>">← Back to Details</a>
    </nav>
    
    <main>
        <section class="form-container">
            <h2>Edit Appointment #APT<%= appt.getAppointmentId() %></h2>
            
            <% if (request.getAttribute("error") != null) { %>
                <p style="color:#dc3545; padding:10px; background:#ffe6e6; border-radius:5px;">
                    <%= request.getAttribute("error") %>
                </p>
            <% } %>
            
            <form action="<%= request.getContextPath() %>/appointments/edit" method="post">
                <input type="hidden" name="appointment_id" value="<%= appt.getAppointmentId() %>">
                
                <div class="form-group">
                    <label for="counselor_id">Select Counselor: *</label>
                    <select id="counselor_id" name="counselor_id" required>
                        <% if (counselors != null) {
                            for (Counselor c : counselors) { %>
                        <option value="<%= c.getCounselorId() %>" <%= c.getCounselorId() == appt.getCounselorId() ? "selected" : "" %>>
                            <%= c.getFullName() %> - <%= c.getSpecialization() %>
                        </option>
                        <% }
                        } %>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="appointment_date">Appointment Date: *</label>
                    <input type="date" id="appointment_date" name="appointment_date" value="<%= appt.getAppointmentDate() %>" required>
                </div>
                
                <div class="form-group">
                    <label for="appointment_time">Appointment Time: *</label>
                    <input type="time" id="appointment_time" name="appointment_time" value="<%= appt.getAppointmentTime() %>" required>
                </div>
                
                <div class="form-group">
                    <label for="appointment_type">Appointment Type: *</label>
                    <select id="appointment_type" name="appointment_type" required>
                        <option value="academic" <%= "academic".equals(appt.getAppointmentType()) ? "selected" : "" %>>Academic Guidance</option>
                        <option value="mental_health" <%= "mental_health".equals(appt.getAppointmentType()) ? "selected" : "" %>>Mental Health Support</option>
                        <option value="career" <%= "career".equals(appt.getAppointmentType()) ? "selected" : "" %>>Career Counseling</option>
                        <option value="personal" <%= "personal".equals(appt.getAppointmentType()) ? "selected" : "" %>>Personal Issues</option>
                        <option value="other" <%= "other".equals(appt.getAppointmentType()) ? "selected" : "" %>>Other</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="status">Appointment Status: *</label>
                    <select id="status" name="status" required>
                        <option value="pending" <%= "pending".equals(appt.getStatus()) ? "selected" : "" %>>Pending</option>
                        <option value="confirmed" <%= "confirmed".equals(appt.getStatus()) ? "selected" : "" %>>Confirmed</option>
                        <option value="completed" <%= "completed".equals(appt.getStatus()) ? "selected" : "" %>>Completed</option>
                        <option value="cancelled" <%= "cancelled".equals(appt.getStatus()) ? "selected" : "" %>>Cancelled</option>
                        <option value="rescheduled" <%= "rescheduled".equals(appt.getStatus()) ? "selected" : "" %>>Rescheduled</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="reason">Reason for Appointment: *</label>
                    <textarea id="reason" name="reason" rows="5" required><%= appt.getReason() %></textarea>
                </div>
                
                <div class="form-group">
                    <label for="urgency">Urgency Level: *</label>
                    <input type="radio" id="urgency_low" name="urgency" value="low" <%= "low".equals(appt.getUrgency()) ? "checked" : "" %>>
                    <label for="urgency_low">Low</label>
                    
                    <input type="radio" id="urgency_medium" name="urgency" value="medium" <%= "medium".equals(appt.getUrgency()) ? "checked" : "" %>>
                    <label for="urgency_medium">Medium</label>
                    
                    <input type="radio" id="urgency_high" name="urgency" value="high" <%= "high".equals(appt.getUrgency()) ? "checked" : "" %>>
                    <label for="urgency_high">High</label>
                </div>
                
                <div class="form-group">
                    <label for="contact_email">Contact Email: *</label>
                    <input type="email" id="contact_email" name="contact_email" value="<%= appt.getContactEmail() %>" required>
                </div>
                
                <div class="form-group">
                    <label for="contact_phone">Contact Phone:</label>
                    <input type="tel" id="contact_phone" name="contact_phone" value="<%= appt.getContactPhone() %>">
                </div>
                
                <div class="form-group">
                    <input type="checkbox" id="first_visit" name="first_visit" <%= appt.isFirstVisit() ? "checked" : "" %>>
                    <label for="first_visit">This is my first counseling visit</label>
                </div>
                
                <div class="button-group">
                    <button type="submit" class="btn-primary">Save Changes</button>
                    <a href="<%= request.getContextPath() %>/appointments/details?id=<%= appt.getAppointmentId() %>" class="btn-cancel">Cancel</a>
                </div>
            </form>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2025 Student Counseling System</p>
    </footer>
</body>
</html>
