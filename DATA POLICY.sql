WITH orders AS(
SELECT 1 AS ID, 'A' AS category UNION
SELECT 2,NULL UNION
SELECT 3,'' UNION
SELECT 4,''
)
SELECT *
FROM orders;


WITH orders as (
SELECT 1 AS ID,'A' AS category UNION
SELECT 2,NULL UNION
SELECT 3,'' UNION
SELECT 4,' '
)
SELECT
*,
CHAR_LENGTH(category) AS lencategory
FROM orders;

-- Ist data policy
WITH orders as (
SELECT 1 AS ID,'A' AS category UNION
SELECT 2,NULL UNION
SELECT 3,'' UNION
SELECT 4,' '
)
SELECT
*,
TRIM(category) AS lencategory
FROM orders;
 
--
WITH orders AS(
SELECT 1 AS ID,'A' AS category UNION
SELECT 2,NULL UNION
SELECT 3,'' UNION
SELECT 4,' '
)
SELECT
*,
TRIM(category) AS policy1,
CHAR_LENGTH(TRIM(category)) AS cate_len
FROM orders;


-- 2nd data policy
WITH orders AS(
SELECT 1 AS ID,'A' AS category UNION
SELECT 2,NULL UNION
SELECT 3,'' UNION
SELECT 4,' '
)
SELECT
*,
TRIM(category) AS policy1,
NULLIF(TRIM(category) "") AS POLICY2,
CHAR_LENGTH(TRIM(category)) AS cate_len
FROM orders;

-- 3rd policy
--
WITH orders AS(
SELECT 1 AS ID,'A' AS category UNION
SELECT 2,NULL UNION
SELECT 3,'' UNION
SELECT 4,' '
)
SELECT
*,
TRIM(category) AS policy1,
NULLIF(TRIM(category) "") AS POLICY2,
CHAR_LENGTH(TRIM(category)) AS cate_len,
COALESCE(NULLIF(TRIM(category),""),'Unknown') AS policy3
FROM orders;



 
