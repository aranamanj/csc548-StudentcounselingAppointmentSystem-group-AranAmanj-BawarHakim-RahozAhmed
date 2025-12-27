package com.counseling.dao;

import com.counseling.model.Appointment;
import com.counseling.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AppointmentDAO {
    
    // CREATE
    public int createAppointment(Appointment appt) throws SQLException {
        String sql = "INSERT INTO appointments (student_id, counselor_id, appointment_date, appointment_time, " +
                     "appointment_type, reason, urgency, status, contact_email, contact_phone, first_visit) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            ps.setInt(1, appt.getStudentId());
            ps.setInt(2, appt.getCounselorId());
            ps.setDate(3, Date.valueOf(appt.getAppointmentDate()));
            ps.setTime(4, Time.valueOf(appt.getAppointmentTime()));
            ps.setString(5, appt.getAppointmentType());
            ps.setString(6, appt.getReason());
            ps.setString(7, appt.getUrgency());
            ps.setString(8, appt.getStatus());
            ps.setString(9, appt.getContactEmail());
            ps.setString(10, appt.getContactPhone());
            ps.setBoolean(11, appt.isFirstVisit());
            
            ps.executeUpdate();
            
            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        }
        return -1;
    }
    
    // READ ALL (with JOIN to get names)
    public List<Appointment> getAllAppointments() throws SQLException {
        String sql = "SELECT a.*, " +
                     "s.full_name AS student_name, " +
                     "c_user.full_name AS counselor_name, " +
                     "c.specialization " +
                     "FROM appointments a " +
                     "JOIN users s ON a.student_id = s.user_id " +
                     "JOIN counselors c ON a.counselor_id = c.counselor_id " +
                     "JOIN users c_user ON c.user_id = c_user.user_id " +
                     "ORDER BY a.appointment_date DESC, a.appointment_time DESC";
        
        return fetchAppointments(sql, null);
    }
    
    // READ BY ID
    public Appointment getAppointmentById(int id) throws SQLException {
        String sql = "SELECT a.*, " +
                     "s.full_name AS student_name, " +
                     "c_user.full_name AS counselor_name, " +
                     "c.specialization " +
                     "FROM appointments a " +
                     "JOIN users s ON a.student_id = s.user_id " +
                     "JOIN counselors c ON a.counselor_id = c.counselor_id " +
                     "JOIN users c_user ON c.user_id = c_user.user_id " +
                     "WHERE a.appointment_id = ?";
        
        List<Appointment> list = fetchAppointments(sql, id);
        return list.isEmpty() ? null : list.get(0);
    }
    
    // READ BY STUDENT ID (role-based)
    public List<Appointment> getAppointmentsByStudent(int studentId) throws SQLException {
        String sql = "SELECT a.*, " +
                     "s.full_name AS student_name, " +
                     "c_user.full_name AS counselor_name, " +
                     "c.specialization " +
                     "FROM appointments a " +
                     "JOIN users s ON a.student_id = s.user_id " +
                     "JOIN counselors c ON a.counselor_id = c.counselor_id " +
                     "JOIN users c_user ON c.user_id = c_user.user_id " +
                     "WHERE a.student_id = ? " +
                     "ORDER BY a.appointment_date DESC";
        
        return fetchAppointments(sql, studentId);
    }
    
    // UPDATE
    public boolean updateAppointment(Appointment appt) throws SQLException {
        String sql = "UPDATE appointments SET counselor_id = ?, appointment_date = ?, appointment_time = ?, " +
                     "appointment_type = ?, reason = ?, urgency = ?, status = ?, " +
                     "contact_email = ?, contact_phone = ?, first_visit = ? " +
                     "WHERE appointment_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, appt.getCounselorId());
            ps.setDate(2, Date.valueOf(appt.getAppointmentDate()));
            ps.setTime(3, Time.valueOf(appt.getAppointmentTime()));
            ps.setString(4, appt.getAppointmentType());
            ps.setString(5, appt.getReason());
            ps.setString(6, appt.getUrgency());
            ps.setString(7, appt.getStatus());
            ps.setString(8, appt.getContactEmail());
            ps.setString(9, appt.getContactPhone());
            ps.setBoolean(10, appt.isFirstVisit());
            ps.setInt(11, appt.getAppointmentId());
            
            return ps.executeUpdate() > 0;
        }
    }
    
    // DELETE
    public boolean deleteAppointment(int id) throws SQLException {
        String sql = "DELETE FROM appointments WHERE appointment_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }
    
    // COUNT TOTAL (for dashboard KPI)
    public int countAllAppointments() throws SQLException {
        String sql = "SELECT COUNT(*) FROM appointments";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }
    
    // COUNT PENDING (for dashboard KPI)
    public int countPendingAppointments() throws SQLException {
        String sql = "SELECT COUNT(*) FROM appointments WHERE status = 'pending'";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }
    
    // Helper method to fetch appointments
    private List<Appointment> fetchAppointments(String sql, Integer param) throws SQLException {
        List<Appointment> list = new ArrayList<>();
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            if (param != null) {
                ps.setInt(1, param);
            }
            
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Appointment a = new Appointment();
                    a.setAppointmentId(rs.getInt("appointment_id"));
                    a.setStudentId(rs.getInt("student_id"));
                    a.setCounselorId(rs.getInt("counselor_id"));
                    a.setAppointmentDate(rs.getDate("appointment_date").toString());
                    a.setAppointmentTime(rs.getTime("appointment_time").toString().substring(0, 5)); // HH:MM
                    a.setAppointmentType(rs.getString("appointment_type"));
                    a.setReason(rs.getString("reason"));
                    a.setUrgency(rs.getString("urgency"));
                    a.setStatus(rs.getString("status"));
                    a.setContactEmail(rs.getString("contact_email"));
                    a.setContactPhone(rs.getString("contact_phone"));
                    a.setFirstVisit(rs.getBoolean("first_visit"));
                    a.setStudentName(rs.getString("student_name"));
                    a.setCounselorName(rs.getString("counselor_name"));
                    a.setCounselorSpecialization(rs.getString("specialization"));
                    list.add(a);
                }
            }
        }
        return list;
    }
}
