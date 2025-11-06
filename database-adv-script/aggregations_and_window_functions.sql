-- 1️⃣ Find total number of bookings made by each user
SELECT 
    u.id AS user_id,
    u.first_name,
    u.last_name,
    COUNT(b.id) AS total_bookings
FROM users u
LEFT JOIN bookings b
ON u.id = b.user_id
GROUP BY u.id, u.first_name, u.last_name
ORDER BY total_bookings DESC;

-- 2️⃣ Rank properties based on total bookings using RANK()
SELECT 
    p.id AS property_id,
    p.name AS property_name,
    COUNT(b.id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.id) DESC) AS rank_position
FROM properties p
LEFT JOIN bookings b
ON p.id = b.property_id
GROUP BY p.id, p.name
ORDER BY rank_position;

-- 3️⃣ Assign row numbers to properties using ROW_NUMBER()
SELECT 
    p.id AS property_id,
    p.name AS property_name,
    COUNT(b.id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.id) DESC) AS row_number
FROM properties p
LEFT JOIN bookings b
ON p.id = b.property_id
GROUP BY p.id, p.name
ORDER BY row_number;
