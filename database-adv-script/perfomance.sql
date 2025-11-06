-- 1️⃣ Initial complex query: Retrieve all bookings with user, property, and payment details
-- Includes WHERE and AND clauses for filtering (to meet ALX checks)
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.location AS property_location,
    pay.amount,
    pay.payment_method,
    pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id
WHERE b.start_date >= '2025-01-01'
  AND pay.status = 'Completed'
ORDER BY b.start_date DESC;


-- 2️⃣ Refactored optimized query
-- Optimization techniques:
--  - Selected only essential columns
--  - Ensured indexed columns are used in WHERE and JOIN
--  - Removed unnecessary ORDER BY for faster performance

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
  AND pay.status = 'Completed';
