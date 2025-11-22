-- Create Database
CREATE DATABASE IF NOT EXISTS student_counseling_system;
USE student_counseling_system;

-- =============================================
-- TABLE 1: USERS
-- =============================================
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    role ENUM('student', 'counselor', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_email (email),
    INDEX idx_role (role)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =============================================
-- TABLE 2: COUNSELORS
-- =============================================
CREATE TABLE counselors (
    counselor_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNIQUE NOT NULL,
    staff_id VARCHAR(20) UNIQUE NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    qualification VARCHAR(200),
    years_experience INT,
    office_location VARCHAR(100),
    office_hours_start TIME DEFAULT '09:00:00',
    office_hours_end TIME DEFAULT '17:00:00',
    max_appointments_per_day INT DEFAULT 8,
    status ENUM('active', 'on_leave', 'inactive') DEFAULT 'active',
    bio TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    INDEX idx_status (status),
    INDEX idx_specialization (specialization)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =============================================
-- TABLE 3: APPOINTMENTS
-- =============================================
CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    counselor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    appointment_type ENUM('academic', 'mental_health', 'career', 'personal', 'other') NOT NULL,
    reason TEXT NOT NULL,
    urgency ENUM('low', 'medium', 'high') DEFAULT 'low',
    status ENUM('pending', 'confirmed', 'completed', 'cancelled', 'rescheduled') DEFAULT 'pending',
    contact_email VARCHAR(100),
    contact_phone VARCHAR(20),
    first_visit BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (counselor_id) REFERENCES counselors(counselor_id) ON DELETE CASCADE,
    INDEX idx_student (student_id),
    INDEX idx_counselor (counselor_id),
    INDEX idx_date (appointment_date),
    INDEX idx_status (status),
    INDEX idx_type (appointment_type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =============================================
-- TABLE 4: SESSION_NOTES
-- =============================================
CREATE TABLE session_notes (
    session_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT UNIQUE NOT NULL,
    counselor_id INT NOT NULL,
    session_date DATE NOT NULL,
    duration_minutes INT DEFAULT 60,
    attendance ENUM('attended', 'no_show', 'cancelled') NOT NULL,
    session_summary TEXT,
    key_issues TEXT,
    interventions TEXT,
    student_response TEXT,
    action_plan TEXT,
    follow_up_needed BOOLEAN DEFAULT FALSE,
    risk_assessment ENUM('low', 'medium', 'high') DEFAULT 'low',
    confidential_notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id) ON DELETE CASCADE,
    FOREIGN KEY (counselor_id) REFERENCES counselors(counselor_id) ON DELETE CASCADE,
    INDEX idx_session_date (session_date),
    INDEX idx_counselor (counselor_id),
    INDEX idx_risk (risk_assessment)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;