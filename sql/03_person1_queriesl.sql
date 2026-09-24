-- BSFM database project
-- File 3 of 3: Person 1 queries (Customers and Service Bookings)
-- Tables owned: Customer, Service, Booking
-- Run this after 01_schema.sql and 02_sample_data.sql, in order, once.
-- Note: query 2 uses customer_id 4, which is the customer created by query 1.

USE bsfm_db;

-- 1. CREATE: register a new customer
INSERT INTO Customer (full_name, phone, email, address)
VALUES ('Layla Hamdan', '0507778888', 'layla.h@example.com', 'Yas Island, Abu Dhabi');

-- 2. CREATE: place a new booking
INSERT INTO Booking (customer_id, service_id, booking_date, time_slot, service_address, status)
VALUES (4, 2, '2026-10-01', '03:00 PM', 'Yas Island, Abu Dhabi', 'Pending');

-- 3. READ: full booking history for one customer
SELECT b.booking_id, s.service_name, b.booking_date, b.status
FROM Booking b
JOIN Service s ON b.service_id = s.service_id
WHERE b.customer_id = 1
ORDER BY b.booking_date DESC;

-- 4. READ: all upcoming confirmed bookings
SELECT c.full_name, s.service_name, b.booking_date, b.time_slot
FROM Booking b
JOIN Customer c ON b.customer_id = c.customer_id
JOIN Service s ON b.service_id = s.service_id
WHERE b.status = 'Confirmed' AND b.booking_date >= CURDATE()
ORDER BY b.booking_date;

-- 5. UPDATE: confirm a pending booking
UPDATE Booking
SET status = 'Confirmed'
WHERE booking_id = 2;

-- 6. DELETE: remove a cancelled booking
DELETE FROM Booking
WHERE booking_id = 5 AND status = 'Cancelled';

-- 7. AGGREGATE: number of bookings per service category
SELECT s.category, COUNT(b.booking_id) AS total_bookings
FROM Booking b
JOIN Service s ON b.service_id = s.service_id
GROUP BY s.category;