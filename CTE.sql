-- CTE(Common Table Expression)
WITH OrderSummary AS(
SELECT
customerid,
COUNT(*) AS totalorders
FROM salesdb.orders
GROUP BY customerid)
SELECT *
From OrderSummary;


-- STANDALONE CTE
-- STEP 1 : Calculate  total sales per customers
-- STEP 2: Join with customer table
WITH CTE_total_sales AS (
	SELECT
    customerid,
    SUM(sales) AS TotalSales
    FROM salesdb.orders
    GROUP BY customerid
    )
    
    SELECT
    c.customerid,
    c.firstname,
    c.lastname,
    cts.TotalSales
    FROM salesdb.customers AS c
    LEFT JOIN CTE_total_sales AS cts
    ON cts.customerid = c.customerid;
    
    
 -- Multiple cte
 -- step 2: last order date per customer
 WITH CTE_total_sales AS (
	SELECT
    customerid,
    SUM(sales) AS TotalSales
    FROM salesdb.orders
    GROUP BY customerid
    )
    
    SELECT
    c.customerid,
    c.firstname,
    c.lastname,
    cts.TotalSales
    FROM salesdb.customers AS c
    LEFT JOIN CTE_total_sales AS cts
    ON cts.customerid = c.customerid;
    
-- Nested cte
-- rank customer on totalsales 
WITH CTE_total_sales AS (
    SELECT 
    customerid,
    SUM(sales) AS TotalSales
    FROM salesdb.orders
    GROUP BY customerid
    ),
    -- last order calculate 
    CTE_last_order AS (
      SELECT
      customerid,
      MAX(orderdate)  AS LastOrder
      FROM salesdb.orders
      GROUP BY customerid
    ),
    -- customer rank with nested cte
    CTE_customer_rank AS (
         SELECT 
         customerid,
         TotalSales,
         RANK() OVER(ORDER BY TotalSales DESC) AS customer_rank
         FROM CTE_total_sales
    ),
    CTE_customer_segment AS (
    SELECT 
    customerid,
    CASE
       WHEN TotalSales > 100 THEN 'HIGH'
       WHEN TotalSales > 50 THEN 'Medium'
       ELSE 'LOW'
       END AS CustomerSegment
       )
    
    SELECT
    c.customerid,
    c.firstname,
    c.lastname,
    cts.TotalSales,
    clo.lastOrder,
	ccr.customer_rank
    FROM salesdb.customers AS c
    LEFT JOIN CTE_total_sales AS cts
     ON cts.customerid = c.customerid
    LEFT JOIN CTE_last_order AS clo
     ON clo.customerid = c.customerid
	LEFT JOIN CTE_customer_rank ccr
     ON c.customerid = ccr.customerid
    
    
    
    -- RECURSIVE QUERY
    WITH RECURSIVE Series AS (
    SELECT 1  AS MyNumber
    UNION ALL
    SELECT MyNumber +1     -- anchor query
    FROM Series
    WHERE MyNumber < 20
    )
    SELECT *
    FROM Series 
    
    
    -- Built an Employee Heirarchy and assign a label to each employee