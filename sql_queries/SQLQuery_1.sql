
DROP TABLE IF EXISTS temporal_tables.EmployeeHistory;
DROP TABLE IF EXISTS temporal_tables.Employee;

ALTER TABLE temporal_tables.Employee SET (SYSTEM_VERSIONING = OFF);

CREATE TABLE temporal_tables.Employee (
    [EmployeeID] BIGINT IDENTITY(1,1) PRIMARY KEY CLUSTERED,
    [Name] NVARCHAR(100) NOT NULL,
    [Position] VARCHAR(100) NOT NULL,
    [Department] VARCHAR(100) NOT NULL,
    [Address] NVARCHAR(1024) NOT NULL,
    [AnnualSalary] DECIMAL(10, 2) NOT NULL,
    [ValidFrom] DATETIME2 GENERATED ALWAYS AS ROW START,
    [ValidTo] DATETIME2 GENERATED ALWAYS AS ROW END,
    PERIOD FOR SYSTEM_TIME(ValidFrom, ValidTo)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = temporal_tables.EmployeeHistory));



