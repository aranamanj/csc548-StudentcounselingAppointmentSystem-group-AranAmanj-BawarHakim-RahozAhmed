<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Appointment Details - Student Counseling System</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>Appointment Details</h1>
        <p>Purpose: View detailed information about a specific appointment</p>
    </header>
    
    <nav>
        <a href="list.jsp">← Back to Appointments</a> | 
        <a href="../dashboard/dashboard.jsp">Dashboard</a>
    </nav>
    
    <main>
        <section class="detail-container">
            <h2>Appointment #APT001 [Placeholder]</h2>
            
            <div class="detail-grid">
                <div class="detail-section">
                    <h3>Student Information</h3>
                    <p><strong>Name:</strong> Sarah Ahmad</p>
                    <p><strong>Student ID:</strong> 2023001234</p>
                    <p><strong>Email:</strong> sarah.ahmad@university.edu</p>
                    <p><strong>Phone:</strong> +60123456789</p>
                </div>
                
                <div class="detail-section">
                    <h3>Counselor Information</h3>
                    <p><strong>Name:</strong> Dr. Lee Wei</p>
                    <p><strong>Specialization:</strong> Academic Counseling</p>
                    <p><strong>Office:</strong> Building A, Room 301</p>
                    <p><strong>Email:</strong> lee.wei@university.edu</p>
                </div>
                
                <div class="detail-section">
                    <h3>Appointment Details</h3>
                    <p><strong>Date:</strong> November 25, 2025</p>
                    <p><strong>Time:</strong> 10:00 AM - 11:00 AM</p>
                    <p><strong>Type:</strong> Academic Guidance</p>
                    <p><strong>Status:</strong> <span class="badge-pending">Pending Confirmation</span></p>
                    <p><strong>Urgency:</strong> Medium</p>
                </div>
                
                <div class="detail-section">
                    <h3>Reason for Visit</h3>
                    <p>[Placeholder: Student's reason for appointment will be displayed here]</p>
                    <p>Need guidance on course selection for next semester and academic planning.</p>
                </div>
                
                <div class="detail-section">
                    <h3>Session Notes</h3>
                    <p>[Placeholder: Counselor's session notes (visible only to counselor/admin)]</p>
                    <p><em>No notes yet - session not completed</em></p>
                </div>
                
                <div class="detail-section">
                    <h3>History</h3>
                    <p><strong>Created:</strong> November 20, 2025 at 2:30 PM</p>
                    <p><strong>Last Updated:</strong> November 20, 2025 at 2:30 PM</p>
                    <p><strong>Created By:</strong> Sarah Ahmad (Student)</p>
                </div>
            </div>
            
            <div class="action-buttons">
                <a href="edit.jsp" class="btn-primary">Edit Appointment</a>
                <button class="btn-success">Confirm Appointment</button>
                <button class="btn-warning">Reschedule</button>
                <button class="btn-danger">Cancel Appointment</button>
                <a href="../sessions/create.jsp" class="btn-secondary">Add Session Notes</a>
            </div>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2025 Student Counseling System</p>
    </footer>
</body>
</html>