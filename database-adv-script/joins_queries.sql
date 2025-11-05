-- 1️⃣ INNER JOIN: Retrieve all bookings and the respective users who made those bookings
SELECT 
    bookings.id AS booking_id,
    users.id AS user_id,
    users.first_name,
    users.last_name,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date
FROM bookings
INNER JOIN users
ON bookings.user_id = users.id
ORDER BY bookings.id;

-- 2️⃣ LEFT JOIN: Retrieve all properties and their reviews (include properties with no reviews)
SELECT 
    properties.id AS property_id,
    properties.name AS property_name,
    reviews.id AS review_id,
    reviews.rating,
    reviews.comment
FROM properties
LEFT JOIN reviews
ON properties.id = reviews.property_id
ORDER BY properties.id;

-- 3️⃣ FULL OUTER JOIN: Retrieve all users and all bookings (even if unmatched)
-- Note: Some SQL engines (like MySQL) do not support FULL OUTER JOIN directly.
-- If using MySQL, use UNION of LEFT and RIGHT joins as below:

SELECT 
    users.id AS user_id,
    users.first_name,
    users.last_name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date
FROM users
LEFT JOIN bookings
ON users.id = bookings.user_id

UNION

SELECT 
    users.id AS user_id,
    users.first_name,
    users.last_name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date
FROM users
RIGHT JOIN bookings
ON users.id = bookings.user_id
ORDER BY user_id;
