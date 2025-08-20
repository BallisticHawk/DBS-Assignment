-- Create Database
CREATE DATABASE MedicalInfoSystem;
GO

-- Use the database
USE MedicalInfoSystem;
GO

-- Staff table
CREATE TABLE Staff(
    StaffID VARCHAR(6) PRIMARY KEY, -- same as login name
    StaffName VARCHAR(100) NOT NULL,
    HomeAddress VARCHAR(200) NOT NULL, -- highly sensitive data
    OfficePhone VARCHAR(20),
    PersonalPhone VARCHAR(20), -- sensitive data
    Position VARCHAR(20)
);
GO

-- Patient table
CREATE TABLE Patient(
    PatientID VARCHAR(6) PRIMARY KEY, -- same as login name
    PatientName VARCHAR(100) NOT NULL,
    Phone VARCHAR(20), -- sensitive data
    HomeAddress VARCHAR(200) NOT NULL -- highly sensitive data
);
GO

-- Appointment and Diagnosis table (manages patient-doctor appointments & diagnosis)
CREATE TABLE AppointmentAndDiagnosis(
    DiagID INT IDENTITY(1,1) PRIMARY KEY,
    AppDateTime DATETIME NOT NULL,
    PatientID VARCHAR(6) NOT NULL,
    DoctorID VARCHAR(6) NOT NULL,
    DiagDetails VARCHAR(MAX), -- extremely sensitive data

    -- Foreign keys
    CONSTRAINT FK_Appointment_Patient FOREIGN KEY (PatientID)
        REFERENCES Patient(PatientID),
    CONSTRAINT FK_Appointment_Doctor FOREIGN KEY (DoctorID)
        REFERENCES Staff(StaffID)
);
GO