package com.counseling.dao;

import com.counseling.model.Counselor;
import com.counseling.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CounselorDAO {
    
    // Get all active counselors
    public List<Counselor> getAllActiveCounselors() throws SQLException {
        String sql = "SELECT c.counselor_id, c.staff_id, c.specialization, c.qualification, " +
                     "c.office_location, c.status, u.full_name " +
                     "FROM counselors c " +
                     "JOIN users u ON c.user_id = u.user_id " +
                     "WHERE c.status = 'active' " +
                     "ORDER BY u.full_name";
        
        List<Counselor> list = new ArrayList<>();
        
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                Counselor c = new Counselor();
                c.setCounselorId(rs.getInt("counselor_id"));
                c.setStaffId(rs.getString("staff_id"));
                c.setSpecialization(rs.getString("specialization"));
                c.setQualification(rs.getString("qualification"));
                c.setOfficeLocation(rs.getString("office_location"));
                c.setStatus(rs.getString("status"));
                c.setFullName(rs.getString("full_name"));
                list.add(c);
            }
        }
        return list;
    }
    
    // Count active counselors (for dashboard KPI)
    public int countActiveCounselors() throws SQLException {
        String sql = "SELECT COUNT(*) FROM counselors WHERE status = 'active'";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }
}
