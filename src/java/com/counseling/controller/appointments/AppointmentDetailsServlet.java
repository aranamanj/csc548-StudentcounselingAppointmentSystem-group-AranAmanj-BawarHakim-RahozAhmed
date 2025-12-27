package com.counseling.controller.appointments;

import com.counseling.dao.AppointmentDAO;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/appointments/details")
public class AppointmentDetailsServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            AppointmentDAO dao = new AppointmentDAO();
            
            request.setAttribute("appt", dao.getAppointmentById(id));
            request.getRequestDispatcher("/appointments/details.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error loading appointment details", e);
        }
    }
}
