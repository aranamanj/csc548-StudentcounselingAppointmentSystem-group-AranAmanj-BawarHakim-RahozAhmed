<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Appointment - Student Counseling System</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>Book New Appointment</h1>
        <p>Purpose: Create a new counseling appointment request</p>
    </header>
    
    <nav>
        <a href="list.jsp">← Back to Appointments</a> | 
        <a href="../dashboard/dashboard.jsp">Dashboard</a>
    </nav>
    
    <main>
        <section class="form-container">
            <h2>Appointment Booking Form</h2>
            <form>
                <div class="form-group">
                    <label for="student_id">Student ID:</label>
                    <input type="text" id="student_id" name="student_id" required placeholder="2023001234">
                    <small>Enter your student ID number</small>
                </div>
                
                <div class="form-group">
                    <label for="student_name">Student Name:</label>
                    <input type="text" id="student_name" name="student_name" required placeholder="Full name">
                </div>
                
                <div class="form-group">
                    <label for="counselor_id">Select Counselor:</label>
                    <select id="counselor_id" name="counselor_id" required>
                        <option value="">-- Choose a counselor --</option>
                        <option value="1">Dr. Lee Wei - Academic Counselor</option>
                        <option value="2">Ms. Fatimah Hassan - Mental Health Counselor</option>
                        <option value="3">Mr. Raj Kumar - Career Counselor</option>
                        <option value="4">Dr. Emily Tan - Personal Counselor</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="appointment_date">Preferred Date:</label>
                    <input type="date" id="appointment_date" name="appointment_date" required min="2025-11-23">
                </div>
                
                <div class="form-group">
                    <label for="appointment_time">Preferred Time:</label>
                    <input type="time" id="appointment_time" name="appointment_time" required min="09:00" max="17:00">
                    <small>Office hours: 9:00 AM - 5:00 PM</small>
                </div>
                
                <div class="form-group">
                    <label for="appointment_type">Appointment Type:</label>
                    <select id="appointment_type" name="appointment_type" required>
                        <option value="">-- Select type --</option>
                        <option value="academic">Academic Guidance</option>
                        <option value="mental_health">Mental Health Support</option>
                        <option value="career">Career Counseling</option>
                        <option value="personal">Personal Issues</option>
                        <option value="other">Other</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="reason">Reason for Appointment:</label>
                    <textarea id="reason" name="reason" rows="5" required placeholder="Please briefly describe why you need counseling..."></textarea>
                </div>
                
                <div class="form-group">
                    <label for="urgency">Urgency Level:</label>
                    <input type="radio" id="urgency_low" name="urgency" value="low" checked>
                    <label for="urgency_low">Low</label>
                    
                    <input type="radio" id="urgency_medium" name="urgency" value="medium">
                    <label for="urgency_medium">Medium</label>
                    
                    <input type="radio" id="urgency_high" name="urgency" value="high">
                    <label for="urgency_high">High</label>
                </div>
                
                <div class="form-group">
                    <label for="contact_email">Contact Email:</label>
                    <input type="email" id="contact_email" name="contact_email" required placeholder="student@university.edu">
                </div>
                
                <div class="form-group">
                    <label for="contact_phone">Contact Phone:</label>
                    <input type="tel" id="contact_phone" name="contact_phone" required placeholder="+60123456789">
                </div>
                
                <div class="form-group">
                    <input type="checkbox" id="first_visit" name="first_visit">
                    <label for="first_visit">This is my first counseling visit</label>
                </div>
                
                <div class="button-group">
                    <button type="submit" class="btn-primary">Submit Appointment Request</button>
                    <button type="reset" class="btn-secondary">Clear Form</button>
                    <a href="list.jsp" class="btn-cancel">Cancel</a>
                </div>
            </form>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2025 Student Counseling System</p>
    </footer>
</body>
</html>