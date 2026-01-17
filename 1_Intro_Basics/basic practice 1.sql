CREATE DATABASE IF NOT EXISTS college;
USE college;

CREATE TABLE IF NOT EXISTS teachers(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    subject VARCHAR(50),
    salary INT
);

INSERT INTO teachers (id, name, subject, salary) VALUES
(1, "Mihir Gupta", "Computer Science", 1000000),
(4, "Vaishali Verma", "Biology", 700000),
(7, "Divyansh Goyal", "Soft Skills", 500000),
(12, "Harsh vaishya", "Electrical", 800000);

Select * FROM teachers;
Select * FROM teachers where salary > 700000;

ALTER TABLE teachers CHANGE salary ctc INT;  -- whenever we change schema of table we write ALTER command 
Select * FROM teachers;

SET SQL_SAFE_UPDATES = 0;
UPDATE teachers SET ctc = ctc + ctc*0.25;  --  whenever we need to update a value we use CHANGE+SET command
Select * FROM teachers;

ALTER table teachers ADD Column city varchar(50) DEFAULT "Lucknow";  -- whenever column need to be add or drop we use ALTER+ADD COLUMN or ALTER+DROP COLUMN 
Select * FROM teachers