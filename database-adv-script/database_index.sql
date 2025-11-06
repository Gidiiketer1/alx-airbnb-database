-- 1️⃣ Create index on Users table (frequently used in WHERE and JOIN clauses)
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_id ON users(id);

-- 2️⃣ Create index on Bookings table (used in JOINs and WHERE filters)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- 3️⃣ Create index on Properties table (used in JOIN and ORDER BY)
CREATE INDEX idx_properties_id ON properties(id);
CREATE INDEX idx_properties_name ON properties(name);

-- 4️⃣ Test performance before and after indexing
-- Before adding indexes
EXPLAIN SELECT * FROM bookings WHERE user_id = 5;

-- After adding indexes
EXPLAIN SELECT * FROM bookings WHERE user_id = 5;
