SET OPERATOR
-- Rule 1.
SELECT 
o.firstname
FROM customers o
UNION 
SELECT 
e.firstname
FROM employees e
ORDER BY firstname;

-- UNION 
SELECT
o.firstname,
o.lastname
FROM customers o
UNION 
SELECT 
e.firstname,
e.lastname
FROM employees e
ORDER BY firstname;

-- UNION ALL
SELECT
o.firstname,
o.lastname
FROM customers o
UNION ALL
SELECT 
e.firstname,
e.lastname
FROM employees e
ORDER BY firstname;

-- EXCEPT operator
SELECT
e.firstname,
e.lastname
FROM employees e
EXCEPT
SELECT 
o.firstname,
o.lastname
FROM customers o;

-- INTERSECT
SELECT
e.firstname,
e.lastname
FROM employees e
INTERSECT
SELECT 
o.firstname,
o.lastname
FROM customers o;

-- Q1. Create a list of top 3 people from the DB. This includes the customers with a score higher than 500 and 
-- employees with a salary higher than 60,000. Sort them by name and only show the first 3.

SELECT firstname, lastname
FROM customers
WHERE score > 500
UNION
SELECT firstname, lastname
FROM employees
WHERE salary > 60000
ORDER BY firstname
LIMIT 3;

-- Q2. Your boss wants a unique list of all productids that have ever been handled (present in orders or orders_archive .You 
-- noticed the archive has many duplicate entries for the same product.
SELECT 
productid
FROM orders
UNION
SELECT productid
FROM orders_archive;


-- Q3. Find customers from India who have not placed any orders in the current orders table.
SELECT
c.customerid,
c.firstname,
c.country
FROM



-- Q4. Find salespersonids who managed to sell more than 2 items in a single order in the current orders table AND  are also
-- listed in the order_archive.
SELECT DISTINCT
o.salespersonid
FROM orders o 
INNER JOIN orders_archive oa
ON o.salespersonid = oa.salespersonid
WHERE o.quantity > 2; customers c
LEFT JOIN orders o
ON c.customerid = o.customerid
WHERE c.country = 'India' AND o.customerid IS NULL;