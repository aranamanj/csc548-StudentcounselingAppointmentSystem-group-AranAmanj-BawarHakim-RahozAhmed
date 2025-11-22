<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Counselor - Student Counseling System</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>Edit Counselor Profile</h1>
        <p>Purpose: Update counselor information and settings</p>
    </header>
    
    <nav>
        <a href="details.jsp">← Back to Profile</a> | 
        <a href="list.jsp">All Counselors</a>
    </nav>
    
    <main>
        <section class="form-container">
            <h2>Edit Dr. Lee Wei's Profile [Placeholder]</h2>
            <form>
                <div class="form-group">
                    <label for="counselor_id">Counselor ID:</label>
                    <input type="text" id="counselor_id" name="counselor_id" value="C001" readonly>
                </div>
                
                <div class="form-group">
                    <label for="full_name">Full Name:</label>
                    <input type="text" id="full_name" name="full_name" value="Dr. Lee Wei" required>
                </div>
                
                <div class="form-group">
                    <label for="specialization">Specialization:</label>
                    <select id="specialization" name="specialization" required multiple size="4">
                        <option value="academic" selected>Academic Counseling</option>
                        <option value="mental_health">Mental Health Support</option>
                        <option value="career">Career Guidance</option>
                        <option value="personal">Personal Development</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="qualification">Qualification:</label>
                    <input type="text" id="qualification" name="qualification" value="Ph.D. in Educational Psychology" required>
                </div>
                
                <div class="form-group">
                    <label for="years_experience">Years of Experience:</label>
                    <input type="number" id="years_experience" name="years_experience" value="10" min="0" required>
                </div>
                
                <div class="form-group">
                    <label for="email">Email Address:</label>
                    <input type="email" id="email" name="email" value="lee.wei@university.edu" required>
                </div>
                
                <div class="form-group">
                    <label for="phone">Phone Number:</label>
                    <input type="tel" id="phone" name="phone" value="+60123456789" required>
                </div>
                
                <div class="form-group">
                    <label for="office_location">Office Location:</label>
                    <input type="text" id="office_location" name="office_location" value="Building A, Room 301" required>
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
                    <label for="status">Status:</label>
                    <input type="radio" id="status_active" name="status" value="active" checked>
                    <label for="status_active">Active</label>
                    
                    <input type="radio" id="status_leave" name="status" value="leave">
                    <label for="status_leave">On Leave</label>
                    
                    <input type="radio" id="status_inactive" name="status" value="inactive">
                    <label for="status_inactive">Inactive</label>
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