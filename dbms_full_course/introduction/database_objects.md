# Database Objects in DBMS

Any defined object in a database used to store or reference data, created using the `CREATE` command.

Examples of database objects:

1. **Table**: Basic unit of storage; consists of rows and columns.

```
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50)
);
```

2. **View**: Represents a logical subset of data from one or more tables.

```
CREATE VIEW SalesView AS
SELECT EmployeeID, FirstName, LastName
FROM Employees
WHERE Department = 'Sales';

```

3. **Sequence**: This database object is used to create a sequence in database.A sequence is a user created database object that can be shared by multiple users to generate unique integers. A typical usage for sequences is to create a primary key value, which must be unique for each row.The sequence is generated and incremented (or decremented) by an internal Oracle routine.

```
CREATE SEQUENCE sequence
                        [INCREMENT BY n]
                        [START WITH n]
                        [{MAXVALUE n | NOMAXVALUE}]
                        [{MINVALUE n | NOMINVALUE}]
                        [{CYCLE | NOCYCLE}]
                        [{CACHE n | NOCACHE}];
```

```
CREATE SEQUENCE dept_deptid_seq
                        INCREMENT BY 10
                        START WITH 120
                        MAXVALUE 9999
                        NOCACHE
                        NOCYCLE;
```

4. **Index**: Enhances query performance.

```
CREATE INDEX idx_department ON Employees(Department);
```

5. **Synonym**: Provides an alternative name for an object.

```
CREATE SYNONYM EmpSyn FOR Employees;
```
