-- Aggregation function
-- COUNT(*): group by compulsary with count all


SELECT
orderid,
COUNT(*)  OVER() AS TotalOrders
FROM salesdb.orders;


SELECT *
FROM salesdb.orders;

-- SUM()
SELECT
SUM(sales) AS Totalsales
FROM salesdb.orders;

-- SUM()
SELECT
AVG(sales) AS Avgsales
FROM salesdb.orders;

-- MAX()
SELECT
MAX(sales) AS Highestsales
FROM salesdb.orders;

-- MIN()
SELECT
MIN(sales) AS Lowesrsales
FROM salesdb.orders;

-- 
SELECT
productid,
COUNT(*) AS TotalSales
FROM salesdb.orders
GROUP BY productid;


-- SQL TASK
SELECT
productid,
SUM(sales) TotalSales
FROM salesdb.orders
GROUP BY productid;


SELECT
productid,
orderid,
orderdate,
SUM(sales) OVER(PARTITION BY productid) TotalSales
FROM salesdb.orders;


SELECT
orderid,
orderdate,
productid,
orderstatus,
sales,
SUM(sales) OVER(PARTITION BY productid, orderstatus) AS SalesbyPrAndSta
FROM salesdb.orders;

-- task 1) Rank each order based on their sales and additional provide details such as orderid and order details.
 
SELECT
orderid,
orderdate,
RANK() OVER(ORDER BY sales) Rankofsales
FROM salesdb.orders;


-- window function    
SELECT
orderid,
orderstatus,
orderdate,
sales,
SUM(sales) OVER(
           PARTITION BY orderstatus
           ORDER BY orderdate
           ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING
           ) AS totalsales
           
FROM salesdb.orders;           


-- 
SELECT
orderid,
orderstatus,
orderdate,
sales,
SUM(sales) OVER(
     PARTITION BY orderstatus
     ORDER BY orderdate
     ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
) AS TotalSales

FROM salesdb.orders;     

--
SELECT
orderid,
orderstatus,
SUM(sales) OVER(PARTITION BY orderstatus) As TotalSalesByStatus
FROM salesdb.orders;

--
SELECT *
FROM(
SELECT
orderid,
SUM(Sales) OVER(PARTITION BY orderstatus) AS TotalSales
FROM salesdb.orders
)t
WHERE TotalSales >140;


-- 2nd Rule : WINDOW FUNCTION CANNOT BE NESTED
SELECT
AVG(TotalSales) OVER() AS AvgOfCustomerSales
FROM(
SELECT
customerid,
SUM(Sales) AS TotalSales
FROM salesdb.orders
GROUP BY customerid
)t;


-- 3rd Rule: WHERE CLAUSE IS OPERATED BEFORE THE WINDOW FUNCTION
SELECT
customerid,
SUM(sales) AS TotalSales,
RANK() OVER(ORDER BY SUM(sales) DESC )
FROM salesdb.orders
GROUP BY cuStomerid;