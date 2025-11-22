<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Counselor - Student Counseling System</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>Add New Counselor</h1>
        <p>Purpose: Register a new counselor to the system</p>
    </header>
    
    <nav>
        <a href="list.jsp">← Back to Counselors</a> | 
        <a href="../dashboard/dashboard.jsp">Dashboard</a>
    </nav>
    
    <main>
        <section class="form-container">
            <h2>Counselor Registration Form</h2>
            <form>
                <div class="form-group">
                    <label for="counselor_id">Counselor/Staff ID:</label>
                    <input type="text" id="counselor_id" name="counselor_id" required placeholder="C00123">
                </div>
                
                <div class="form-group">
                    <label for="full_name">Full Name:</label>
                    <input type="text" id="full_name" name="full_name" required placeholder="Dr. John Smith">
                </div>
                
                <div class="form-group">
                    <label for="specialization">Specialization:</label>
                    <select id="specialization" name="specialization" required multiple size="4">
                        <option value="academic">Academic Counseling</option>
                        <option value="mental_health">Mental Health Support</option>
                        <option value="career">Career Guidance</option>
                        <option value="personal">Personal Development</option>
                    </select>
                    <small>Hold Ctrl/Cmd to select multiple specializations</small>
                </div>
                
                <div class="form-group">
                    <label for="qualification">Qualification:</label>
                    <input type="text" id="qualification" name="qualification" required placeholder="Ph.D. in Clinical Psychology">
                </div>
                
                <div class="form-group">
                    <label for="years_experience">Years of Experience:</label>
                    <input type="number" id="years_experience" name="years_experience" min="0" max="50" required>
                </div>
                
                <div class="form-group">
                    <label for="email">Email Address:</label>
                    <input type="email" id="email" name="email" required placeholder="counselor@university.edu">
                </div>
                
                <div class="form-group">
                    <label for="phone">Phone Number:</label>
                    <input type="tel" id="phone" name="phone" required placeholder="+60123456789">
                </div>
                
                <div class="form-group">
                    <label for="office_location">Office Location:</label>
                    <input type="text" id="office_location" name="office_location" required placeholder="Building A, Room 301">
                </div>
                
                <div class="form-group">
                    <label for="availability">Available Days:</label>
                    <input type="checkbox" id="monday" name="availability" value="monday">
                    <label for="monday">Monday</label>
                    
                    <input type="checkbox" id="tuesday" name="availability" value="tuesday">
                    <label for="tuesday">Tuesday</label>
                    
                    <input type="checkbox" id="wednesday" name="availability" value="wednesday">
                    <label for="wednesday">Wednesday</label>
                    
                    <input type="checkbox" id="thursday" name="availability" value="thursday">
                    <label for="thursday">Thursday</label>
                    
                    <input type="checkbox" id="friday" name="availability" value="friday">
                    <label for="friday">Friday</label>
                </div>
                
                <div class="form-group">
                    <label for="office_hours_start">Office Hours Start:</label>
                    <input type="time" id="office_hours_start" name="office_hours_start" value="09:00" required>
                </div>
                
                <div class="form-group">
                    <label for="office_hours_end">Office Hours End:</label>
                    <input type="time" id="office_hours_end" name="office_hours_end" value="17:00" required>
                </div>
                
                <div class="form-group">
                    <label for="max_appointments">Max Appointments per Day:</label>
                    <input type="number" id="max_appointments" name="max_appointments" min="1" max="20" value="8" required>
                </div>
                
                <div class="form-group">
                    <label for="bio">Biography:</label>
                    <textarea id="bio" name="bio" rows="5" placeholder="Brief professional background and expertise..."></textarea>
                </div>
                
                <div class="form-group">
                    <label for="status">Status:</label>
                    <input type="radio" id="status_active" name="status" value="active" checked>
                    <label for="status_active">Active</label>
                    
                    <input type="radio" id="status_leave" name="status" value="leave">
                    <label for="status_leave">On Leave</label>
                    
                    <input type="radio" id="status_inactive" name="status" value="inactive">
                    <label for="status_inactive">Inactive</label>
                </div>
                
                <div class="button-group">
                    <button type="submit" class="btn-primary">Add Counselor</button>
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