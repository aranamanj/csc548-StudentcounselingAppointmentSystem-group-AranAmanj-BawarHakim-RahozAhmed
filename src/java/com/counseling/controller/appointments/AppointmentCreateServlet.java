package com.counseling.controller.appointments;

import com.counseling.dao.*;
import com.counseling.model.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/appointments/create")
public class AppointmentCreateServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        
        // ROLE-BASED ACCESS: only students and admin can create
        if (!"student".equals(user.getRole()) && !"admin".equals(user.getRole())) {
            request.setAttribute("error", "You don't have permission to create appointments.");
            request.getRequestDispatcher("/appointments/list").forward(request, response);
            return;
        }
        
        try {
            // Load counselors for dropdown
            CounselorDAO counselorDAO = new CounselorDAO();
            request.setAttribute("counselors", counselorDAO.getAllActiveCounselors());
            request.getRequestDispatcher("/appointments/create.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error loading create form", e);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        
        // ROLE-BASED ACCESS CHECK
        if (!"student".equals(user.getRole()) && !"admin".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/appointments/list");
            return;
        }
        
        try {
            Appointment appt = new Appointment();
            appt.setStudentId(user.getUserId());
            appt.setCounselorId(Integer.parseInt(request.getParameter("counselor_id")));
            appt.setAppointmentDate(request.getParameter("appointment_date"));
            appt.setAppointmentTime(request.getParameter("appointment_time") + ":00");
            appt.setAppointmentType(request.getParameter("appointment_type"));
            appt.setReason(request.getParameter("reason"));
            appt.setUrgency(request.getParameter("urgency"));
            appt.setStatus("pending");
            appt.setContactEmail(request.getParameter("contact_email"));
            appt.setContactPhone(request.getParameter("contact_phone"));
            appt.setFirstVisit(request.getParameter("first_visit") != null);
            
            AppointmentDAO dao = new AppointmentDAO();
            int id = dao.createAppointment(appt);
            
            if (id > 0) {
                response.sendRedirect(request.getContextPath() + "/appointments/details?id=" + id);
            } else {
                request.setAttribute("error", "Failed to create appointment.");
                doGet(request, response);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "System error. Please try again.");
            doGet(request, response);
        }
    }
}
