-- =========================================================
-- Phase 3: SQL Queries and Reporting
-- Title : Restricting & sorting #2 — Wishlist—Popular & New Releases Only
-- Author: Anthony Ogamba
-- Purpose: Wishlisted movies that are both NewRelease and MostPopular.
-- =========================================================
SELECT
  w.customerid, w.movieid, w.dateadded,
  m.title, m.newrelease, m.mostpopular
FROM wishlist w
JOIN movie m ON m.movieid = w.movieid
WHERE m.newrelease = 1
  AND m.mostpopular = 1
ORDER BY w.dateadded DESC, m.title;