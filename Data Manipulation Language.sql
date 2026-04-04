-- DML
-- INSERT
USE salesdb;
INSERT INTO customers (customerid,firstname,country,score)
VALUES
(6,'muskan','uk',NULL),
(7,'aniket',NULL,100);


SELECT *
FROM customers;

INSERT INTO persons(id,persons_name,birth_date,phone)
SELECT customerid,firstname,NULL,'Unknown'
FROM customers;

UPDATE customers
SET score=0
WHERE customerid=6;

-- update multiple columns
UPDATE customers
SET score=60,
country='us'
WHERE customerid=10

-- mass update
UPDATE customers
SET score=0
WHERE customerid=6;

-- Update multiple columns
UPDATE customers
SET score=60,
country='us'
WHERE customerid=10

-- mass update
UPDATE customers
SET score=0
WHERE score IS NULL;

-- DELETE 
DELETE FROM customers
WHERE customerid>5;