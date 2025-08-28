-- =========================================================
-- Phase 3: SQL Queries and Reporting
-- Title : JOIN #2 — Movies with Subcategories and Directors
-- Author: Anthony Ogamba
-- Purpose: List movies, their director, and one subcategory.
-- =========================================================
SELECT
  m.movieid,
  m.title,
  d.firstname || ' ' || d.lastname AS director,
  s.subcategoryname
FROM movie m
JOIN director d           ON d.directorid = m.directorid
JOIN moviesubcategory ms  ON ms.movieid = m.movieid
JOIN subcategory s        ON s.subcategoryid = ms.subcategoryid
ORDER BY m.title, s.subcategoryname;