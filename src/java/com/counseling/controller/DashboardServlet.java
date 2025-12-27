package com.counseling.controller;

import com.counseling.dao.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            UserDAO userDAO = new UserDAO();
            AppointmentDAO apptDAO = new AppointmentDAO();
            CounselorDAO counselorDAO = new CounselorDAO();
            
            // Get KPIs from database
            int totalAppointments = apptDAO.countAllAppointments();
            int totalStudents = userDAO.countStudents();
            int activeCounselors = counselorDAO.countActiveCounselors();
            int pendingAppointments = apptDAO.countPendingAppointments();
            
            // Set attributes for JSP
            request.setAttribute("kpiAppointments", totalAppointments);
            request.setAttribute("kpiStudents", totalStudents);
            request.setAttribute("kpiCounselors", activeCounselors);
            request.setAttribute("kpiPending", pendingAppointments);
            
            // Get recent appointments for table
            request.setAttribute("recentAppointments", apptDAO.getAllAppointments());
            
            request.getRequestDispatcher("dashboard/dashboard.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error loading dashboard", e);
        }
    }
}
