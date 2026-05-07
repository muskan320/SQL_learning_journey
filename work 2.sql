-- Write a SQL statement fro implementing ALTER,UPDATE AND DELETE


-- Alter the table student
ALTER TABLE Students
ADD BloodGroup VARCHAR(5);

-- show the table student
SELECT *
FROM Students;

-- update the phone in table faculty
ALTER TABLE Faculty
MODIFY Phone VARCHAR(20);
-- show the table faculty
SELECT *
FROM Faculty;