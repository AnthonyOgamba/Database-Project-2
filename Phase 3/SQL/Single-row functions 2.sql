-- =========================================================
-- Phase 3: SQL Queries and Reporting
-- Title : Single-row functions #2 — Movie Pricing & Flags
-- Author: Anthony Ogamba
-- Purpose: Show computed price gap and readable flags.
-- =========================================================
SELECT
  movieid,
  title,
  hdrentalprice - sdrentalprice AS hd_sd_diff,
  CASE rating WHEN 'G' THEN 'General'
              WHEN 'PG' THEN 'Parental Guidance'
              ELSE rating END AS rating_label,
  CASE newrelease  WHEN 1 THEN 'Yes' ELSE 'No' END AS is_new,
  CASE mostpopular WHEN 1 THEN 'Yes' ELSE 'No' END AS is_popular,
  CASE comingsoon  WHEN 1 THEN 'Yes' ELSE 'No' END AS is_coming_soon
FROM movie
ORDER BY hd_sd_diff DESC NULLS LAST, title;