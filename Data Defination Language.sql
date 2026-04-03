-- DDL (Data definition language)
USE salesdb;
CREATE TABLE persons(
id INT NOT NULL,
person_name VARCHAR(50),
birth_date DATE,
phone VARCHAR(50) NOT NULL,
CONSTRAINT pk_persons PRIMARY KEY
(id)
);

-- add a new column e-mail
ALTER TABLE persons
ADD email VARCHAR(50) NOT NULL;

-- Removing column
ALTER TABLE persons
DROP COLUMN phone;

-- drop your table
DROP TABLE persons;