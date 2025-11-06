# Database Performance Monitoring and Refinement

## Objective
To monitor and improve database performance by analyzing query execution plans and implementing optimizations.

---

## Step 1: Performance Monitoring
Used the following tools:
- **EXPLAIN ANALYZE** to study query execution steps and time.
- **SHOW PROFILE** to identify CPU, I/O, and execution time for each stage.

**Initial Findings:**
- The query on bookings with `start_date >= '2025-01-01'` and `pay.status = 'Completed'` was slow due to:
  - Full table scan on the `bookings` table.
  - No index on `payments.status`.

---

## Step 2: Optimization Steps
### Schema Adjustments
Added indexes:
```sql
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
CREATE INDEX idx_payments_status ON payments(status);
