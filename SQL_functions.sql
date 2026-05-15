-- SQL function
USE salesdb;

-- CONCAT()
SELECT CONCAT(firstname," ",lastname) AS full_name
FROM customers;

-- UPPER()
-- LOWER()
SELECT
firstname,
UPPER(firstname) AS first_upper,
LOWER(firstname) AS first_lower
FROM customers;

-- TRIM()
SELECT
firstname
FROM customers
WHERE firstname != TRIM(firstname);

-- LENGTH
SELECT
firstname,
LENGTH(firstname) len_name,
LENGTH(TRIM(firstname)) len_trim_name,
LENGTH(firstname)-LENGTH(TRIM(firstname)) flag
FROM customers;

-- REPLACE()
SELECT
'123-456-7890' AS phone,
REPLACE('123-456-7890','-',' ') AS clean_phone;

-- LEFT
SELECT
firstname,
LEFT(firstname,1) AS first_2_char
FROM customers;

SELECT
firstname,
RIGHT(firstname,1) AS first_2_char
FROM customers;

-- SUBSTRING
SELECT
firstname,
SUBSTRING(TRIM(firstname),2,LENGTH(firstname)) AS sub_name   -- length count hogi trimming ke baad
FROM customers;

-- ROUND()
SELECT
3.516,
ROUND(3.516,2) AS round_2,
ROUND(3.516,1) AS round_1,
ROUND(3.516,0) AS round_0;

-- ABSOLUTE 
SELECT
-10,
ABS(-10) AS abs_10;          