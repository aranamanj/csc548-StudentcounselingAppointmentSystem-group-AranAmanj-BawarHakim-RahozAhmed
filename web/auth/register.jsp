<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Student Counseling System</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>Register New Account</h1>
        <p>Purpose: User registration for students and counselors</p>
    </header>
    
    <nav>
        <a href="../index.jsp">← Back to Sitemap</a> | 
        <a href="login.jsp">Already have an account? Login</a>
    </nav>
    
    <main>
        <section class="form-container">
            <h2>Registration Form</h2>
            <form action="../Process" method="POST">
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
                    <label for="student_id">Student/Staff ID:</label>
                    <input type="text" id="student_id" name="student_id" required placeholder="2023001234">
                </div>
                
                <div class="form-group">
                    <label for="role">Register As:</label>
                    <select id="role" name="role" required>
                        <option value="">-- Select Role --</option>
                        <option value="student">Student</option>
                        <option value="counselor">Counselor</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required minlength="8" placeholder="Minimum 8 characters">
                </div>
                
                <div class="form-group">
                    <label for="confirm_password">Confirm Password:</label>
                    <input type="password" id="confirm_password" name="confirm_password" required minlength="8">
                </div>
                
                <div class="form-group">
                    <input type="checkbox" id="terms" name="terms" required>
                    <label for="terms">I agree to the Terms and Conditions</label>
                </div>
                
                <button type="submit" class="btn-primary">Register</button>
            </form>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2025 Student Counseling System</p>
    </footer>
</body>
</html>