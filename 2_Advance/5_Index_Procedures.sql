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

-- INDEX : is created for fast retrival of data from large databases but the updation becomes slow due to indexing
CREATE INDEX idx_branch ON customers(name); -- CREATE INDEX name ON table(column)
SHOW INDEX FROM customers;  -- SHOW : is used to view the index, primary key is the default index for the table

-- composite index could be made by combination of column but they should be unique
CREATE INDEX idx2 ON customers(name, city);
SHOW INDEX FROM customers;
DROP INDEX idx2 ON customers;

SELECT * FROM orders;

-- changes the ending symbol
DELIMITER $$  

CREATE PROCEDURE check_amount(IN acc_id INT, OUT amt DECIMAL(10,2))  -- IN is used to take the input paramter_name and its type, OUT to return output then name then type
BEGIN
	SELECT amount INTO amt FROM orders WHERE customer_id=acc_id;
END $$

DELIMITER ;

CALL check_amount(2, @balance ); -- whenever output need to be returned you need to pass the ouput variable too
SELECT @balance;

DROP PROCEDURE IF EXISTS check_amount;
