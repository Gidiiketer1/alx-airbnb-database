# ⚡ Query Optimization Report — Airbnb Database

## 🎯 Objective
The goal of this task is to identify inefficiencies in a complex SQL query and refactor it to improve performance and reduce execution time.

---

## 🧩 1️⃣ Initial Query
The original query retrieved data from four tables — **bookings**, **users**, **properties**, and **payments** — using multiple JOINs.

```sql
SELECT 
    b.id, b.start_date, b.end_date,
    u.first_name, u.last_name, u.email,
    p.name, p.location,
    pay.amount, pay.payment_method, pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id
ORDER BY b.start_date DESC;
