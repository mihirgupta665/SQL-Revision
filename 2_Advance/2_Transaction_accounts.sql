Select @@autocommit;  -- by default set to 1 which means each statement in sql is a single transaction and is auto commited always.
SET autocommit = 0;  -- turning off autocommit 

CREATE DATABASE IF NOT EXISTS PRIME;
USE PRIME;

CREATE TABLE accounts (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20),
    balance DECIMAL(10,2)
);

INSERT INTO accounts (name, balance) VALUES
("Mihir Gupta", 10000000.76),
("Vaishali Verma", 200000.45),
("Divyansh Goyal", 7000.20);

Select * FROM accounts;

START TRANSACTION;  -- Transaction starts here   
UPDATE accounts SET balance = balance - 1000 where id = 1;
UPDATE accounts SET balance = balance + 1000 where id = 2;
COMMIT;		-- at last the transaction need to be commited
-- all the above transaction statement have becomes the one transaction as whole and is implemented together only.

Select *  From accounts;

-- rollback undo the uncommited changes of a transaction 

Start transaction;
UPDATE accounts SET balance = balance+100 where id=1;
commit;
UPDATE accounts SET balance = balance-100 where id=2;
rollback;  -- the above only uncommited changes are restored.

Select * FROM accounts;

Start transaction;
UPDATE accounts SET balance = balance - 1000 where id=1;
SAVEPOINT wallet_toppup_successfull;  -- creating a savepoint with a name for that point
UPDATE accounts SET balance = balance + 10 where id=1;
ROLLBACK TO wallet_toppup_successfull;	-- rollback to savepoint

commit;

Select * FROM accounts;