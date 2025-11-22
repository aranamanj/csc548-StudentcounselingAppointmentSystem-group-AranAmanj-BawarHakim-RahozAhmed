<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Students - Student Counseling System</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>All Students</h1>
        <p>Purpose: View and manage registered students in the counseling system</p>
    </header>
    
    <nav>
        <a href="../dashboard/dashboard.jsp">← Back to Dashboard</a> | 
        <a href="../index.jsp">Sitemap</a>
    </nav>
    
    <main>
        <section>
            <div class="toolbar">
                <a href="create.jsp" class="btn-primary">+ Add New Student</a>
                
                <div class="filters">
                    <label for="search">Search:</label>
                    <input type="search" id="search" placeholder="Search by name or ID...">
                    
                    <button class="btn-secondary">Search</button>
                </div>
            </div>
            
            <h2>Students Directory [Placeholder]</h2>
            <table class="data-table">
                <thead>
                    <tr>
                        <th>Student ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Total Appointments</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>2023001234</td>
                        <td>Sarah Ahmad</td>
                        <td>sarah.ahmad@university.edu</td>
                        <td>+60123456789</td>
                        <td>3</td>
                        <td>
                            <a href="../appointments/list.jsp">View Appointments</a>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">[Placeholder: More student rows will be populated from database]</td>
                    </tr>
                </tbody>
            </table>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2025 Student Counseling System</p>
    </footer>
</body>
</html>