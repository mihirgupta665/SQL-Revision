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

-- Sub Queries (use where): in which the the inner queries generates a data for outer queries
SELECT * FROM orders WHERE amount > (
	Select AVG(amount) FROM orders
);

-- Sub Queries (use Select) : this is used to create a new column based on some operation on a table.
SELECT name, (
	SELECT count(customer_id) FROM orders o where o.customer_id = c.customer_id
) AS order_count FROM  customers c;

-- Sub Queries (use in FROM) :  to make a new data using group by and then perform set of operations
Select summary.customer_id, summary.AVG_Amount FROM ( 
Select customer_id, AVG(amount) AS AVG_Amount FROM orders o Group By customer_id
) as summary;

-- CREATE VIEW : is a sub vitual table of a original table on which almost all the operation could be executed
CREATE VIEW view1 AS SELECT customer_id, amount FROM orders;
SELECT * FROM view1;

DROP View view1;

-- Creating view from inner join (a table(or view) could only be made with unique columns)
CREATE View view1 as SELECT c.customer_id, c.name, o.order_id, o.amount FROM customers c INNER JOIN orders o ON c.customer_id=o.customer_id;
SELECT * FROM view1;