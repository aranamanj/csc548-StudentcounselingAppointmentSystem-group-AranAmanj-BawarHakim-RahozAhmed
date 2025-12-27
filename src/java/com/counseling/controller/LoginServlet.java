package com.counseling.controller;

import com.counseling.dao.UserDAO;
import com.counseling.model.User;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("auth/login.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        // Validation
        if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Please enter both email and password.");
            request.getRequestDispatcher("auth/login.jsp").forward(request, response);
            return;
        }
        
        try {
            UserDAO dao = new UserDAO();
            User user = dao.login(email, password);
            
            if (user == null) {
                request.setAttribute("error", "Invalid email or password.");
                request.getRequestDispatcher("auth/login.jsp").forward(request, response);
                return;
            }
            
            // Create session
            HttpSession session = request.getSession(true);
            session.setAttribute("user", user);
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("role", user.getRole());
            session.setAttribute("fullName", user.getFullName());
            
            // Redirect to dashboard
            response.sendRedirect(request.getContextPath() + "/DashboardServlet");
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "System error. Please try again.");
            request.getRequestDispatcher("auth/login.jsp").forward(request, response);
        }
    }
}
