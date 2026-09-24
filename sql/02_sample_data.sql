-- BSFM database project
-- File 2 of 3: sample data (shared)
-- Run this after 01_schema.sql, and only once on a fresh database.

USE bsfm_db;

INSERT INTO Customer (full_name, phone, email, address) VALUES
('Ahmed Al Mazrouei', '0501112222', 'ahmed.m@example.com', 'Al Reem Island, Abu Dhabi'),
('Fatima Al Suwaidi', '0503334444', 'fatima.s@example.com', 'Khalifa City, Abu Dhabi'),
('Omar Al Nuaimi', '0505556666', 'omar.n@example.com', 'Al Bateen, Abu Dhabi');

INSERT INTO Service (service_name, category, price, description) VALUES
('Residential Deep Cleaning', 'Cleaning', 350.00, 'Full apartment or villa deep clean'),
('AC Duct Cleaning', 'Maintenance', 450.00, 'Duct cleaning and disinfection'),
('Office Cleaning Contract', 'Cleaning', 900.00, 'Recurring commercial office cleaning'),
('Sofa and Carpet Cleaning', 'Cleaning', 200.00, 'Deep shampoo cleaning for upholstery');

INSERT INTO Booking (customer_id, service_id, booking_date, time_slot, service_address, status) VALUES
(1, 1, '2026-09-25', '10:00 AM', 'Al Reem Island, Abu Dhabi', 'Confirmed'),
(2, 2, '2026-09-26', '02:00 PM', 'Khalifa City, Abu Dhabi', 'Pending'),
(3, 4, '2026-09-27', '11:00 AM', 'Al Bateen, Abu Dhabi', 'Completed'),
(1, 3, '2026-09-28', '09:00 AM', 'Al Reem Island, Abu Dhabi', 'Confirmed'),
(2, 1, '2026-09-15', '01:00 PM', 'Khalifa City, Abu Dhabi', 'Cancelled');

INSERT INTO Staff (full_name, phone, role, hire_date) VALUES
('Ravi Kumar', '0561112233', 'Cleaner', '2024-02-01'),
('Sara Youssef', '0562223344', 'AC Technician', '2023-11-15'),
('Bilal Hassan', '0563334455', 'Supervisor', '2022-06-10');

INSERT INTO Assignment (booking_id, staff_id, assigned_role) VALUES
(1, 1, 'Lead'),
(1, 3, 'Supervisor'),
(2, 2, 'Lead'),
(3, 1, 'Lead'),
(4, 1, 'Lead');

INSERT INTO Invoice (booking_id, amount, issue_date, due_date, payment_status, payment_date) VALUES
(1, 350.00, '2026-09-25', '2026-10-02', 'Unpaid', NULL),
(2, 450.00, '2026-09-26', '2026-10-03', 'Unpaid', NULL),
(3, 200.00, '2026-09-27', '2026-10-04', 'Paid', '2026-09-27'),
(4, 900.00, '2026-09-28', '2026-10-05', 'Unpaid', NULL);