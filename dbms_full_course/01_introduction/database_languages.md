# Introduction


A database is a collection of interrelated data that helps in the efficient retrieval, insertion, and deletion of data from the database and organizes the data in the form of tables, views, schemas, reports, etc. For Example, a university database organizes the data about students, faculty, admin staff, etc. which helps in the efficient retrieval, insertion, and deletion of data from it.


# What is DBMS

A Database Management System (DBMS) is a software system that is designed to manage and organize data in a structured manner. It allows users to create, modify, and query a database, as well as manage the security and access controls for that database. DBMS provides an environment to store and retrieve data in convenient and efficient manner.

# Key Features of DBMS
- **Data modeling:** A DBMS provides tools for creating and modifying data models, which define the structure and relationships of the data in a database.
- **Data storage and retrieval:** A DBMS is responsible for storing and retrieving data from the database, and can provide various methods for searching and querying the data.
- **Concurrency control:** A DBMS provides mechanisms for controlling concurrent access to the database, to ensure that multiple users can access the data without conflicting with each other.
- **Data integrity and security**: A DBMS provides tools for enforcing data integrity and security constraints, such as constraints on the values of data and access controls that restrict who can access the data.
- **Backup and recovery:** A DBMS provides mechanisms for backing up and recovering the data in the event of a system failure.


# Types of DBMS
- **Relational Database Management System (RDBMS):** Data is organized into tables (relations) with rows and columns, and the relationships between the data are managed through primary and foreign keys. SQL (Structured Query Language) is used to query and manipulate the data.
- **NoSQL DBMS:** Designed for high-performance scenarios and large-scale data, NoSQL databases store data in various non-relational formats such as key-value pairs, documents, graphs, or columns. Ex Mongo DB
- **Object-Oriented DBMS (OODBMS):** Stores data as objects, similar to those used in object-oriented programming, allowing for complex data representations and relationships Ex. Object DB


# Database Languages
- Data Definition Language (DDL)
- Data Manipulation Language (DML)
- Data Control Language (DCL)
- Transactional Control Language (TCL)


## Data Definition Language (DDL)
DDL is the short name for Data Definition Language, which deals with database schemas and descriptions, of how the data should reside in the database.

### CREATE 
To create a database and its objects like (table, index, views, store procedure, function, and triggers)

```
-- Creating a table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50)
);
```
### ALTER
Alters the structure of the existing database

```
-- Adding a new column to the Employees table
ALTER TABLE Employees
ADD DateOfBirth DATE;
```
### DROP
Delete objects from the 

```
-- Dropping the Employees table
DROP TABLE Employees;
```


### TRUNCATE
Remove all records from a table, including all spaces allocated for the records are removed
```
-- Truncating all data from the Employees table
TRUNCATE TABLE Employees;
```
### COMMENT
Add comments to the data dictionary

```
-- Adding a comment to the Employees table
COMMENT ON TABLE Employees IS 'This table stores employee information.';
```

```
COMMENT ON COLUMN table_name.column_name IS 'Your comment here';
```

#### How to generate Data Dictionary

```
-- Query to generate data dictionary for a table in SQL Server
SELECT 
    c.name AS column_name,
    t.name AS data_type,
    ep.value AS column_comment
FROM 
    sys.columns c
JOIN 
    sys.types t ON c.user_type_id = t.user_type_id
LEFT JOIN 
    sys.extended_properties ep ON c.object_id = ep.major_id AND c.column_id = ep.minor_id
WHERE 
    c.object_id = OBJECT_ID('Employees');
```
### RENAME
Rename an object

```
-- Renaming the Employees table to Staff
RENAME Employees TO Staff;
```


## Data Manipulation Language (DML)
DML is the short name for Data Manipulation Language which deals with data manipulation and includes most common SQL statements such SELECT, INSERT, UPDATE, DELETE, etc., and it is used to **store, modify, retrieve, delete and update data in a database**. Data query language(DQL) is the subset of “Data Manipulation Language”. The most common command of DQL is SELECT statement. SELECT statement help on retrieving the data from the table without changing anything in the table.


### SELECT
Retrieve data from a database
```
-- Selecting all columns from the Employees table
SELECT * FROM Employees;

-- Selecting specific columns from the Employees table
SELECT EmployeeID, FirstName, LastName FROM Employees WHERE Department = 'HR';
```
### INSERT
Insert data into a table
```
-- Inserting a new row into the Employees table
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, DateOfBirth)
VALUES (1, 'John', 'Doe', 'Finance', '1985-06-15');
```
### UPDATE
Updates existing data within a table
```
-- Updating the department of an employee
UPDATE Employees
SET Department = 'Marketing'
WHERE EmployeeID = 1;
```
### DELETE
Delete all records from a database table

