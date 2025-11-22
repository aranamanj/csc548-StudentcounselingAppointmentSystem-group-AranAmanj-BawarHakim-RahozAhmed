<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Appointment - Student Counseling System</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>Edit Appointment</h1>
        <p>Purpose: Modify an existing appointment's details</p>
    </header>
    
    <nav>
        <a href="details.jsp">← Back to Details</a> | 
        <a href="list.jsp">All Appointments</a> | 
        <a href="../dashboard/dashboard.jsp">Dashboard</a>
    </nav>
    
    <main>
        <section class="form-container">
            <h2>Edit Appointment #APT001 [Placeholder]</h2>
            <form>
                <div class="form-group">
                    <label for="student_id">Student ID:</label>
                    <input type="text" id="student_id" name="student_id" value="2023001234" readonly>
                </div>
                
                <div class="form-group">
                    <label for="student_name">Student Name:</label>
                    <input type="text" id="student_name" name="student_name" value="Sarah Ahmad" readonly>
                </div>
                
                <div class="form-group">
                    <label for="counselor_id">Select Counselor:</label>
                    <select id="counselor_id" name="counselor_id" required>
                        <option value="1" selected>Dr. Lee Wei - Academic Counselor</option>
                        <option value="2">Ms. Fatimah Hassan - Mental Health Counselor</option>
                        <option value="3">Mr. Raj Kumar - Career Counselor</option>
                        <option value="4">Dr. Emily Tan - Personal Counselor</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="appointment_date">Appointment Date:</label>
                    <input type="date" id="appointment_date" name="appointment_date" value="2025-11-25" required>
                </div>
                
                <div class="form-group">
                    <label for="appointment_time">Appointment Time:</label>
                    <input type="time" id="appointment_time" name="appointment_time" value="10:00" required>
                </div>
                
                <div class="form-group">
                    <label for="appointment_type">Appointment Type:</label>
                    <select id="appointment_type" name="appointment_type" required>
                        <option value="academic" selected>Academic Guidance</option>
                        <option value="mental_health">Mental Health Support</option>
                        <option value="career">Career Counseling</option>
                        <option value="personal">Personal Issues</option>
                        <option value="other">Other</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="status">Appointment Status:</label>
                    <select id="status" name="status" required>
                        <option value="pending" selected>Pending</option>
                        <option value="confirmed">Confirmed</option>
                        <option value="completed">Completed</option>
                        <option value="cancelled">Cancelled</option>
                        <option value="rescheduled">Rescheduled</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="reason">Reason for Appointment:</label>
                    <textarea id="reason" name="reason" rows="5" required>Need guidance on course selection for next semester and academic planning.</textarea>
                </div>
                
                <div class="form-group">
                    <label for="urgency">Urgency Level:</label>
                    <input type="radio" id="urgency_low" name="urgency" value="low">
                    <label for="urgency_low">Low</label>
                    
                    <input type="radio" id="urgency_medium" name="urgency" value="medium" checked>
                    <label for="urgency_medium">Medium</label>
                    
                    <input type="radio" id="urgency_high" name="urgency" value="high">
                    <label for="urgency_high">High</label>
                </div>
                
                <div class="form-group">
                    <label for="contact_email">Contact Email:</label>
                    <input type="email" id="contact_email" name="contact_email" value="sarah.ahmad@university.edu" required>
                </div>
                
                <div class="form-group">
                    <label for="contact_phone">Contact Phone:</label>
                    <input type="tel" id="contact_phone" name="contact_phone" value="+60123456789" required>
                </div>
                
                <div class="button-group">
                    <button type="submit" class="btn-primary">Save Changes</button>
                    <a href="details.jsp" class="btn-cancel">Cancel</a>
                </div>
            </form>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2025 Student Counseling System</p>
    </footer>
</body>
</html>