SELECT User, Host FROM mysql.user;

--creation of the first user 
CREATE USER 'elbouhtouri'@'localhost' IDENTIFIED BY 'elbouhtouri123';
SHOW GRANTS FOR elbouhtouri@localhost;
REVOKE ALL PRIVILEGES ON *.* FROM 'elbouhtouri'@'localhost'; 
SHOW GRANTS FOR elbouhtouri@localhost;
GRANT INSERT, UPDATE, DELETE, SELECT on invoicedb.* TO 'elbouhtouri'@'localhost';
SELECT CURRENT_USER();
--root@localhost

--Change the user to 'elbouhtouri'@'localhost' to check his privileges
SELECT CURRENT_USER();
select count(*) from invoicedb.facture;

--Create is denied to user 'elbouhtouri'@'localhost' 
CREATE TABLE employee(
    id INT PRIMARY KEY, 
    first_name VARCHAR(50),
    last_name VARCHAR(50), 
    email VARCHAR(100), 
    phone_number VARCHAR(20), 
    address VARCHAR(100) 
);

-- Creation of the second user
CREATE USER 'employee'@'localhost' IDENTIFIED BY 'employee123';
SELECT User, Host FROM mysql.user; 
REVOKE ALL PRIVILEGES ON *.* FROM 'employee'@'localhost'; 
GRANT SELECT on invoicedb.* TO 'employee'@'localhost';
SHOW GRANTS FOR employee@localhost;

--Change the user to 'elbouhtouri'@'localhost' to check his privileges
SELECT CURRENT_USER();
select count(*) from invoicedb.commande;

--Create is denied to user 'emloyee'@'localhost' 
CREATE TABLE employee(
    id INT PRIMARY KEY, 
    first_name VARCHAR(50),
    last_name VARCHAR(50), 
    email VARCHAR(100), 
    phone_number VARCHAR(20), 
    address VARCHAR(100) 
);
