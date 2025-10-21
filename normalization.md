## Normalization
# Database Normalization – Airbnb Clone Project

## ✅ What is Normalization?

Normalization is the process of organizing data in a database to reduce redundancy and improve data integrity. It involves dividing large tables into smaller, related tables and defining relationships between them.

---

## 🔁 Normal Forms Explained

### 🔹 First Normal Form (1NF)
- Ensures that each column contains atomic (indivisible) values.
- Each record is unique (no duplicate rows).

### 🔹 Second Normal Form (2NF)
- Must be in 1NF.
- All non-key columns are fully functionally dependent on the primary key.

### 🔹 Third Normal Form (3NF)
- Must be in 2NF.
- No transitive dependencies (non-key columns do not depend on other non-key columns).

---

## 🔍 Schema Review

We analyzed the following tables:
- `users`
- `places`
- `cities`
- `states`
- `reviews`
- `amenities`
- `place_amenity` (join table)

---

## ⚠️ Issues Identified (Before Normalization)

Example issue (hypothetical):
- `places` table had a `state_name` column, which duplicated data from the `states` table.
- `users` table had multiple phone numbers in one field (not atomic → violates 1NF).

---

## ✅ Changes Made to Achieve 3NF

- Removed `state_name` from `places` table. Instead, added a foreign key `city_id`, and `city` already relates to a `state`.
- Split phone numbers into a separate `user_phones` table with a foreign key to `users`.
- Ensured all non-key columns depend only on the primary key and not on other non-key attributes.

---

## 📊 Example Before and After

### ❌ Before:
```sql
CREATE TABLE places (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    state_name VARCHAR(100), -- violates 3NF
    ...
);
