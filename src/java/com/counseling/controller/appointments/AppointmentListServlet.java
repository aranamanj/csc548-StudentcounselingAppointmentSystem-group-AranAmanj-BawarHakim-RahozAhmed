package com.counseling.controller.appointments;

import com.counseling.dao.AppointmentDAO;
import com.counseling.model.User;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/appointments/list")
public class AppointmentListServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        String role = user.getRole();
        
        try {
            AppointmentDAO dao = new AppointmentDAO();
            List appointments;
            
            // Role-based access: students see only their appointments
            if ("student".equals(role)) {
                appointments = dao.getAppointmentsByStudent(user.getUserId());
            } else {
                // admin and counselor see all
                appointments = dao.getAllAppointments();
            }
            
            request.setAttribute("appointments", appointments);
            request.getRequestDispatcher("/appointments/list.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error loading appointments", e);
        }
    }
}
