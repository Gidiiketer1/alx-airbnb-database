# ⚙️ Index Optimization — Airbnb Database

## 🎯 Objective
The goal of this task is to identify frequently queried columns and create **indexes** to improve query performance in the database.

---

## 🧩 1️⃣ Identified High-Usage Columns

| Table       | Column(s) Used Frequently              | Reason (WHERE / JOIN / ORDER BY)     |
|--------------|----------------------------------------|--------------------------------------|
| users        | `id`, `email`                         | Used in JOIN with bookings and authentication |
| bookings     | `user_id`, `property_id`, `start_date` | Used in JOINs and filtering bookings |
| properties   | `id`, `name`                           | Used in JOINs and search operations  |

---

## ⚙️ 2️⃣ Created Indexes
```sql
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_id ON users(id);

CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

CREATE INDEX idx_properties_id ON properties(id);
CREATE INDEX idx_properties_name ON properties(name);
