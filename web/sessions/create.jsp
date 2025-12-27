<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/auth/login.jsp");
        return;
    }
    
    String userName = (String) session.getAttribute("userName"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Session Note - Student Counseling System</title>
    <link rel="stylesheet" href="../assets/styles.css">
</head>
<body>
    <header>
        <h1>Create Session Note</h1>
        <p>Purpose: Document confidential counseling session details and observations</p>
    </header>
    
    <nav>
        <a href="list.jsp">← Back to Session Notes</a> | 
        <a href="<%= request.getContextPath() %>/DashboardServlet">Dashboard</a>
    </nav>
    
    <main>
        <section class="form-container">
            <h2>Session Note Form</h2>
            <p><em>Confidential - For authorized counselors only</em></p>
            
            <form>
                <div class="form-group">
                    <label for="appointment_id">Appointment ID:</label>
                    <input type="text" id="appointment_id" name="appointment_id" required placeholder="APT001">
                </div>
                
                <div class="form-group">
                    <label for="counselor_id">Counselor ID:</label>
                    <input type="text" id="counselor_id" name="counselor_id" required readonly value="C001">
                </div>
                
                <div class="form-group">
                    <label for="session_date">Session Date:</label>
                    <input type="date" id="session_date" name="session_date" required>
                </div>
                
                <div class="form-group">
                    <label for="session_duration">Session Duration (minutes):</label>
                    <input type="number" id="session_duration" name="session_duration" min="15" max="180" value="60" required>
                </div>
                
                <div class="form-group">
                    <label for="attendance">Student Attendance:</label>
                    <input type="radio" id="attended" name="attendance" value="attended" checked>
                    <label for="attended">Attended</label>
                    
                    <input type="radio" id="no_show" name="attendance" value="no_show">
                    <label for="no_show">No Show</label>
                    
                    <input type="radio" id="cancelled" name="attendance" value="cancelled">
                    <label for="cancelled">Cancelled</label>
                </div>
                
                <div class="form-group">
                    <label for="session_summary">Session Summary:</label>
                    <textarea id="session_summary" name="session_summary" rows="5" required placeholder="Brief overview of the session..."></textarea>
                </div>
                
                <div class="form-group">
                    <label for="key_issues">Key Issues Discussed:</label>
                    <textarea id="key_issues" name="key_issues" rows="5" required placeholder="Main topics and concerns addressed..."></textarea>
                </div>
                
                <div class="form-group">
                    <label for="interventions">Interventions Used:</label>
                    <textarea id="interventions" name="interventions" rows="4" placeholder="Counseling techniques and strategies applied..."></textarea>
                </div>
                
                <div class="form-group">
                    <label for="student_response">Student Response:</label>
                    <textarea id="student_response" name="student_response" rows="4" placeholder="Student's reactions and progress observed..."></textarea>
                </div>
                
                <div class="form-group">
                    <label for="action_plan">Action Plan / Next Steps:</label>
                    <textarea id="action_plan" name="action_plan" rows="4" placeholder="Recommendations and follow-up actions..."></textarea>
                </div>
                
                <div class="form-group">
                    <label for="follow_up_needed">Follow-up Session Needed:</label>
                    <input type="checkbox" id="follow_up_needed" name="follow_up_needed">
                    <label for="follow_up_needed">Yes, schedule follow-up</label>
                </div>
                
                <div class="form-group">
                    <label for="risk_assessment">Risk Assessment:</label>
                    <select id="risk_assessment" name="risk_assessment" required>
                        <option value="low">Low Risk</option>
                        <option value="medium">Medium Risk</option>
                        <option value="high">High Risk - Referral Needed</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="confidential_notes">Additional Confidential Notes:</label>
                    <textarea id="confidential_notes" name="confidential_notes" rows="4" placeholder="Private notes for counselor records only..."></textarea>
                </div>
                
                <div class="button-group">
                    <button type="submit" class="btn-primary">Save Session Note</button>
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