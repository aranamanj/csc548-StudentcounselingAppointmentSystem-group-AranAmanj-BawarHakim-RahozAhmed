<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Student Counseling System</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>Dashboard</h1>
        <p>Purpose: Overview of counseling system statistics and quick access to key functions</p>
    </header>
    
    <nav>
        <a href="../index.jsp">← Sitemap</a> | 
        <a href="../appointments/list.jsp">Appointments</a> | 
        <a href="../counselors/list.jsp">Counselors</a> | 
        <a href="../students/list.jsp">Students</a> | 
        <a href="../sessions/list.jsp">Sessions</a> | 
        <a href="../auth/login.jsp">Logout</a>
    </nav>
    
    <main>
        <section class="kpi-section">
            <h2>Key Performance Indicators</h2>
            <div class="kpi-container">
                <div class="kpi-box">
                    <h3>Total Appointments</h3>
                    <p class="kpi-value">128</p>
                    <p class="kpi-label">[Placeholder: Dynamic count from database]</p>
                </div>
                
                <div class="kpi-box">
                    <h3>Active Students</h3>
                    <p class="kpi-value">342</p>
                    <p class="kpi-label">[Placeholder: Registered students count]</p>
                </div>
                
                <div class="kpi-box">
                    <h3>Available Counselors</h3>
                    <p class="kpi-value">12</p>
                    <p class="kpi-label">[Placeholder: Active counselors count]</p>
                </div>
                
                <div class="kpi-box">
                    <h3>Pending Appointments</h3>
                    <p class="kpi-value">15</p>
                    <p class="kpi-label">[Placeholder: Appointments awaiting confirmation]</p>
                </div>
            </div>
        </section>
        
        <section class="charts-section">
            <h2>Analytics</h2>
            <div class="chart-container">
                <div class="chart-placeholder">
                    <h3>Monthly Appointments (Bar Chart)</h3>
                    <p>[Placeholder: Chart showing appointment trends over 12 months]</p>
                </div>
                
                <div class="chart-placeholder">
                    <h3>Appointments by Type (Pie Chart)</h3>
                    <p>[Placeholder: Academic, Mental Health, Career, Personal categories]</p>
                </div>
                
                <div class="chart-placeholder">
                    <h3>Counselor Workload (Line Chart)</h3>
                    <p>[Placeholder: Sessions per counselor over time]</p>
                </div>
            </div>
        </section>
        
        <section class="quick-links">
            <h2>Quick Actions</h2>
            <ul>
                <li><a href="../appointments/create.jsp" class="btn-primary">Book New Appointment</a></li>
                <li><a href="../appointments/list.jsp" class="btn-secondary">View All Appointments</a></li>
                <li><a href="../counselors/list.jsp" class="btn-secondary">Manage Counselors</a></li>
                <li><a href="../sessions/create.jsp" class="btn-secondary">Create Session Note</a></li>
            </ul>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2025 Student Counseling System</p>
    </footer>
</body>
</html>