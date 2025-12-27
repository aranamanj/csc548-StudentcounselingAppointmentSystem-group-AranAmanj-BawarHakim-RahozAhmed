package com.counseling.model;

import java.io.Serializable;

public class Counselor implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    private int counselorId;
    private int userId;
    private String staffId;
    private String specialization;
    private String qualification;
    private String officeLocation;
    private String status;
    private String fullName; // from users table
    
    // Constructors
    public Counselor() {}
    
    // Getters and Setters
    public int getCounselorId() { return counselorId; }
    public void setCounselorId(int counselorId) { this.counselorId = counselorId; }
    
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    
    public String getStaffId() { return staffId; }
    public void setStaffId(String staffId) { this.staffId = staffId; }
    
    public String getSpecialization() { return specialization; }
    public void setSpecialization(String specialization) { this.specialization = specialization; }
    
    public String getQualification() { return qualification; }
    public void setQualification(String qualification) { this.qualification = qualification; }
    
    public String getOfficeLocation() { return officeLocation; }
    public void setOfficeLocation(String officeLocation) { this.officeLocation = officeLocation; }
    
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }
}
