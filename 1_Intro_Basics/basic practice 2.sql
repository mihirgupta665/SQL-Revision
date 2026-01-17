USE college;

CREATE TABLE students (
	rollnum INT PRIMARY KEY,
    name varchar(50),
    city varchar(50),
    marks INT
);

INSERT INTO students (rollnum, name, city, marks) VALUES 
(101, "Mihir Gupta", "Lucknow", 98),
(104, "Vaishali Verma", "Akbarpur", 96),
(107, "Divyansh Goyal", "Saharanpur", 92),
(109, "Harsh Vaishya", "RaiBarelly", 91);

SELECT * FROM students;

SELECT city FROM students GROUP BY city;

SELECT city, avg(marks) FROM students GROUP BY city;  -- agregate function is written as column and could be clubed with group by 

SELECT avg(marks) FROM students;

ALTER TABLE students ADD column grade VARCHAR(2);

UPDATE students SET grade = "O" where marks>95;

UPDATE students SET grade = "A" where marks between 92 AND 94;

UPDATE students SET grade = "B" where marks between 90 AND 91;

SELECT * FROM students