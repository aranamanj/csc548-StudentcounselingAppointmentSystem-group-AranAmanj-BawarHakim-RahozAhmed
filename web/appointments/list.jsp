<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Appointments - Student Counseling System</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>All Appointments</h1>
        <p>Purpose: View and manage all counseling appointments in the system</p>
    </header>
    
    <nav>
        <a href="../dashboard/dashboard.jsp">← Back to Dashboard</a> | 
        <a href="../index.jsp">Sitemap</a>
    </nav>
    
    <main>
        <section>
            <div class="toolbar">
                <a href="create.jsp" class="btn-primary">+ Book New Appointment</a>
                
                <div class="filters">
                    <label for="filter-status">Status:</label>
                    <select id="filter-status">
                        <option value="all">All</option>
                        <option value="pending">Pending</option>
                        <option value="confirmed">Confirmed</option>
                        <option value="completed">Completed</option>
                        <option value="cancelled">Cancelled</option>
                    </select>
                    
                    <label for="filter-date">Date:</label>
                    <input type="date" id="filter-date">
                    
                    <button class="btn-secondary">Apply Filters</button>
                </div>
            </div>
            
            <h2>Appointments Table [Placeholder]</h2>
            <table class="data-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Student Name</th>
                        <th>Counselor</th>
                        <th>Date & Time</th>
                        <th>Type</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>APT001</td>
                        <td>Sarah Ahmad</td>
                        <td>Dr. Lee Wei</td>
                        <td>2025-11-25 10:00 AM</td>
                        <td>Academic</td>
                        <td><span class="badge-pending">Pending</span></td>
                        <td>
                            <a href="details.jsp">View</a> | 
                            <a href="edit.jsp">Edit</a>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="7">[Placeholder: More appointment rows will be populated from database]</td>
                    </tr>
                </tbody>
            </table>
            
            <div class="pagination">
                <button>← Previous</button>
                <span>Page 1 of 10</span>
                <button>Next →</button>
            </div>
        </section>
    </main>
    
    <footer>
        <p>&copy; 2025 Student Counseling System</p>
    </footer>
</body>
</html>