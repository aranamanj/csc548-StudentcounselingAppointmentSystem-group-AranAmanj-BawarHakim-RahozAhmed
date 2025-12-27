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
    <title>Counselor Profile - Student Counseling System</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>Counselor Profile</h1>
        <p>Purpose: View detailed counselor information and appointment history</p>
    </header>
    
    <nav>
        <a href="list.jsp">← Back to Counselors</a> | 
        <a href="../dashboard/dashboard.jsp">Dashboard</a>
    </nav>
    
    <main>
        <section class="detail-container">
            <h2>Dr. Lee Wei [Placeholder]</h2>
            
            <div class="detail-grid">
                <div class="detail-section">
                    <h3>Personal Information</h3>
                    <p><strong>Counselor ID:</strong> C001</p>
                    <p><strong>Name:</strong> Dr. Lee Wei</p>
                    <p><strong>Email:</strong> lee.wei@university.edu</p>
                    <p><strong>Phone:</strong> +60123456789</p>
                    <p><strong>Office:</strong> Building A, Room 301</p>
                </div>
                
                <div class="detail-section">
                    <h3>Professional Details</h3>
                    <p><strong>Specialization:</strong> Academic Counseling</p>
                    <p><strong>Qualification:</strong> Ph.D. in Educational Psychology</p>
                    <p><strong>Experience:</strong> 10 years</p>
                    <p><strong>Status:</strong> <span class="badge-success">Active</span></p>
                </div>
                
                <div class="detail-section">
                    <h3>Availability Schedule</h3>
                    <p><strong>Available Days:</strong> Monday - Friday</p>
                    <p><strong>Office Hours:</strong> 9:00 AM - 5:00 PM</p>
                    <p><strong>Max Appointments/Day:</strong> 8</p>
                </div>
                
                <div class="detail-section">
                    <h3>Biography</h3>
                    <p>[Placeholder: Counselor's professional background and expertise]</p>
                </div>
                
                <div class="detail-section">
                    <h3>Statistics</h3>
                    <p><strong>Total Appointments:</strong> 145</p>
                    <p><strong>Completed Sessions:</strong> 132</p>
                    <p><strong>Pending Appointments:</strong> 5</p>
                    <p><strong>Average Rating:</strong> 4.8/5.0</p>
                </div>
            </div>
            
            <div class="action-buttons">
                <a href="edit.jsp" class="btn-primary">Edit Profile</a>
                <a href="../appointments/create.jsp" class="btn-success">Book Appointment</a>
                <button class="btn-secondary">View Schedule</button>
            </div>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2025 Student Counseling System</p>
    </footer>
</body>
</html>