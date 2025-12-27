package com.counseling.model;

import java.io.Serializable;

public class Appointment implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    private int appointmentId;
    private int studentId;
    private int counselorId;
    private String appointmentDate;
    private String appointmentTime;
    private String appointmentType;
    private String reason;
    private String urgency;
    private String status;
    private String contactEmail;
    private String contactPhone;
    private boolean firstVisit;
    
    // Additional fields for display
    private String studentName;
    private String counselorName;
    private String counselorSpecialization;
    
    // Constructors
    public Appointment() {}
    
    // Getters and Setters
    public int getAppointmentId() { return appointmentId; }
    public void setAppointmentId(int appointmentId) { this.appointmentId = appointmentId; }
    
    public int getStudentId() { return studentId; }
    public void setStudentId(int studentId) { this.studentId = studentId; }
    
    public int getCounselorId() { return counselorId; }
    public void setCounselorId(int counselorId) { this.counselorId = counselorId; }
    
    public String getAppointmentDate() { return appointmentDate; }
    public void setAppointmentDate(String appointmentDate) { this.appointmentDate = appointmentDate; }
    
    public String getAppointmentTime() { return appointmentTime; }
    public void setAppointmentTime(String appointmentTime) { this.appointmentTime = appointmentTime; }
    
    public String getAppointmentType() { return appointmentType; }
    public void setAppointmentType(String appointmentType) { this.appointmentType = appointmentType; }
    
    public String getReason() { return reason; }
    public void setReason(String reason) { this.reason = reason; }
    
    public String getUrgency() { return urgency; }
    public void setUrgency(String urgency) { this.urgency = urgency; }
    
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    
    public String getContactEmail() { return contactEmail; }
    public void setContactEmail(String contactEmail) { this.contactEmail = contactEmail; }
    
    public String getContactPhone() { return contactPhone; }
    public void setContactPhone(String contactPhone) { this.contactPhone = contactPhone; }
    
    public boolean isFirstVisit() { return firstVisit; }
    public void setFirstVisit(boolean firstVisit) { this.firstVisit = firstVisit; }
    
    public String getStudentName() { return studentName; }
    public void setStudentName(String studentName) { this.studentName = studentName; }
    
    public String getCounselorName() { return counselorName; }
    public void setCounselorName(String counselorName) { this.counselorName = counselorName; }
    
    public String getCounselorSpecialization() { return counselorSpecialization; }
    public void setCounselorSpecialization(String counselorSpecialization) { 
        this.counselorSpecialization = counselorSpecialization; 
    }
}
