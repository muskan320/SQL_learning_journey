-- NULL FUNCTION
SELECT *
-- COUNT(*)
FROM salesdb.orders;

-- AVG
SELECT
AVG(sales) AS TotalSales
FROM salesdb.orders;

-- avg with coalesce
SELECT
AVG(COALESCE(sales,0))
FROM sales.orders;

-- 
SELECT
customerid,
AVG(score) OVER() AS avg_score
FROM salesdb.customers;

--
SELECT
customerid,
COALESCE(score,0) AS score2,
AVG(score) OVER() AS avgscore,
AVG(COALESCE(score,0))  OVER() AvgScore2
FROM salesdb.customers;

-- sql task
SELECT
CONCAT(firstname,'',
COALESCE(lastname,'')) AS fullname,
score,
COALESCE(score,0) + 10 AS BonusScore
FROM salesdb.customers;

-- handle null before sorting
SELECT
customerid,
score
FROM salesdb.customers
ORDER BY
CASE
WHEN score IS NULL THEN 1
ELSE 0
END,
SCORE ASC ;


-- NULLIF
SELECT
orderid,
sales,
quantity,
sales/NULLIF(quantity,0) AS price
FROM salesdb.orders;