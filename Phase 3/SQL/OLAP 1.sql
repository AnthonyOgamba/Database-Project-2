-- =========================================================
-- Phase 3: SQL Queries and Reporting
-- Title : OLAP #1 — Customer Rental Rank (by total rentals)
-- Author: Anthony Ogamba
-- Purpose: Rank customers by how many rentals they've made.
-- =========================================================

WITH counts AS (
  SELECT customerid, COUNT(*) AS rentals
  FROM rental
  GROUP BY customerid
)
SELECT
  c.customerid,
  INITCAP(c.firstname || ' ' || c.surname) AS customer,
  counts.rentals,
  RANK() OVER (ORDER BY counts.rentals DESC) AS rental_rank
FROM counts
JOIN customer c USING (customerid)
ORDER BY rental_rank, customer;