```
-- Deleting a specific employee from the Employees table
DELETE FROM Employees
WHERE EmployeeID = 1;

-- Deleting all records from the Employees table
DELETE FROM Employees;
```


### MERGE
UPSERT operation (insert or update)

```
-- Using MERGE to either update or insert a new employee record
MERGE INTO Employees e
USING (SELECT 2 AS EmployeeID, 'Jane' AS FirstName, 'Doe' AS LastName, 'HR' AS Department, '1990-07-20' AS DateOfBirth) src
ON (e.EmployeeID = src.EmployeeID)
WHEN MATCHED THEN 
    UPDATE SET e.FirstName = src.FirstName, e.LastName = src.LastName, e.Department = src.Department
WHEN NOT MATCHED THEN 
    INSERT (EmployeeID, FirstName, LastName, Department, DateOfBirth)
    VALUES (src.EmployeeID, src.FirstName, src.LastName, src.Department, src.DateOfBirth);
```

### CALL
Call a PL/SQL or Java subprogram

```
-- Calling a PL/SQL stored procedure
CALL UpdateEmployeeSalary(1001, 5000);

-- Calling a Java stored procedure in Oracle
CALL java_procedure();
```
### EXPLAIN PLAN
Interpretation of the data access path

```
-- Explain the query execution plan for a SELECT statement
EXPLAIN PLAN FOR
SELECT * FROM Employees WHERE Department = 'HR';

-- Viewing the plan from the output table
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);
```
### LOCK TABLE
Concurrency Control
The LOCK command in SQL is used to control access to database objects (such as tables) to ensure data integrity during concurrent operations.
```
-- Locking the Employees table in exclusive mode
LOCK TABLE Employees IN EXCLUSIVE MODE;

-- Locking the Employees table for read only
LOCK TABLE Employees IN SHARE MODE;
```


## Data Control Language (DCL)
DCL is short for Data Control Language which acts as an access specifier to the database, basically to grant and revoke permissions to users in the database

### GRANT
Grant permissions to the user for running DML(SELECT, INSERT, DELETE,…) commands on the table

```
-- Granting SELECT permission on the Employees table to a user
GRANT SELECT ON Employees TO username;

-- Granting INSERT and DELETE permissions on the Employees table to a user
GRANT INSERT, DELETE ON Employees TO username;

-- Granting all DML permissions (SELECT, INSERT, UPDATE, DELETE) on the Employees table to a user
GRANT ALL PRIVILEGES ON Employees TO username;
```
### REVOKE
Revoke permissions to the user for running DML(SELECT, INSERT, DELETE,…) command on the specified table

```
-- Revoking SELECT permission on the Employees table from a user
REVOKE SELECT ON Employees FROM username;

-- Revoking INSERT permission on the Employees table from a user
REVOKE INSERT ON Employees FROM username;

-- Revoking all DML permissions (SELECT, INSERT, UPDATE, DELETE) on the Employees table from a user
REVOKE ALL PRIVILEGES ON Employees FROM username;
```

## Transactional Control Language (TCL)
TCL is short for Transactional Control Language which acts as an manager for all types of transactional data and all transactions. Some of the command of TCL are

### Roll Back
Used to cancel  or Undo changes made in the database 
```
-- Rolling back all changes made in the current transaction
ROLLBACK;

-- Example: Rolling back to a specific savepoint
SAVE TRANSACTION my_savepoint;  -- Creating a savepoint
-- Some changes made here...
ROLLBACK TRANSACTION my_savepoint;  -- Undo changes made after the savepoint
```
### Commit
It is used to apply or save changes in the database

```
-- Committing all changes made in the current transaction
COMMIT;

-- Example: Committing after a series of DML operations
BEGIN TRANSACTION;  -- Starting a transaction
INSERT INTO Employees (EmployeeID, FirstName, LastName) VALUES (2, 'Jane', 'Smith');
UPDATE Employees SET LastName = 'Doe' WHERE EmployeeID = 2;
COMMIT;  -- Applying all changes
```
### Save Point
It is used to save the data on the temporary basis in the database

```
-- Creating a savepoint within a transaction
SAVE TRANSACTION my_savepoint;

-- Example: Modifying data after the savepoint
UPDATE Employees SET Department = 'Sales' WHERE EmployeeID = 1;

-- Rolling back to the savepoint if needed
ROLLBACK TRANSACTION my_savepoint;  -- Undo changes made after the savepoint
```


## Data Query Language (DQL)
Data query language(DQL) is the subset of “Data Manipulation Language”. The most common command of DQL is 1the SELECT statement. SELECT statement helps us in retrieving the data from the table without changing anything or modifying the table. DQL is very important for retrieval of essential data from a database.

