package com.counseling.controller;

import com.counseling.dao.UserDAO;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.regex.Pattern;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    
    private static final Pattern EMAIL_PATTERN = Pattern.compile("^[A-Za-z0-9+_.-]+@(.+)$");
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("auth/register.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String fullName = request.getParameter("full_name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");
        
        // SERVER-SIDE VALIDATION (required by brief)
        if (fullName == null || fullName.trim().isEmpty()) {
            request.setAttribute("error", "Full name is required.");
            request.getRequestDispatcher("auth/register.jsp").forward(request, response);
            return;
        }
        
        if (email == null || email.trim().isEmpty()) {
            request.setAttribute("error", "Email is required.");
            request.getRequestDispatcher("auth/register.jsp").forward(request, response);
            return;
        }
        
        if (!EMAIL_PATTERN.matcher(email).matches()) {
            request.setAttribute("error", "Invalid email format.");
            request.getRequestDispatcher("auth/register.jsp").forward(request, response);
            return;
        }
        
        if (role == null || role.trim().isEmpty()) {
            request.setAttribute("error", "Please select a role.");
            request.getRequestDispatcher("auth/register.jsp").forward(request, response);
            return;
        }
        
        if (password == null || password.length() < 8) {
            request.setAttribute("error", "Password must be at least 8 characters.");
            request.getRequestDispatcher("auth/register.jsp").forward(request, response);
            return;
        }
        
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match.");
            request.getRequestDispatcher("auth/register.jsp").forward(request, response);
            return;
        }
        
        try {
            UserDAO dao = new UserDAO();
            
            // Check if email already exists
            if (dao.emailExists(email)) {
                request.setAttribute("error", "Email already registered.");
                request.getRequestDispatcher("auth/register.jsp").forward(request, response);
                return;
            }
            
            // Create user
            int userId = dao.createUser(fullName, email, password, phone, role);
            
            if (userId > 0) {
                request.setAttribute("success", "Registration successful! Please login.");
                request.getRequestDispatcher("auth/login.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Registration failed. Please try again.");
                request.getRequestDispatcher("auth/register.jsp").forward(request, response);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "System error. Please try again.");
            request.getRequestDispatcher("auth/register.jsp").forward(request, response);
        }
    }
}
