-- =========================================================
-- Phase 3: SQL Queries and Reporting
-- Title : JOIN #1 — Top Recent Rentals with Customer & Movie
-- Author: Anthony Ogamba
-- Purpose: Show 25 most recent rentals with customer name, 
-- movie title, and price.
-- =========================================================
SELECT
  r.rentalid,
  c.firstname || ' ' || c.surname AS customer,
  m.title,
  r.rentaldate,
  r.startviewingdate,
  r.expirydate,
  r.rentalamount
FROM rental r
JOIN customer c ON c.customerid = r.customerid
JOIN movie    m ON m.movieid    = r.movieid
ORDER BY r.rentaldate DESC
LIMIT 25;