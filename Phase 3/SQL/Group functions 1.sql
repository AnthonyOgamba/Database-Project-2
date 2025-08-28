-- =========================================================
-- Phase 3: SQL Queries and Reporting
-- Title : Group functions #1 — Rentals per Rating
-- Author: Anthony Ogamba
-- Purpose: Aggregate number of rentals by movie rating.
-- =========================================================
SELECT
  m.rating,
  COUNT(*) AS rental_count
FROM rental r
JOIN movie m ON m.movieid = r.movieid
GROUP BY m.rating
ORDER BY rental_count DESC, m.rating;