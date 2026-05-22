USE salesdb;

-- Date Time function
-- DAY() , MONTH() , YEAR()

SELECT
DAY('2026-02-04') AS date_part,
MONTH('2026-02-04') AS month_part,
YEAR('2026-02-04') AS year_part;

-- Use column


-- WHERE CLAUSE
SELECT *
FROM salesdb.orders
WHERE YEAR(orderdate) = 2025;


-- CURRENT DATE
SELECT
DAY(CURDATE()),
MONTH(CURDATE()),
YEAR(CURDATE());

-- QUATER
SELECT
QUARTER('2026-12-04');

-- WEEK
SELECT
WEEK('2026-12-04');

-- MONTHNAME
SELECT
MONTHNAME('2026-02-04');

-- DAYNAME
SELECT
DAYNAME('2026-02-04');

 -- DAYOFYEAR
 SELECT
DAYOFYEAR('2026-02-04');

-- DAYOFWEEK
SELECT
DAYOFWEEK('2026-02-04');

-- Q1. How many orders were placed per year..
SELECT 
YEAR(orderdate) AS OrderYear,
COUNT(*) AS NrOfOrders
FROM salesdb.orders
GROUP BY YEAR(orderdate);

-- Q2. How many orders were placed per month..
SELECT
MONTH(ORDERDATE) AS OrderMonth,
COUNT(*) AS NrOfOrders
FROM salesdb.orders
GROUP BY MONTH(ORDERDATE);

-- Q3. How many orders were placed per month name..
SELECT
MONTHNAME(ORDERDATE) AS OrderMonthName,
COUNT(*) AS NrOfOrders
FROM salesdb.orders
GROUP BY MONTHNAME(ORDERDATE);

-- Q4.  Show all orders that were placed during the month of February..
SELECT *
FROM salesdb.orders
WHERE MONTH(orderdate) = 2;

-- DATE_FORMAT
SELECT
orderid,
creationtime,
DATE_FORMAT(creationtime,'%d') AS creation_day
FROM salesdb.orders;

-- %a
SELECT
orderid,
creationtime,
DATE_FORMAT(creationtime,'%a') AS abb_day
FROM salesdb.orders;

-- %W
SELECT
orderid,
creationtime,
DATE_FORMAT(creationtime,'%W') AS full_day
FROM salesdb.orders;

-- date format month
SELECT
orderid,
creationtime,
DATE_FORMAT(creationtime,'%m') AS creation_month,
DATE_FORMAT(creationtime,'%b') AS abb_month,
DATE_FORMAT(creationtime,'%M') AS full_month
FROM salesdb.orders;
 
 -- Indian format
 SELECT
 orderid,
 creationtime,
 DATE_FORMAT(creationtime,"%d-%m-%Y") AS ind_std
 FROM salesdb.orders;
 
 -- SQL task
  -- Show the creation time using following format "day monday JAN Q1 2026 12:39:23 PM"
  SELECT
  orderid,
  creationtime,
  CONCAT(
  'DAY ',
  DATE_FORMAT(creationtime,"%a %b"),
  ' Q',QUARTER(creationtime)," ",
  DATE_FORMAT(creationtime,"%Y" " %h:" "%i:" "%s" " %p")
  ) AS custom_format
  FROM salesdb.orders;
  
  -- aggregation
  SELECT
  orderid,
  creationtime,
  CONCAT(
  'DAY ',
  DATE_FORMAT(creationtime,"%a %b"),
  ' Q',QUARTER(creationtime)," ",
  DATE_FORMAT(creationtime,"%y" " %h:" "%i:" "%s" " %p")
  ) AS custom_format
  FROM salesdb.orders;
  
  
 -- CONVERT
 SELECT
 CONVERT('123',SIGNED) AS string_to_int_conv,
CONVERT(creationtime,DATE) 
  FROM salesdb.orders;
 
 -- CAST
SELECT
CAST('123'AS SIGNED) AS string_to_int_conv,
CONVERT(creationtime,DATE) 
  FROM salesdb.orders;
 
 -- VALIDATION STR_TO_DATE
 SELECT
   CASE
   WHEN 
 STR_TO_DATE('2026-02-30','%Y-%m-%d') IS NULL
   THEN 'INVALID'
   ELSE 'VALID DATE'
  END AS DateStatus; 
 
 -- TIMESTAMPDIFF
 SELECT 
 TIMESTAMPDIFF(YEAR,'2002-06-08','2026-02-10');
 
 -- RANDOM QUERY
 SELECT
 employeeid,
 birthdate,
 TIMESTAMPDIFF(YEAR,birthdate,CURDATE()) AS age
 FROM salesdb.employees;
 
-- INTERVIEW QUESTION -- LAG() FUNCTION: Returns the value from the previous one. It does not collapse the data
-- lag is applied on the ordered column

-- Find the gap between days in consecutive orders based on order date

SELECT
orderid,
orderdate AS current0_date,
LAG(orderdate) OVER(ORDER BY orderdate) AS previous_0date,
DATEDIFF(orderdate,LAG(orderdate) OVER(ORDER BY orderdate) ) AS number_of_days
FROM salesdb.orders;


 
  