-- mysql -u root -p      : is used to connect with my sql
-- then first use the database
-- source schema(file_name).sql is used to run the schema file
-- source schema.sql   -> need to be writen in cli to run this sql file   



CREATE TABLE user(
    id VARCHAR(100) PRIMARY KEY,
    username VARCHAR(30) UNIQUE NOT NULL,
    email VARCHAR(50) UNIQUE,
    password VARCHAR(50) NOT NULL
);