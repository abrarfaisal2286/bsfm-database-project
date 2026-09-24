-- BSFM database project
-- File 1 of 3: database and table structure (shared schema)
-- Run this first, before the sample data and the query files.

CREATE DATABASE IF NOT EXISTS bsfm_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;

USE bsfm_db;

CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100),
    address VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Service (
    service_id INT AUTO_INCREMENT PRIMARY KEY,
    service_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    description TEXT
);

CREATE TABLE Booking (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    service_id INT NOT NULL,
    booking_date DATE NOT NULL,
    time_slot VARCHAR(20),
    service_address VARCHAR(255),
    status ENUM('Pending','Confirmed','Completed','Cancelled') DEFAULT 'Pending',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (service_id) REFERENCES Service(service_id)
);

CREATE TABLE Staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    role VARCHAR(50) NOT NULL,
    hire_date DATE
);

CREATE TABLE Assignment (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    staff_id INT NOT NULL,
    assigned_role VARCHAR(50),
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id),
    UNIQUE (booking_id, staff_id)
);

CREATE TABLE Invoice (
    invoice_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL UNIQUE,
    amount DECIMAL(10,2) NOT NULL,
    issue_date DATE,
    due_date DATE,
    payment_status ENUM('Unpaid','Paid','Overdue') DEFAULT 'Unpaid',
    payment_date DATE,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);