package com.counseling.controller.appointments;

import com.counseling.dao.*;
import com.counseling.model.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/appointments/edit")
public class AppointmentEditServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        
        // ROLE-BASED ACCESS: only counselor and admin can edit
        if (!"counselor".equals(user.getRole()) && !"admin".equals(user.getRole())) {
            request.setAttribute("error", "You don't have permission to edit appointments.");
            response.sendRedirect(request.getContextPath() + "/appointments/list");
            return;
        }
        
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            AppointmentDAO apptDAO = new AppointmentDAO();
            CounselorDAO counselorDAO = new CounselorDAO();
            
            request.setAttribute("appt", apptDAO.getAppointmentById(id));
            request.setAttribute("counselors", counselorDAO.getAllActiveCounselors());
            request.getRequestDispatcher("/appointments/edit.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error loading edit form", e);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        
        // ROLE-BASED ACCESS CHECK
        if (!"counselor".equals(user.getRole()) && !"admin".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/appointments/list");
            return;
        }
        
        try {
            Appointment appt = new Appointment();
            appt.setAppointmentId(Integer.parseInt(request.getParameter("appointment_id")));
            appt.setCounselorId(Integer.parseInt(request.getParameter("counselor_id")));
            appt.setAppointmentDate(request.getParameter("appointment_date"));
            appt.setAppointmentTime(request.getParameter("appointment_time") + ":00");
            appt.setAppointmentType(request.getParameter("appointment_type"));
            appt.setReason(request.getParameter("reason"));
            appt.setUrgency(request.getParameter("urgency"));
            appt.setStatus(request.getParameter("status"));
            appt.setContactEmail(request.getParameter("contact_email"));
            appt.setContactPhone(request.getParameter("contact_phone"));
            appt.setFirstVisit(request.getParameter("first_visit") != null);
            
            AppointmentDAO dao = new AppointmentDAO();
            boolean success = dao.updateAppointment(appt);
            
            if (success) {
                response.sendRedirect(request.getContextPath() + "/appointments/details?id=" + appt.getAppointmentId());
            } else {
                request.setAttribute("error", "Failed to update appointment.");
                doGet(request, response);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "System error. Please try again.");
            doGet(request, response);
        }
    }
}
