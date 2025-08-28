-- =========================================================
-- Phase 3: SQL Queries and Reporting
-- Title : Subqueries #1 — Movies on ≥ 10 Wishlists but Never Rented
-- Author: Anthony Ogamba
-- Purpose: Identify highly wishlisted movies that have zero rentals.
-- =========================================================
WITH wish_cte AS (
  SELECT movieid, COUNT(*) AS wish_count
  FROM wishlist
  GROUP BY movieid
  HAVING COUNT(*) >= 10
)
SELECT m.movieid, m.title, w.wish_count
FROM wish_cte w
JOIN movie m ON m.movieid = w.movieid
WHERE NOT EXISTS (
  SELECT 1 FROM rental r WHERE r.movieid = m.movieid
)
ORDER BY w.wish_count DESC, m.title;