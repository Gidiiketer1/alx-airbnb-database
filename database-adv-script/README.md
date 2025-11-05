# 🧾 Complex SQL Joins — Airbnb Database

## 🎯 Goal
The goal of this task is to **practice writing complex SQL queries** using different types of joins.  
Joins help connect related data stored in multiple tables — for example, linking users with their bookings or properties with their reviews.

This is part of the **ALX Back-End Specialization** under the **Database Advanced Script** project.

---

## 📘 Understanding Joins
In a relational database, data is stored in separate tables, and we use **JOINs** to bring them together.

- **INNER JOIN** → shows only matching data between tables  
- **LEFT JOIN** → shows all data from the left table, even if there’s no match  
- **FULL OUTER JOIN** → shows everything from both sides, matched or not  

---

## 🧩 1️⃣ INNER JOIN
Retrieve all **bookings** along with the **users** who made them.

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


📝 Explanation:

INNER JOIN returns only rows where bookings.user_id matches a user in the users table.

Bookings without a valid user will not appear in the result.

💡 Example Output:

booking_id	user_name	property_id	start_date	end_date
1	Gideon	12	2025-11-01	2025-11-04
🧩 2️⃣ LEFT JOIN

Retrieve all properties and their reviews, including properties that have no reviews.

SELECT 
    properties.id AS property_id,
    properties.name AS property_name,
    reviews.id AS review_id,
    reviews.rating,
    reviews.comment
FROM properties
LEFT JOIN reviews
ON properties.id = reviews.property_id;


📝 Explanation:

LEFT JOIN keeps all properties, even if they don’t have reviews.

Review columns will show NULL for properties without reviews.

💡 Example Output:

property_id	property_name	review_id	rating	comment
1	Seaside Villa	4	5	"Amazing stay!"
2	Hilltop Cabin	NULL	NULL	NULL
🧩 3️⃣ FULL OUTER JOIN

Retrieve all users and bookings, even if they’re not linked.

⚠️ MySQL doesn’t support FULL OUTER JOIN directly.
We simulate it using UNION of LEFT JOIN and RIGHT JOIN.

SELECT 
    users.id AS user_id,
    users.first_name,
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
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date
FROM users
RIGHT JOIN bookings
ON users.id = bookings.user_id;


📝 Explanation:

Combines results from both LEFT and RIGHT joins.

Returns all users, all bookings, and fills missing data with NULL.

💡 Example Output:

user_id	first_name	booking_id	property_id	start_date
1	Gideon	2	15	2025-11-02
3	Faith	NULL	NULL	NULL
🧠 What I Learned

How to use different JOINs to connect tables effectively.

How INNER, LEFT, and FULL OUTER joins affect results.

How to handle databases like MySQL that don’t support full joins directly.

The power of UNION for combining query results.
