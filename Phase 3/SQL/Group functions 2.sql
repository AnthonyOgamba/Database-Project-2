-- =========================================================
-- Phase 3: SQL Queries and Reporting
-- Title : Group functions #2 — Rentals per Customer
-- Author: Anthony Ogamba
-- Purpose: Show how many movies each customer has rented.
-- =========================================================

SELECT 
    c.customerid,
    c.firstname || ' ' || c.surname AS fullname,
    COUNT(r.rentalid) AS total_rentals
FROM customer c
LEFT JOIN rental r ON c.customerid = r.customerid
GROUP BY c.customerid, c.firstname, c.surname
ORDER BY total_rentals DESC
LIMIT 20;