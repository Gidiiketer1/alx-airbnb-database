## Requirements
- User authentication
- Property listing and search
- Booking management
- Payment processing
- Review and rating system

##### Database Schema to Meet Requirements
This database schema supports the following functional requirements of the Airbnb Clone project:

### 🔐 1. User Authentication
- Stores user data (email, name, etc.).
- Enforces unique emails for login.
- Password storage (if implemented) would be encrypted and stored securely.

**Related tables:** `users`

---

### 🏠 2. Property Listing and Search
- Hosts can create property listings with descriptions, prices, and amenities.
- Users can search properties by city, state, number of rooms, price, etc.

**Related tables:** `places`, `cities`, `states`, `amenities`, `place_amenity`

---

### 📅 3. Booking Management *(Optional depending on scope)*
> ⚠️ **Note:** If booking functionality is required, a `bookings` table should be added.

- Users can book available places for specific dates.
- Tracks check-in and check-out dates, booking status, etc.

**Suggested table:**

```sql
CREATE TABLE bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    place_id INT NOT NULL,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    status VARCHAR(50) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (place_id) REFERENCES places(id)
);
