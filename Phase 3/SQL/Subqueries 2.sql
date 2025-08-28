-- =========================================================
-- Phase 3: SQL Queries and Reporting
-- Title : Subqueries #2 — Last Rental per Customer (scalar subquery)
-- Author: Anthony Ogamba
-- Purpose: To generate a report showing each customer and the most 
-- recent date they rented a movie.
-- =========================================================
SELECT 
  c.customerid,
  c.firstname || ' ' || c.surname AS customer,
  /* scalar subquery returns one value per row */
  (SELECT MAX(r2.rentaldate)
   FROM rental r2
   WHERE r2.customerid = c.customerid) AS last_rental
FROM customer c
ORDER BY last_rental DESC NULLS LAST, customer
LIMIT 2;