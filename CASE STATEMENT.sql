USE salesdb;

--
SELECT
orderid,
sales,
CASE
    WHEN sales>50 THEN 'HIGH'
    WHEN SALES>20 THEN 'MEDIUM'
    ELSE 'LOW'
END category
FROM salesdb.orders;


-- 
SELECT
employeeid,
firstname,
lastname,
gender,
CASE
   WHEN gender ='F' THEN 'FEMALE'
   WHEN gender ='F' THEN 'MALE'
   ELSE 'Unknown'
END gengerfulltext
FROM salesdb.employees;

--
SELECT
customerid,
firstname,
lastname,
country,
CASE
   WHEN country ='Germany' THEN 'DE'
   WHEN country ='India' THEN 'IND'
   ELSE 'Unknown'
END abb_country
FROM salesdb.customers;

-- handling nulls using case statement
SELECT
customerid,
firstname,
lastname,
score,
CASE
   WHEN score IS NULL THEN 0
   ELSE score
END AS cleanscore
FROM salesdb.customers;

-- 
SELECT
customerid,
firstname,
lastname,
score,
CASE
   WHEN score IS NULL THEN 0
   ELSE score
END AS cleanscore,
AVG(
   CASE
      WHEN score IS NULL THEN 0
      ELSE score
    END
) OVER() AvgCustomerClean,
AVG(score) OVER() AS AvgCustomer
FROM salesdb.customers;
    
    
    

  -- CONDITIONAL AGGREGATION  :aggregation  only favours that meet the specific condition
-- It is important for key performance indictor (KPI)

-- TASK 1) Count how many order each customer made with sales greater than 30

SELECT 
customerid,
SUM(
CASE
   WHEN sales > 30 THEN 1
   ELSE 0
END
) AS totalOrdersHighSales,
COUNT(*) AS totalorders
FROM salesdb.orders
GROUP BY customerid;


