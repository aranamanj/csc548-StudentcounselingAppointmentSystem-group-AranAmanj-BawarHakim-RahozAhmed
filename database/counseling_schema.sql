-- ============================================
-- STUDENT COUNSELING SYSTEM - DATABASE SCHEMA
-- Deliverable 2: 4 Tables Minimum
-- ============================================

DROP DATABASE IF EXISTS counseling_db;
CREATE DATABASE counseling_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE counseling_db;

-- ============================================
-- TABLE 1: USERS (base table for all users)
-- ============================================
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    phone VARCHAR(30),
    role ENUM('student', 'counselor', 'admin') NOT NULL DEFAULT 'student',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_email (email),
    INDEX idx_role (role)
) ENGINE=InnoDB;

-- ============================================
-- TABLE 2: COUNSELORS (extends users)
-- ============================================
CREATE TABLE counselors (
    counselor_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL UNIQUE,
    staff_id VARCHAR(30) NOT NULL UNIQUE,
    specialization VARCHAR(100) NOT NULL,
    qualification VARCHAR(200),
    office_location VARCHAR(120),
    status ENUM('active', 'on_leave', 'inactive') NOT NULL DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    INDEX idx_status (status),
    INDEX idx_specialization (specialization)
) ENGINE=InnoDB;

-- ============================================
-- TABLE 3: APPOINTMENTS (main CRUD entity)
-- ============================================
CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    counselor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    appointment_type ENUM('academic', 'mental_health', 'career', 'personal', 'other') NOT NULL,
    reason TEXT NOT NULL,
    urgency ENUM('low', 'medium', 'high') NOT NULL DEFAULT 'low',
    status ENUM('pending', 'confirmed', 'completed', 'cancelled', 'rescheduled') NOT NULL DEFAULT 'pending',
    contact_email VARCHAR(120),
    contact_phone VARCHAR(30),
    first_visit BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (counselor_id) REFERENCES counselors(counselor_id) ON DELETE CASCADE,
    INDEX idx_student (student_id),
    INDEX idx_counselor (counselor_id),
    INDEX idx_date (appointment_date),
    INDEX idx_status (status)
) ENGINE=InnoDB;

-- ============================================
-- TABLE 4: SESSION_NOTES (confidential records)
-- ============================================
CREATE TABLE session_notes (
    session_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL UNIQUE,
    counselor_id INT NOT NULL,
    session_date DATE NOT NULL,
    duration_minutes INT NOT NULL DEFAULT 60,
    attendance ENUM('attended', 'no_show', 'cancelled') NOT NULL,
    session_summary TEXT,
    key_issues TEXT,
    interventions TEXT,
    risk_assessment ENUM('low', 'medium', 'high') NOT NULL DEFAULT 'low',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id) ON DELETE CASCADE,
    FOREIGN KEY (counselor_id) REFERENCES counselors(counselor_id) ON DELETE CASCADE,
    INDEX idx_session_date (session_date),
    INDEX idx_risk (risk_assessment)
) ENGINE=InnoDB;

-- ============================================
-- SAMPLE DATA (for testing)
-- Password for all: "password123"
-- ============================================

INSERT INTO users (full_name, email, password_hash, phone, role) VALUES
('Admin User', 'admin@university.edu', 'password123', '+9647501234500', 'admin'),
('Dr. Lee Wei', 'lee.wei@university.edu', 'password123', '+9647501234501', 'counselor'),
('Ms. Fatimah Hassan', 'fatimah.hassan@university.edu', 'password123', '+9647501234502', 'counselor'),
('Mr. Raj Kumar', 'raj.kumar@university.edu', 'password123', '+9647501234503', 'counselor'),
('Sarah Ahmad', 'sarah.ahmad@university.edu', 'password123', '+9647501234600', 'student'),
('John Lee', 'john.lee@university.edu', 'password123', '+9647501234601', 'student'),
('Maria Santos', 'maria.santos@university.edu', 'password123', '+9647501234602', 'student');

INSERT INTO counselors (user_id, staff_id, specialization, qualification, office_location, status) VALUES
(2, 'C001', 'Academic Counseling', 'Ph.D. in Educational Psychology', 'Building A, Room 301', 'active'),
(3, 'C002', 'Mental Health Support', 'M.A. in Clinical Psychology', 'Building A, Room 302', 'active'),
(4, 'C003', 'Career Counseling', 'MBA, Career Development', 'Building B, Room 201', 'active');

INSERT INTO appointments (student_id, counselor_id, appointment_date, appointment_time, appointment_type, reason, urgency, status, contact_email, contact_phone, first_visit) VALUES
(5, 1, '2025-12-28', '10:00:00', 'academic', 'Need help with course selection for next semester', 'medium', 'pending', 'sarah.ahmad@university.edu', '+9647501234600', TRUE),
(6, 2, '2025-12-29', '14:00:00', 'mental_health', 'Experiencing exam stress and anxiety', 'high', 'confirmed', 'john.lee@university.edu', '+9647501234601', FALSE),
(7, 3, '2025-12-30', '11:00:00', 'career', 'Career planning after graduation', 'low', 'pending', 'maria.santos@university.edu', '+9647501234602', TRUE);

-- ============================================
-- USEFUL VIEWS (optional)
-- ============================================

-- CREATE VIEW vw_appointments_full AS
-- SELECT 
--     a.appointment_id,
--     a.appointment_date,
--     a.appointment_time,
--     a.appointment_type,
--     a.status,
--     a.urgency,
--     a.reason,
--     s.full_name AS student_name,
--     s.email AS student_email,
--     c_user.full_name AS counselor_name,
--     c.specialization,
--     c.office_location
-- FROM appointments a
-- JOIN users s ON a.student_id = s.user_id
-- JOIN counselors c ON a.counselor_id = c.counselor_id
-- JOIN users c_user ON c.user_id = c_user.user_id;
