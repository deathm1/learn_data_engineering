# Best practices for using Azure Data Lake Storage


## Directory structure

Every workload has different requirements on how the data is consumed, but these are some common layouts to consider when working with Internet of Things (IoT), batch scenarios or when optimizing for time-series data.

### IoT structure
In IoT workloads, there can be a great deal of data being ingested that spans across numerous products, devices, organizations, and customers. It's important to pre-plan the directory layout for organization, security, and efficient processing of the data for down-stream consumers. A general template to consider might be the following layout:

`{Region}/{SubjectMatter(s)}/{yyyy}/{mm}/{dd}/{hh}/`

For example, landing telemetry for an airplane engine within the UK might look like the following structure:

`UK/Planes/BA1293/Engine1/2017/08/11/12/`

In this example, by putting the date at the end of the directory structure, you can use ACLs to more easily secure regions and subject matters to specific users and groups. If you put the date structure at the beginning, it would be much more difficult to secure these regions and subject matters. For example, if you wanted to provide access only to UK data or certain planes, you'd need to apply a separate permission for numerous directories under every hour directory. This structure would also exponentially increase the number of directories as time went on.

### Batch jobs structure
A commonly used approach in batch processing is to place data into an "in" directory. Then, once the data is processed, put the new data into an "out" directory for downstream processes to consume. This directory structure is sometimes used for jobs that require processing on individual files, and might not require massively parallel processing over large datasets. 

Like the IoT structure recommended above, **a good directory structure has the parent-level directories for things such as region and subject matters (for example, organization, product, or producer)**. 

Consider date and time in the structure to allow better organization, filtered searches, security, and automation in the processing. The level of granularity for the date structure is determined by the interval on which the data is uploaded or processed, such as hourly, daily, or even monthly.

Sometimes file processing is unsuccessful due to data corruption or unexpected formats. In such cases, a directory structure might benefit from a /bad folder to move the files to for further inspection. The batch job might also handle the reporting or notification of these bad files for manual intervention. Consider the following template structure:

`
{Region}/{SubjectMatter(s)}/In/{yyyy}/{mm}/{dd}/{hh}/
{Region}/{SubjectMatter(s)}/Out/{yyyy}/{mm}/{dd}/{hh}/
{Region}/{SubjectMatter(s)}/Bad/{yyyy}/{mm}/{dd}/{hh}/
`


For example, a marketing firm receives daily data extracts of customer updates from their clients in North America. It might look like the following snippet before and after being processed:


`
NA/Extracts/ACMEPaperCo/In/2017/08/14/updates_08142017.csv
NA/Extracts/ACMEPaperCo/Out/2017/08/14/processed_updates_08142017.csv

`

In the common case of batch data being processed directly into databases such as Hive or traditional SQL databases, there isn't a need for an /in or /out directory because the output already goes into a separate folder for the Hive table or external database. 

For example, daily extracts from customers would land into their respective directories. Then, a service such as Azure Data Factory, Apache Oozie, or Apache Airflow would trigger a daily Hive or Spark job to process and write the data into a Hive table.

### Time series data structure
For Hive workloads, partition pruning of time-series data can help some queries read only a subset of the data, which improves performance.

Those pipelines that ingest time-series data, often place their files with a structured naming for files and folders. Below is a common example we see for data that is structured by date:


`
/DataSet/YYYY/MM/DD/datafile_YYYY_MM_DD.tsv
`

Notice that the datetime information appears both as folders and in the filename.

For date and time, the following is a common pattern


`
/DataSet/YYYY/MM/DD/HH/mm/datafile_YYYY_MM_DD_HH_mm.tsv
`

Again, the choice you make with the folder and file organization should optimize for the larger file sizes and a reasonable number of files in each folder.

# References

- https://learn.microsoft.com/en-us/azure/storage/blobs/data-lake-storage-best-practices
