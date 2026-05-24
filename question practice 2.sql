-- AVG()
-- Find the average sales fro each product,while keeping order level
SELECT
  o.orderid,
  o.productid,
  o.sales,
  AVG(O.sales) Over(PARTITION BY Productid) AS Avg_sales_perproduct
  FROM salesdb.orders AS o;
  
-- NULL HANDLING
-- how to find null values or handle null values
SELECT
  o.orderid,
  o.productid,
  o.sales,
  AVG(COALESCE(o.sales) )OVER(PARTITION BY o.productid) as avg_sales_product
  FROM salesdb.orders AS o ;
  
-- Find the overall average sales
SELECT
o.orderid,
o.orderdate,
o.sales,
AVG(o.sales) OVER() avg_overallSales
FROM salesdb.orders o;

-- Find the average customer score, showing customer details
SELECT
c.firstname,
c.score,
AVG(c.score) OVER() AS avg_customer_score
FROM salesdb.customers as c;

-- 
SELECT*
FROM (
SELECT
o.orderid,
o.productid,
o.sales,
AVG(o.sales) OVER() AS avg_sales
FROM salesdb.orders as o
) AS sub
WHERE sales> avg_sales;

-- Find the maximum and minimum sales fro each product
SELECT
o.orderid,
o.productid,
o.sales,
MAX(o.sales) OVER (PARTITION BY o.productid) as max_sales,
MIN(o.sales) OVER (PARTITION BY o.productid) as min_sales
FROM salesdb.orders as o;

-- measure how far eachs ales is from minimum and maximum
SELECT
o.orderid,
o.sales,
o.sales- MIN(o.sales) OVER() AS deviation_from_min,
 MAX(o.sales)OVER()-o.sales AS deviation_from_max
 FROM salesdb.orders AS o;


-- RUNNING TOTAL
SELECT
  o.sales,
  SUM(o.sales) OVER(
  ORDER BY o.sales 
  ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  )AS running_total
  FROM salesdb.orders as o;
  
-- ROLLING TOTAL
SELECT
  o.sales,
  SUM(o.sales) OVER(
  ORDER BY o.sales 
  ROWS BETWEEN 1 PRECEDING AND CURRENT ROW
  )AS rolling_total_1
  FROM salesdb.orders as o;

-- RUNNING AVERAGE
SELECT
  o.sales,
  AVG(o.sales) OVER(
  ORDER BY o.sales 
  ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  )AS running_average
  FROM salesdb.orders as o;
  
  -- ROLLING AVERAGE
  SELECT
  o.sales,
  AVG(o.sales) OVER(
  ORDER BY o.sales 
  ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  )AS running_avg_3
  FROM salesdb.orders as o;
  
