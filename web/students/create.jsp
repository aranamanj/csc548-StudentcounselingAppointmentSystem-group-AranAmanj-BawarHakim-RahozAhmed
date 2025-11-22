<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Student - Student Counseling System</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>Add New Student</h1>
        <p>Purpose: Register a new student to the counseling system</p>
    </header>
    
    <nav>
        <a href="list.jsp">← Back to Students</a> | 
        <a href="../dashboard/dashboard.jsp">Dashboard</a>
    </nav>
    
    <main>
        <section class="form-container">
            <h2>Student Registration Form</h2>
            <form>
                <div class="form-group">
                    <label for="student_id">Student ID:</label>
                    <input type="text" id="student_id" name="student_id" required placeholder="2023001234">
                </div>
                
                <div class="form-group">
                    <label for="full_name">Full Name:</label>
                    <input type="text" id="full_name" name="full_name" required placeholder="John Doe">
                </div>
                
                <div class="form-group">
                    <label for="email">Email Address:</label>
                    <input type="email" id="email" name="email" required placeholder="student@university.edu">
                </div>
                
                <div class="form-group">
                    <label for="phone">Phone Number:</label>
                    <input type="tel" id="phone" name="phone" required placeholder="+60123456789">
                </div>
                
                <div class="form-group">
                    <label for="program">Program/Major:</label>
                    <input type="text" id="program" name="program" required placeholder="Computer Science">
                </div>
                
                <div class="form-group">
                    <label for="year">Year of Study:</label>
                    <select id="year" name="year" required>
                        <option value="">-- Select year --</option>
                        <option value="1">Year 1</option>
                        <option value="2">Year 2</option>
                        <option value="3">Year 3</option>
                        <option value="4">Year 4</option>
                        <option value="postgrad">Postgraduate</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="enrollment_date">Enrollment Date:</label>
                    <input type="date" id="enrollment_date" name="enrollment_date" required>
                </div>
                
                <div class="button-group">
                    <button type="submit" class="btn-primary">Add Student</button>
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