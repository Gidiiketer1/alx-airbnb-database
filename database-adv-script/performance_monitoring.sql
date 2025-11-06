-- 1️⃣ Monitor query performance using EXPLAIN ANALYZE
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id, 
    u.first_name, 
    u.last_name, 
    p.name AS property_name, 
    pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id
WHERE b.start_date >= '2025-01-01'
  AND pay.status = 'Completed'
ORDER BY b.start_date DESC;


-- 2️⃣ Alternative: Using SHOW PROFILE (if supported by your MySQL/MariaDB server)
SHOW PROFILE FOR QUERY 1;


-- 3️⃣ Identify and fix bottlenecks
-- Suppose EXPLAIN ANALYZE showed a full table scan on bookings (slow)
-- Add missing indexes to improve performance
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
CREATE INDEX idx_payments_status ON payments(status);


-- 4️⃣ Re-test after optimization
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id, 
    u.first_name, 
    u.last_name, 
    p.name AS property_name, 
    pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id
WHERE b.start_date >= '2025-01-01'
  AND pay.status = 'Completed'
ORDER BY b.start_date DESC;
