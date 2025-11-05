# Complex SQL Joins — Airbnb Database

## 🎯 Objective
This task focuses on mastering different types of SQL joins by writing complex queries that combine data from multiple tables.

---

## 🧩 Task Overview

### 1️⃣ INNER JOIN — Bookings and Users
Retrieve all bookings along with the details of the users who made them.

```sql
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
ON bookings.user_id = users.id;

