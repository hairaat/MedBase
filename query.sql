--Create the database
CREATE DATABASE TANMAY;
--Use the Database
USE TANMAY;
-- Create Patients Table
CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender ENUM('Male', 'Female', 'Other'),
    DateOfBirth DATE,
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15),
    EmergencyContactName VARCHAR(100),
    EmergencyContactNumber VARCHAR(15)
);

-- Create Doctors Table
CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender ENUM('Male', 'Female', 'Other'),
    DateOfBirth DATE,
    Specialty VARCHAR(100),
    Department VARCHAR(100),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100)
);

-- Create Appointments Table
CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    DoctorID INT,
    PatientID INT,
    AppointmentDateTime DATETIME,
    AppointmentReason VARCHAR(255),
    AppointmentType ENUM('Regular', 'Emergency'),
    AppointmentStatus ENUM('Scheduled', 'Completed', 'Cancelled'),
    Notes TEXT,
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

-- Create Medical Records Table
CREATE TABLE MedicalRecords (
    RecordID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    RecordDate DATE,
    Diagnosis TEXT,
    Prescription TEXT,
    LabResults TEXT,
    NextAppointmentDate DATE,
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

-- Create Payments Table
CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    PaymentMethod ENUM('Cash', 'Credit Card', 'Debit Card', 'Insurance'),
    TransactionID VARCHAR(100),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

-- Create Departments Table
CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(100),
    DepartmentHead INT, -- DoctorID of the department head
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100)
);

-- Create Tests Table
CREATE TABLE Tests (
    TestID INT AUTO_INCREMENT PRIMARY KEY,
    TestName VARCHAR(100),
    Description TEXT,
    Cost DECIMAL(10, 2)
);

-- Create TestResults Table
CREATE TABLE TestResults (
    ResultID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    TestID INT,
    TestDate DATE,
    Result TEXT,
    Notes TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (TestID) REFERENCES Tests(TestID)
);
