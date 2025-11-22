<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Counselors - Student Counseling System</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>All Counselors</h1>
        <p>Purpose: View and manage counselor profiles and availability</p>
    </header>
    
    <nav>
        <a href="../dashboard/dashboard.jsp">← Back to Dashboard</a> | 
        <a href="../index.jsp">Sitemap</a>
    </nav>
    
    <main>
        <section>
            <div class="toolbar">
                <a href="create.jsp" class="btn-primary">+ Add New Counselor</a>
                
                <div class="filters">
                    <label for="filter-specialization">Specialization:</label>
                    <select id="filter-specialization">
                        <option value="all">All</option>
                        <option value="academic">Academic</option>
                        <option value="mental_health">Mental Health</option>
                        <option value="career">Career</option>
                        <option value="personal">Personal</option>
                    </select>
                    
                    <label for="filter-availability">Availability:</label>
                    <select id="filter-availability">
                        <option value="all">All</option>
                        <option value="available">Available</option>
                        <option value="busy">Busy</option>
                    </select>
                </div>
            </div>
            
            <h2>Counselors Directory [Placeholder]</h2>
            <table class="data-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Specialization</th>
                        <th>Office</th>
                        <th>Contact</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>C001</td>
                        <td>Dr. Lee Wei</td>
                        <td>Academic Counseling</td>
                        <td>Building A, Room 301</td>
                        <td>lee.wei@university.edu</td>
                        <td><span class="badge-success">Available</span></td>
                        <td>
                            <a href="details.jsp">View</a> | 
                            <a href="edit.jsp">Edit</a>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="7">[Placeholder: More counselor rows will be populated from database]</td>
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