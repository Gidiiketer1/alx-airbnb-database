-- Users
INSERT INTO users (email, name) VALUES
('alice@example.com', 'Alice Johnson'),
('bob@example.com', 'Bob Smith');

-- States
INSERT INTO states (name) VALUES
('California'),
('New York');

-- Cities
INSERT INTO cities (name, state_id) VALUES
('San Francisco', 1),
('Los Angeles', 1),
('New York City', 2);

-- Places
INSERT INTO places (user_id, city_id, name, description, number_rooms, number_bathrooms, price_per_night) VALUES
(1, 1, 'Downtown Loft', 'Cozy loft in the heart of SF', 1, 1, 120.00),
(2, 3, 'Manhattan Studio', 'Small studio near Central Park', 1, 1, 150.00);

-- Amenities
INSERT INTO amenities (name) VALUES
('WiFi'),
('Air Conditioning'),
('Kitchen');

-- Place-Amenity (many-to-many)
INSERT INTO place_amenity (place_id, amenity_id) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 3);

-- Reviews
INSERT INTO reviews (user_id, place_id, review_text) VALUES
(2, 1, 'Great location and clean space!'),
(1, 2, 'Very convenient and well-equipped.');
