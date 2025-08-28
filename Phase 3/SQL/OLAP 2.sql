-- =========================================================
-- Phase 3: SQL Queries and Reporting
-- Title : OLAP #2 — Movie Popularity with Running Total
-- Author: Anthony Ogamba
-- Purpose: Show rentals per movie and cumulative total across all movies.
-- =========================================================

WITH per_movie AS (
  SELECT m.movieid, m.title, COUNT(r.rentalid) AS rentals
  FROM movie m
  LEFT JOIN rental r ON r.movieid = m.movieid
  GROUP BY m.movieid, m.title
)
SELECT
  movieid,
  title,
  rentals,
  SUM(rentals) OVER (ORDER BY rentals DESC, title) AS running_total
FROM per_movie
ORDER BY rentals DESC, title
LIMIT 100;