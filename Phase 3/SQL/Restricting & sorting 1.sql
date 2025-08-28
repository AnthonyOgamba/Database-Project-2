-- =========================================================
-- Phase 3: SQL Queries and Reporting
-- Title : Restricting & sorting #1 — Customers with Low IDs
-- Author: Anthony Ogamba
-- Purpose: Show the first 20 customers with small IDs, sorted alphabetically.
-- =========================================================
SELECT 
    customerid,
    firstname || ' ' || surname AS fullname,
    email
FROM customer
WHERE customerid < 50               -- restriction
ORDER BY surname ASC, firstname ASC -- sorting
LIMIT 20;