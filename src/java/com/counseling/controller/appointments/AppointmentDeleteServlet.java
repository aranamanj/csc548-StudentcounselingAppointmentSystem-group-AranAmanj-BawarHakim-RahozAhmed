package com.counseling.controller.appointments;

import com.counseling.dao.AppointmentDAO;
import com.counseling.model.User;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/appointments/delete")
public class AppointmentDeleteServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        
        // ROLE-BASED ACCESS: only admin can delete
        if (!"admin".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/appointments/list");
            return;
        }
        
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            AppointmentDAO dao = new AppointmentDAO();
            dao.deleteAppointment(id);
            
            response.sendRedirect(request.getContextPath() + "/appointments/list");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/appointments/list");
        }
    }
}
