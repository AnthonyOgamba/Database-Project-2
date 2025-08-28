-- =========================================================
-- Phase 3: SQL Queries and Reporting
-- Title : Single-row functions #1 — Normalized Customer Contact
-- Author: Anthony Ogamba
-- Purpose: Show email lowercased, phone sans dots, and masked CC.
-- =========================================================
SELECT
  customerid,
  INITCAP(firstname) AS first_name,
  INITCAP(surname)   AS last_name,
  LOWER(email)       AS email_norm,
  REPLACE(phonenumber, '.', '') AS phone_digits,
  CASE WHEN defaultcreditcardnum IS NOT NULL
       THEN 'XXXX-XXXX-XXXX-' || RIGHT(defaultcreditcardnum, 4)
       ELSE 'N/A' END AS masked_default_cc
FROM customer
ORDER BY 1;