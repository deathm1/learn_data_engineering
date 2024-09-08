# Use external tables with Synapse SQL

An external table points to data located in Hadoop, Azure Storage blob, or Azure Data Lake Storage. You can use external tables to read data from files or write data to files in Azure Storage.


With Synapse SQL, you can use external tables to read external data using dedicated SQL pool or serverless SQL pool.

Depending on the type of the external data source, you can use two types of external tables:

Hadoop external tables that you can use to read and export data in various data formats such as CSV, Parquet, and ORC. Hadoop external tables are available in dedicated SQL pools, but they aren't available in serverless SQL pools.
Native external tables that you can use to read and export data in various data formats such as CSV and Parquet. Native external tables are available in serverless SQL pools, and they are in public preview in dedicated SQL pools. Writing/exporting data using CETAS and the native external tables is available only in the serverless SQL pool, but not in the dedicated SQL pools.


# External tables in dedicated SQL pool and serverless SQL pool
You can use external tables to:

- Query Azure Blob Storage and Azure Data Lake Gen2 with Transact-SQL statements.
- Store query results to files in Azure Blob Storage or Azure Data Lake Storage using CETAS.
- Import data from Azure Blob Storage and Azure Data Lake Storage and store it in a dedicated SQL pool (only Hadoop tables in dedicated pool).

When used in conjunction with the CREATE TABLE AS SELECT statement, selecting from an external table imports data into a table within the dedicated SQL pool.

If performance of Hadoop external tables in the dedicated pools do not satisfy your performance goals, consider loading external data into the Datawarehouse tables using the COPY statement.

For a loading tutorial, see Use PolyBase to load data from Azure Blob Storage.

You can create external tables in Synapse SQL pools via the following steps:

1. CREATE EXTERNAL DATA SOURCE to reference an external Azure storage and specify the credential that should be used to access the storage.
2. CREATE EXTERNAL FILE FORMAT to describe format of CSV or Parquet files.
3. CREATE EXTERNAL TABLE on top of the files placed on the data source with the same file format.

# References

- https://learn.microsoft.com/en-us/azure/synapse-analytics/sql/develop-tables-external-tables?tabs=hadoop