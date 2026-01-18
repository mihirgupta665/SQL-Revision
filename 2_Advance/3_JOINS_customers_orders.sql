use PRIME;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO customers VALUES
(1, 'Alice', 'Mumbai'),
(2, 'Bob', 'Delhi'),
(3, 'Charlie', 'Bangalore'),
(4, 'David', 'Mumbai');

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount INT
);

INSERT INTO orders VALUES
(101, 1, 500),
(102, 1, 900),
(103, 2, 300),
(104, 5, 700);

SELECT * FROM customers c INNER JOIN orders o ON c.customer_id = o.customer_id;   -- highest number of columnn in either of the table length is preserved
SELECT o.order_id, c.customer_id, c.name FROM customers c INNER JOIN orders o ON c.customer_id = o.customer_id;   -- highest number of columnn in either of the table length is preserved

-- LEFT JOIN table A all rows are preserved and mathcing values of table B are showns else null is given
SELECT * FROM customers c LEFT JOIN orders o ON  c.customer_id = o.customer_id;

-- RIGHT JOIN table B all rows are preserved ad matching values of table A are shown else null is given.
SELECT * FROM customers c RIGHT JOIN orders o ON c.customer_id = o.customer_id;

-- Outer Join  : Union is done of right join and left join to get the outer join with unique values 
Select * FROM customers c RIGHT JOIN orders o On c.customer_id = o.customer_id UNION SELECT * FROM customers c LEFT JOIN orders o On c.customer_id=o.customer_id;

-- Cross Join : each row of each table is attached with each row of the other table.
Select * FROM customers CROSS JOIN orders;

-- Self Join : table is joined to itself on basic of a common column 
Select * FROM Customers as A JOIN Customers as B on A.customer_id = B.customer_id;

-- LEFT EXCLUSIVE JOIN : first do left join and apply where on those row whose right coulmn IS NULL
Select * FROM customers c LEFT JOIN orders o ON c.customer_id=o.customer_id where o.customer_id IS null;

-- RIGHT EXCLUSIVE JOIN : first do right join then conditionly select only those row whose left column is null
SELECT * FROM customers c RIGHT JOIN orders o ON c.customer_id=o.customer_id WHERE c.customer_id IS NULL;