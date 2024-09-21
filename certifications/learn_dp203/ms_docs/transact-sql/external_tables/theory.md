# CTAS (CREATE TABLE AS SELECT)

The CREATE TABLE AS SELECT (CTAS) statement is one of the most important T-SQL features available. CTAS is a parallel operation that creates a new table based on the output of a SELECT statement. CTAS is the simplest and fastest way to create and insert data into a table with a single command.

## SELECT...INTO vs. CTAS

CTAS is a more customizable version of the SELECT...INTO statement.

The following is an example of a simple SELECT...INTO:

```
SELECT
*
INTO [dbo].[FactInternetSales_new]
FROM [dbo].[FactInternetSales]
```

**SELECT...INTO doesn't allow you to change either the distribution method or the index type as part of the operation. You create [dbo].[FactInternetSales_new] by using the default distribution type of ROUND_ROBIN, and the default table structure of CLUSTERED COLUMNSTORE INDEX.**

With CTAS, on the other hand, you can specify both the distribution of the table data as well as the table structure type. To convert the previous example to CTAS:

```
CREATE TABLE [dbo].[FactInternetSales_new]
WITH
(
 DISTRIBUTION = ROUND_ROBIN,
 CLUSTERED COLUMNSTORE INDEX
)
AS
SELECT  *
FROM    [dbo].[FactInternetSales];
```

## Difference between SELECT...INTO vs. CTAS

| Feature                    | CTAS (CREATE TABLE AS SELECT)                                            | SELECT...INTO                                              |
| -------------------------- | ------------------------------------------------------------------------ | ---------------------------------------------------------- |
| **Purpose**                | Creates a new table and populates it with data from a query.             | Copies data into a new table, creating it on-the-fly.      |
| **Syntax**                 | `CREATE TABLE new_table AS SELECT * FROM old_table;`                     | `SELECT * INTO new_table FROM old_table;`                  |
| **Table Creation**         | Explicitly uses the `CREATE TABLE` statement.                            | Implicitly creates a new table.                            |
| **Flexibility**            | More flexible with options like defining constraints and indexes.        | Less flexible; no constraints can be defined at creation.  |
| **Output Structure**       | The structure of the new table is derived from the SELECT query.         | The new table’s structure is the same as the result set.   |
| **Column Names**           | Allows aliasing column names in the SELECT query.                        | Retains original column names; cannot alias.               |
| **Transaction Control**    | Can be part of a transaction; supports rollback.                         | Often treated as an implicit transaction.                  |
| **Database Compatibility** | Supported in most SQL databases (e.g., PostgreSQL, Oracle, etc.).        | Supported in some databases (e.g., SQL Server).            |
| **Data Types**             | Data types are inferred from the SELECT query.                           | Data types are automatically inferred as well.             |
| **Performance**            | Generally faster for large datasets, especially with additional options. | Performance can vary based on the database implementation. |
| **Use Cases**              | Ideal for creating snapshot tables or materialized views.                | Suitable for quick data extraction into new tables.        |
| **Indexing**               | Indexes can be created after the table is made.                          | Indexes must be created after the table is populated.      |
| **Storage Settings**       | Can define storage settings and tablespace.                              | Typically defaults to the database's storage settings.     |

# CETAS (CREATE EXTERNAL TABLE AS SELECT)

- CETAS stands for Create External Table As Select. It is commonly used in data warehousing and big data contexts, particularly in systems like Azure Synapse Analytics or Amazon Redshift. Here’s a detailed explanation of CETAS, including its syntax, benefits, use cases, and more.

- CETAS allows you to create an external table based on the results of a query. An external table points to data stored outside of the traditional database storage, often in formats like Parquet, CSV, or ORC in cloud storage (e.g., Azure Blob Storage, Amazon S3).

```
CREATE EXTERNAL TABLE { [ [ database_name . [ schema_name ] . ] | schema_name . ] table_name }
    [ (column_name [ , ...n ] ) ]
    WITH (
        LOCATION = 'hdfs_folder' | '<prefix>://<path>[:<port>]' ,
        DATA_SOURCE = external_data_source_name ,
        FILE_FORMAT = external_file_format_name
        [ , <reject_options> [ , ...n ] ]
    )
    AS <select_statement>
[;]

<reject_options> ::=
{
    | REJECT_TYPE = value | percentage
    | REJECT_VALUE = reject_value
    | REJECT_SAMPLE_VALUE = reject_sample_value
}

<select_statement> ::=
    [ WITH <common_table_expression> [ , ...n ] ]
    SELECT <select_criteria>
```

## Example 1

```
-- use CETAS to export select statement with OPENROWSET result to  storage
CREATE EXTERNAL TABLE population_by_year_state
WITH (
    LOCATION = 'aggregated_data/',
    DATA_SOURCE = population_ds,
    FILE_FORMAT = census_file_format
)
AS
SELECT decennialTime, stateName, SUM(population) AS population
FROM
    OPENROWSET(BULK 'https://azureopendatastorage.dfs.core.windows.net/censusdatacontainer/release/us_population_county/year=*/*.parquet',
    FORMAT='PARQUET') AS [r]
GROUP BY decennialTime, stateName
GO

-- you can query the newly created external table
SELECT * FROM population_by_year_state
```

- OPENROWSET is a T-SQL function in SQL Server that allows you to access remote data from various data sources, such as SQL Server databases, Excel files, or other OLE DB data sources. It can be used to read data into a SQL Server query without needing to create a linked server.

## Example 2

```
-- use CETAS with select from external table
CREATE EXTERNAL TABLE population_by_year_state
WITH (
    LOCATION = 'aggregated_data/',
    DATA_SOURCE = population_ds,
    FILE_FORMAT = census_file_format
)
AS
SELECT decennialTime, stateName, SUM(population) AS population
FROM census_external_table
GROUP BY decennialTime, stateName
GO

-- you can query the newly created external table
SELECT * FROM population_by_year_state
```

## General Example

```
CREATE DATABASE [<mydatabase>];
GO

USE [<mydatabase>];
GO

CREATE MASTER KEY ENCRYPTION BY PASSWORD = '<strong password>';

CREATE DATABASE SCOPED CREDENTIAL [WorkspaceIdentity] WITH IDENTITY = 'Managed Identity';
GO

-- Step 1
CREATE EXTERNAL FILE FORMAT [ParquetFF] WITH (
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
);
GO

-- STEP 2
CREATE EXTERNAL DATA SOURCE [SynapseSQLwriteable] WITH (
    LOCATION = 'https://<mystoageaccount>.dfs.core.windows.net/<mycontainer>/<mybaseoutputfolderpath>',
    CREDENTIAL = [WorkspaceIdentity]
);
GO

-- Step 3
CREATE EXTERNAL TABLE [dbo].[<myexternaltable>] WITH (
        LOCATION = '<myoutputsubfolder>/',
        DATA_SOURCE = [SynapseSQLwriteable],
        FILE_FORMAT = [ParquetFF]
) AS
SELECT * FROM [<myview>];
GO
```

- In SQL Server, GO is a batch separator used in SQL scripts. It tells the SQL Server Management Studio (SSMS) or other SQL client tools to execute all the statements preceding it as a single batch.
