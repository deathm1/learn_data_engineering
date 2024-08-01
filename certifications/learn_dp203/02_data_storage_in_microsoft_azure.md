# Comparison of structured, unstructured, and semi-structured data

| Aspect               | Structured Data                                                                                         | Unstructured Data                                                                                  | Semi-Structured Data                                                                                    |
| -------------------- | ------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| **Definition**       | Data that is highly organized and easily searchable in fixed fields within a file or database.          | Data that does not have a predefined data model or is not organized in a predefined manner.        | Data that does not conform to a rigid structure but contains tags or markers to separate data elements. |
| **Examples**         | - Relational databases (e.g., SQL databases)                                                            | - Text documents, PDFs, emails, social media posts                                                 | - JSON, XML files, NoSQL databases                                                                      |
|                      | - Spreadsheets (e.g., Excel)                                                                            | - Multimedia files (e.g., images, videos, audio files)                                             | - CSV files with inconsistent structures                                                                |
|                      | - CSV files with consistent structure                                                                   | - Web pages, logs, sensor data                                                                     | - HTML documents                                                                                        |
| **Storage Systems**  | - Relational databases (e.g., MySQL, PostgreSQL, Oracle)                                                | - File systems, data lakes (e.g., HDFS, S3)                                                        | - NoSQL databases (e.g., MongoDB, Couchbase)                                                            |
|                      | - Data warehouses                                                                                       | - Content management systems                                                                       | - Data lakes with schema-on-read approaches                                                             |
| **Data Model**       | Predefined schema with tables, rows, and columns                                                        | No predefined schema, data is stored as it is generated                                            | Flexible schema, data elements are marked with tags or keys                                             |
| **Ease of Analysis** | Easier to analyze due to structured format, making it suitable for SQL queries and traditional BI tools | Difficult to analyze directly, often requires preprocessing and advanced analytics techniques      | Moderately easy to analyze, often requires parsing and transformation before analysis                   |
| **Searchability**    | Highly searchable due to predefined schema and indexing                                                 | Less searchable, requires text search or content-based search techniques                           | Moderately searchable, indexing can be applied based on tags or markers                                 |
| **Scalability**      | Typically scales well vertically (adding more power to existing servers)                                | Scales well horizontally (adding more servers) but can be challenging to manage at large scales    | Scales well horizontally, designed for distributed systems                                              |
| **Flexibility**      | Less flexible, changes to the schema require significant effort                                         | Highly flexible, can accommodate new data types and structures without significant changes         | More flexible than structured data but less than unstructured data                                      |
| **Data Integrity**   | High data integrity due to enforced schema and constraints                                              | Lower data integrity, prone to inconsistencies and errors                                          | Moderate data integrity, some validation can be enforced based on tags or markers                       |
| **Use Cases**        | - Transaction processing systems (e.g., banking, e-commerce)                                            | - Document management, media repositories, social media analysis                                   | - Web data integration, IoT data management, APIs                                                       |
|                      | - Reporting and business intelligence (BI)                                                              | - Sentiment analysis, image and video recognition                                                  | - Data interchange formats, data integration tasks                                                      |
| **Processing Tools** | - SQL-based tools (e.g., MySQL, SQL Server, PostgreSQL)                                                 | - Big data processing tools (e.g., Hadoop, Spark)                                                  | - NoSQL databases (e.g., MongoDB, CouchDB), XML parsers, JSON parsers                                   |
|                      | - ETL tools (e.g., Informatica, Talend)                                                                 | - Text analytics tools (e.g., Apache Lucene, Elasticsearch)                                        | - Data integration tools (e.g., Apache Nifi, Kafka)                                                     |
| **Example Queries**  | - `SELECT * FROM table WHERE column = 'value';`                                                         | - Text search: `grep 'keyword' file.txt`                                                           | - JSON query: `db.collection.find({"key": "value"})`                                                    |
|                      |                                                                                                         | - Image recognition: using machine learning models                                                 | - XPath or XQuery for querying XML data                                                                 |
| **Maintenance**      | Requires regular maintenance for database schema, indexing, and optimization                            | Less maintenance required for structure, but preprocessing and cleaning are essential for analysis | Moderate maintenance, includes schema evolution and data parsing                                        |
| **Challenges**       | - Schema rigidity, making it difficult to adapt to changes in data requirements                         | - Difficulty in data extraction and analysis due to lack of structure                              | - Balancing flexibility and consistency, handling evolving data structures                              |
|                      | - Requires significant effort to design and manage                                                      | - Storage and management of large volumes of data                                                  | - Ensuring data quality and consistency                                                                 |

# Group multiple operations in a transaction

Applications may need to group a series of data updates together. Because a changed one piece of data needs to result in a change to another piece of data. Transactions enable you to group these updates so that if one event in a series of updates fails, the entire series can be rolled back or undone. For example, as an online retailer, you might use a transaction for the placement of an order and payment verification. The grouping of the related events ensures that you don't reduce your inventory levels until an approved form of payment is received. Here, you'll learn about transactions and whether they're required for your data. A transaction is a logical group of database operations that are executed together.

Here's the question to ask yourself regarding whether you need to use transactions in your application; Will a change to one piece of data in your data set impact another? If the answer is yes, then you'll need support for transactions in your database service.

Transactions are often defined by a set of four requirements referred to as ACID guarantees. ACID stands for atomicity, consistency, isolation, and durability.

- Atomicity means a transaction must be executed exactly once and must be atomic, either all the work is done or none of it is. Operations within a transaction usually share a common intent and are interdependent.
- Consistency ensures that the data is consistent both before and after the transaction.
- Isolation ensures that one transaction is not impacted by another transaction.
- Durability means that the changes made due to the transaction are permanently saved in the system.

Committed data is saved by the system so that even in the event of a failure and system restart, the data is available in its correct state. When a database offers ACID guarantees, these principles are applied to any transactions in a consistent manner.

The databases that a business uses to store all its transactions and records are called online transaction processing, OLTP databases.

While Online Analytical Processing, OLAP is a technology that organizes large business databases and supports complex analysis.

OLTP systems commonly support lots of users and handle large volumes of data inserts and updates. They can be made highly available, meaning they have very minimal downtime and typically handle small or relatively simple transactions.

On the contrary, OLAP can be used to perform complex analytical queries without negatively affecting transactional systems.

OLAP is ideal for:

- data mining
- business intelligence
- complex analytical calculations

business-reporting functions like financial analysis, budgeting, and sales forecasting.

The terms OLTP and OLAP aren't used as frequently as they used to be but understanding that makes it easier to categorize the needs of your application.

# OLAP vs OLTP

| Aspect                     | OLTP (Online Transaction Processing)                                                                                       | OLAP (Online Analytical Processing)                                                                              |
| -------------------------- | -------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| **Primary Purpose**        | To manage and facilitate day-to-day transaction processing.                                                                | To support complex queries and data analysis for decision-making purposes.                                       |
| **Data Characteristics**   | Highly normalized data, focused on insert, update, and delete operations.                                                  | Denormalized data, optimized for read-heavy operations and complex queries.                                      |
| **Operations**             | - CRUD operations (Create, Read, Update, Delete).                                                                          | - Aggregations, complex queries, and data analysis.                                                              |
| **Query Types**            | Simple, fast, and frequent queries that often involve a single record or a small set of records.                           | Complex queries that involve large volumes of data and multiple records.                                         |
| **Response Time**          | Milliseconds to seconds.                                                                                                   | Seconds to minutes.                                                                                              |
| **Data Volume**            | Typically handles smaller volumes of data per transaction.                                                                 | Designed to handle large volumes of data and historical data.                                                    |
| **Data Integrity**         | High data integrity and consistency due to frequent updates and transactions.                                              | Data consistency is less critical, as it is primarily read-only and updated periodically (ETL processes).        |
| **Concurrency**            | High concurrency, supporting many simultaneous users and transactions.                                                     | Lower concurrency, typically fewer users executing complex queries.                                              |
| **Examples**               | - E-commerce systems                                                                                                       | - Business intelligence systems                                                                                  |
|                            | - Banking systems                                                                                                          | - Data warehousing                                                                                               |
|                            | - Inventory management systems                                                                                             | - Reporting and analytics platforms                                                                              |
| **Schema Design**          | Highly normalized schemas (3NF or higher) to reduce data redundancy.                                                       | Denormalized schemas (star or snowflake schema) to optimize query performance.                                   |
| **Backup and Recovery**    | Regular backups and fast recovery are essential due to continuous data changes.                                            | Periodic backups, as data is updated less frequently and mostly read-only.                                       |
| **Maintenance**            | Requires regular maintenance to manage transaction logs, backups, and indexing.                                            | Requires maintenance to update data and manage ETL processes.                                                    |
| **Performance Metrics**    | Transaction throughput (transactions per second).                                                                          | Query response time and throughput.                                                                              |
| **Azure Services**         | - **Azure SQL Database:** Fully managed relational database service for OLTP workloads.                                    | - **Azure Synapse Analytics:** Integrated analytics service for large-scale data warehousing and OLAP workloads. |
|                            | - **Azure Cosmos DB:** Globally distributed, multi-model database service suitable for high concurrency OLTP applications. | - **Azure Analysis Services:** Enterprise-grade analytics engine as a service for OLAP solutions.                |
|                            | - **Azure Database for MySQL/PostgreSQL:** Managed database services for OLTP applications.                                | - **Power BI:** Business analytics service providing interactive visualizations and OLAP capabilities.           |
|                            | - **Azure SQL Managed Instance:** Managed SQL Server instances for modernizing OLTP applications.                          | - **Azure Data Lake Storage:** Scalable storage for big data analytics and OLAP scenarios.                       |
| **Transaction Management** | ACID (Atomicity, Consistency, Isolation, Durability) properties ensure reliable transaction processing.                    | Often uses batch processing and periodic updates; ACID properties are less critical.                             |
| **Typical Users**          | Operational staff, customer service representatives, end-users performing transactions.                                    | Data analysts, business analysts, data scientists, and management.                                               |
| **Use Case Examples**      | - Online retail transactions (e.g., Amazon, eBay).                                                                         | - Sales reporting and trend analysis.                                                                            |
|                            | - Banking transactions (e.g., deposits, withdrawals).                                                                      | - Financial forecasting and budgeting.                                                                           |
|                            | - Order processing and inventory control.                                                                                  | - Customer behavior analysis and segmentation.                                                                   |

| Feature/Service               | Azure SQL Database                                                                         | Azure SQL Managed Instance                                                                            | SQL Server on Azure Virtual Machines                                         | Azure Database for PostgreSQL                                                         | Azure Database for MySQL                                                              | Azure Database for MariaDB                                                            |
| ----------------------------- | ------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |
| **Deployment Model**          | Single database, elastic pool                                                              | Managed Instance                                                                                      | Full SQL Server instance on VM                                               | Single server, Flexible server, Hyperscale                                            | Single server, Flexible server                                                        | Single server                                                                         |
| **Purpose**                   | Best for modern cloud applications and microservices                                       | Best for applications requiring near 100% SQL Server compatibility                                    | Full control over SQL Server instance and OS                                 | Open-source relational database for applications requiring PostgreSQL                 | Open-source relational database for applications requiring MySQL                      | Open-source relational database for applications requiring MariaDB                    |
| **Compatibility**             | T-SQL and SQL Server features                                                              | Near 100% compatibility with on-premises SQL Server                                                   | 100% SQL Server compatibility                                                | Full PostgreSQL compatibility                                                         | Full MySQL compatibility                                                              | Full MariaDB compatibility                                                            |
| **Instance-level Features**   | No support for SQL Server Agent, Service Broker, Linked Servers, etc.                      | Supports SQL Server Agent, Service Broker, Linked Servers, CLR, Database Mail, etc.                   | Full support for all SQL Server features                                     | PostgreSQL extensions, PostGIS                                                        | MySQL plugins, InnoDB, MyISAM                                                         | MariaDB plugins, InnoDB, Aria                                                         |
| **Scaling**                   | Horizontal scaling with elastic pools, vertical scaling by changing service tiers          | Vertical scaling by changing service tiers; no auto-scale                                             | Vertical scaling by resizing VM, horizontal scaling with sharding            | Vertical scaling, read replicas, Hyperscale for single server                         | Vertical scaling, read replicas                                                       | Vertical scaling, read replicas                                                       |
| **Networking**                | Public endpoint by default, private endpoint through VNet service endpoint or private link | Deployed within a Virtual Network (VNet), supports private IP addresses, network isolation            | Full VNet support, public IP, private IP                                     | Public endpoint, VNet service endpoint, private link                                  | Public endpoint, VNet service endpoint, private link                                  | Public endpoint, VNet service endpoint, private link                                  |
| **Maintenance**               | Automatic patching and version updates                                                     | Automatic patching and maintenance, more granular control                                             | Manual maintenance and patching                                              | Automatic patching and maintenance                                                    | Automatic patching and maintenance                                                    | Automatic patching and maintenance                                                    |
| **Backup and Restore**        | Automated backups with point-in-time restore; no control over backup schedule              | Automated backups with point-in-time restore, custom retention policies                               | Manual or automated backups, point-in-time restore                           | Automated backups, point-in-time restore                                              | Automated backups, point-in-time restore                                              | Automated backups, point-in-time restore                                              |
| **High Availability**         | Built-in high availability with replicas in different fault domains; Geo-replication       | Built-in high availability with always-on availability groups; Multi-AZ deployment support            | Based on SQL Server Always On Availability Groups, clustering, etc.          | Built-in high availability, zone-redundant HA                                         | Built-in high availability, zone-redundant HA                                         | Built-in high availability, zone-redundant HA                                         |
| **Disaster Recovery**         | Active geo-replication; Auto-failover groups                                               | Auto-failover groups; Geo-restore                                                                     | SQL Server-based solutions, Azure Site Recovery                              | Geo-redundant backups, read replicas                                                  | Geo-redundant backups, read replicas                                                  | Geo-redundant backups, read replicas                                                  |
| **Pricing Model**             | DTU (Database Transaction Units) model or vCore (virtual core) model                       | vCore model only                                                                                      | Pay-as-you-go based on VM size, storage, licensing                           | Pay-as-you-go based on vCore, storage, backup                                         | Pay-as-you-go based on vCore, storage, backup                                         | Pay-as-you-go based on vCore, storage, backup                                         |
| **Security**                  | Advanced data security, auditing, threat detection, encryption at rest and in transit      | Advanced data security, auditing, threat detection, encryption at rest and in transit, VNet isolation | Full control, network security groups, encryption, custom security solutions | Advanced data security, auditing, threat detection, encryption at rest and in transit | Advanced data security, auditing, threat detection, encryption at rest and in transit | Advanced data security, auditing, threat detection, encryption at rest and in transit |
| **Management and Monitoring** | Azure portal, PowerShell, CLI, T-SQL, automated tuning                                     | Azure portal, PowerShell, CLI, T-SQL, supports SQL Server Management Studio (SSMS)                    | Full control with SSMS, Azure portal, PowerShell, CLI                        | Azure portal, PowerShell, CLI, pgAdmin                                                | Azure portal, PowerShell, CLI, MySQL Workbench                                        | Azure portal, PowerShell, CLI, phpMyAdmin                                             |
| **Target Applications**       | Modern cloud applications, SaaS applications, microservices                                | Enterprise applications, lift-and-shift migrations, hybrid cloud solutions                            | Applications requiring full SQL Server capabilities and control              | Applications needing PostgreSQL, open-source projects                                 | Applications needing MySQL, open-source projects                                      | Applications needing MariaDB, open-source projects                                    |

# Choose a storage solution on Azure

Choosing the correct storage solution can lead to better performance, cost savings and improved manageability. Here, you'll apply what you've learned about the data in your online retail scenario, you'll review product catalog data, photos and videos, and business analysis and find the best Microsoft Azure service for each data set.

Let's start by reviewing product catalog data. The classification of the data is semi structured because of the need to extend or modify the schema for new products.

- Customers require a high number of read operations with the ability to query many fields within the database.
- The business requires a high number of write operations to track its constantly changing inventory.

The performance requirements include high throughput, the rate at which the system can process inputs and low latency, the amount of time it takes to complete an operation. And because all of the data is both

historical and yet changing transactional support is required.

Microsoft's Azure Cosmos DB supports semi structured data or no sequel data by design. So, supporting new fields such as the Bluetooth enabled field or any new fields you need in the future is a given with Azure Cosmos DB. It also supports sequel for queries and every property is indexed by default. You can create queries so that your customers can filter on any property in the catalog. As your cosmos DB is also acid compliant, you can be assured that your transactions are completed according to those strict requirements.

# Consistency Levels in Azure

As an added plus, Azure Cosmos DB also enables you to replicate your data anywhere in the world with the click of a button. So, if your e-commerce site has users concentrated in the US or Japan, you can replicate your data to those data centers to reduce latency as you physically moved the data closer to your users. Even with data replicated around the world, you can choose from one of five consistency levels.

Azure Cosmos DB allows developers to choose between five well defined consistency models along the consistency spectrum:

- strong (Strong consistency, highest latency)
- bounded staleness
- Session
- consistent prefix
- eventual (least consistency, lowest latency)

These consistency levels enable you to maximize the availability and performance of your database depending on your needs.

- **Eventual consistency provides the lowest latency and the least consistency.**
- **Strong consistency results in the highest latency, but also the greatest consistency.**

By choosing the right consistency level, you can determine the tradeoffs to make between consistency availability, latency and throughput. You can scale up to handle higher customer demand during peak shopping times or scale down during slower times to conserve cost.

# Azure Architechture

Azure Active Directory > Subscriptions > Resource Group > Storage Account

<img src="images/azure_arch.png">

# Azure Storage Elements

<img src="images/azure_storage.png">

| Azure Storage Element        | Description                                                                                                                                                                                                                                                                                       | Use Cases                                                                                                                                                                                                                 | Features                                                                                                                                                                                                                                                                                                                                                             |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Azure Blob Storage**       | Object storage solution for the cloud. It is optimized for storing massive amounts of unstructured data, such as text or binary data.                                                                                                                                                             | - Storing files for distributed access<br>- Streaming video and audio<br>- Storing data for backup and restore, disaster recovery, and archiving<br>- Storing data for analysis by an on-premises or Azure-hosted service | - Tiers: Hot, Cool, Archive for cost-effective storage<br>- Scalability and performance<br>- Integration with Azure Data Lake for big data analytics<br>- Blob snapshots for versioning                                                                                                                                                                              |
| **Azure File Storage**       | Fully managed file shares in the cloud that are accessible via the industry-standard SMB (Server Message Block) protocol.                                                                                                                                                                         | - Replacing or supplementing on-premises file servers<br>- Storing shared application settings<br>- Lifting and shifting applications that use native file system APIs to the cloud                                       | - SMB and NFS support<br>- Integration with Azure Kubernetes Service (AKS) for persistent storage<br>- Azure File Sync to cache and sync on-premises file servers with Azure Files                                                                                                                                                                                   |
| **Azure Queue Storage**      | Messaging service for storing large numbers of messages that can be accessed from anywhere in the world via authenticated calls.                                                                                                                                                                  | - Decoupling components in cloud applications to improve scalability and reliability<br>- Creating backlog of work to process asynchronously                                                                              | - Unlimited number of messages<br>- Message size up to 64 KB<br>- FIFO (First-In-First-Out) message delivery<br>- At-Least-Once delivery guarantee                                                                                                                                                                                                                   |
| **Azure Table Storage**      | NoSQL key-value store for rapid development using massive semi-structured datasets.                                                                                                                                                                                                               | - Storing structured, non-relational data<br>- Storing flexible datasets like user data for web applications, device information, or any other metadata<br>- Logging data                                                 | - Schemaless design<br>- Support for OData protocol<br>- Integration with Azure Cosmos DB Table API for global distribution and horizontal scale                                                                                                                                                                                                                     |
| **Azure Disk Storage**       | Provides disks for Azure Virtual Machines (VMs) that are highly durable and available.                                                                                                                                                                                                            | - Persistent storage for VMs<br>- Database workloads requiring high IOPS<br>- Enterprise applications<br>- Data-intensive workloads like SAP and Oracle                                                                   | - Managed and unmanaged disks<br>- SSD and HDD options for performance and cost optimization<br>- Snapshot and backup capabilities<br>- Azure Disk Encryption for data security                                                                                                                                                                                      |
| **Azure Data Lake Storage**  | Gen2: A scalable data storage and analytics service that combines the power of a high-performance file system with massive scale and economy.                                                                                                                                                     | - Big data analytics<br>- Machine learning<br>- Data warehousing<br>- Real-time data processing                                                                                                                           | - HDFS-compatible<br>- Scalable to exabytes<br>- Optimized for analytics workloads<br>- Integration with Azure HDInsight, Azure Databricks, and Power BI                                                                                                                                                                                                             |
| **Azure Managed Disks**      | Simplifies disk management for VMs by managing the storage accounts associated with the VM disks.                                                                                                                                                                                                 | - Persistent storage for Azure VMs<br>- Scaling VMs with high-performance storage needs<br>- Simplifying backup and disaster recovery                                                                                     | - Simplified management<br>- Integration with Azure Backup and Azure Site Recovery<br>- Support for disk encryption<br>- High availability and durability                                                                                                                                                                                                            |
| **Azure Archive Storage**    | Provides a low-cost storage option for data that is rarely accessed and can tolerate retrieval latencies.                                                                                                                                                                                         | - Long-term backup and archive<br>- Compliance and legal requirements<br>- Storing data that is rarely accessed but needs to be retained                                                                                  | - Lowest cost storage tier<br>- High durability<br>- Data is offline and needs to be rehydrated before access<br>- Integration with Azure Blob Storage for lifecycle management                                                                                                                                                                                      |
| **Azure Blob Storage Tiers** | Three tiers: Hot, Cool, and Archive, allowing cost-effective storage options based on access frequency.                                                                                                                                                                                           | - Hot: Frequently accessed data<br>- Cool: Infrequently accessed data with lower availability requirements<br>- Archive: Rarely accessed data                                                                             | - Cost optimization based on access patterns<br>- Seamless tier migration<br>- Data redundancy options (LRS, GRS, ZRS)<br>- Lifecycle management policies                                                                                                                                                                                                            |
| **Azure Storage Explorer**   | A standalone app that enables you to easily work with Azure Storage data on Windows, macOS, and Linux.                                                                                                                                                                                            | - Managing Azure Storage accounts<br>- Uploading, downloading, and managing blobs, files, queues, and tables<br>- Accessing storage from different operating systems                                                      | - Cross-platform support<br>- User-friendly interface<br>- Integration with Azure Storage accounts<br>- Advanced search and filtering capabilities                                                                                                                                                                                                                   |
| **Azure Storage Security**   | Provides multiple security features to safeguard data, including encryption, access control, and network security.                                                                                                                                                                                | - Protecting sensitive data<br>- Ensuring compliance with security regulations<br>- Securing access to storage accounts                                                                                                   | - Encryption at rest and in transit<br>- Role-based access control (RBAC)<br>- Virtual network service endpoints<br>- Shared Access Signatures (SAS) for controlled access                                                                                                                                                                                           |
| **Azure Event Hubs**         | Azure Event Hubs is a fully managed, real-time data ingestion service provided by Microsoft Azure. It is designed to handle large volumes of data and can process millions of events per second. Event Hubs is ideal for big data scenarios, real-time analytics, and event-driven architectures. | Telemetry and Logging, Live Dashboarding, IoT Applications,Clickstream Analysis, Fraud Detection                                                                                                                          | Capable of ingesting millions of events per second from various sources like applications, devices, sensors, and more. Data is divided into partitions to support high throughput and parallel processing. Each partition is an ordered sequence of events. Automatically scales to handle varying loads, ensuring reliable performance without manual intervention. |

# Settings Controlled in a Storage Account

| Parameter                           | LRS (Locally Redundant Storage)                                                                                                   | ZRS (Zone-Redundant Storage)                                                                                           | GRS (Geo-Redundant Storage) / RA-GRS (Read-Access Geo-Redundant Storage)                                                                                                                                              | GZRS (Geo-Zone-Redundant Storage) / RA-GZRS (Read-Access Geo-Zone-Redundant Storage)                                                                                                                                            |
| ----------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Redundancy**                      | - Data is replicated three times within a single physical location in the primary region.                                         | - Data is replicated three times across two or three availability zones within a single region.                        | - Data is replicated three times in the primary region and three times in a secondary region, which is hundreds of miles away. RA-GRS provides read access to the data in the secondary region.                       | - Data is replicated three times across availability zones in the primary region and three times in a secondary region. RA-GZRS provides read access to the data in the secondary region.                                       |
| **Durability**                      | - High durability within a single region.                                                                                         | - High durability within a single region, even if one zone becomes unavailable.                                        | - High durability with the added benefit of geographic redundancy. Provides a higher level of durability due to the replication in the secondary region.                                                              | - Highest durability with both zone and geographic redundancy. Protects against regional outages as well as zone failures within the primary region.                                                                            |
| **Availability**                    | - 99.9% availability for read and write operations.                                                                               | - 99.99% availability for read and write operations.                                                                   | - 99.9% availability for read and write operations in the primary region. RA-GRS offers 99.99% availability for read operations in the secondary region.                                                              | - 99.9% availability for read and write operations in the primary region. RA-GZRS offers 99.99% availability for read operations in the secondary region.                                                                       |
| **Data Access in Outages**          | - Data is accessible within the primary region during outages unless the entire region is down.                                   | - Data remains accessible as long as at least one zone in the primary region is available.                             | - Data remains accessible in the primary region during regional outages. RA-GRS allows read access to the secondary region if the primary region is unavailable.                                                      | - Data remains accessible within the primary region during zone failures and in the secondary region during regional outages. RA-GZRS allows read access to the secondary region if the primary region is unavailable.          |
| **Latency**                         | - Lower latency for read and write operations within the primary region.                                                          | - Lower latency for read and write operations across multiple zones within the primary region.                         | - Lower latency for read and write operations in the primary region. RA-GRS may have higher latency for read operations from the secondary region due to geographic distance.                                         | - Lower latency for read and write operations across multiple zones within the primary region. RA-GZRS may have higher latency for read operations from the secondary region due to geographic distance.                        |
| **Use Cases**                       | - Suitable for cost-sensitive applications with high durability requirements within a single region.                              | - Ideal for applications requiring high availability and durability within a single region, even during zone failures. | - Best for applications needing high durability and disaster recovery with geographic redundancy. RA-GRS is suitable for applications that require read access to data in a secondary region during regional outages. | - Optimal for mission-critical applications that require both zone and geographic redundancy for maximum durability and availability. RA-GZRS is suitable for applications that need read access to data in a secondary region. |
| **Cost**                            | - Generally the least expensive option due to single-region replication.                                                          | - More expensive than LRS due to replication across multiple availability zones.                                       | - Higher cost than LRS and ZRS due to replication in a secondary region. RA-GRS incurs additional cost for read access to the secondary region.                                                                       | - Generally the most expensive option due to both zone and geographic redundancy. RA-GZRS incurs additional cost for read access to the secondary region.                                                                       |
| **Geo-Replication**                 | - No geo-replication.                                                                                                             | - No geo-replication.                                                                                                  | - Data is geo-replicated to a secondary region, ensuring geographic redundancy. RA-GRS provides read access to the secondary region.                                                                                  | - Data is geo-replicated across zones within the primary region and to a secondary region, ensuring both zone and geographic redundancy. RA-GZRS provides read access to the secondary region.                                  |
| **Failover Capability**             | - No automatic failover to another region. Manual intervention required to restore data from backups in case of regional failure. | - No automatic failover. Data remains accessible as long as one zone is operational.                                   | - In the event of a primary region outage, data can be manually failed over to the secondary region. RA-GRS allows read access to the secondary region without failover.                                              | - In the event of a primary region outage, data can be manually failed over to the secondary region. RA-GZRS allows read access to the secondary region without failover.                                                       |
| **Read Access in Secondary Region** | - Not applicable.                                                                                                                 | - Not applicable.                                                                                                      | - GRS does not provide read access to the secondary region. RA-GRS allows read access to data in the secondary region during outages in the primary region.                                                           | - GZRS does not provide read access to the secondary region. RA-GZRS allows read access to data in the secondary region during outages in the primary region.                                                                   |
| **Data Residency**                  | - Data resides within a single region.                                                                                            | - Data resides within multiple availability zones in a single region.                                                  | - Data resides in both primary and secondary regions, ensuring compliance with data residency requirements.                                                                                                           | - Data resides in multiple availability zones within the primary region and in a secondary region, ensuring compliance with stringent data residency and redundancy requirements.                                               |

Here is a detailed overview of the key settings that can be controlled in an Azure Storage account:

# Storage Account Configuration

## Resource ID

Every Azure Resource Manager resource has a unique resource ID that identifies it. Certain operations require providing the resource ID. You can retrieve the resource ID for a storage account using the Azure portal, PowerShell, or Azure CLI[1].

## Account Type, Location, Replication SKU

The account type, location, and replication SKU are properties of a storage account that can be viewed in the Azure portal, PowerShell, or Azure CLI[1].

## Service Endpoints

Service endpoints provide the base URL for accessing blob, queue, table, or file objects in Azure Storage. They are used to construct the address for any given resource[1].

## Connection String

A connection string authorizes access to Azure Storage using the account access keys (Shared Key authorization). It should be carefully protected, as the keys are similar to a root password for the storage account[1].

# Diagnostics Logging

## Enabling Logs

Azure Storage Analytics can be configured to save logs for read, write, and delete requests to blob, table, and queue services. A data retention policy can also be set[2].

## Retention Policy

The data retention policy specifies how long log data will be retained. Logs are stored as data in the account, so the retention policy helps manage storage costs. Stale log data older than the policy is automatically deleted[2].

## Azure Monitor Storage Insights

### Overview Workbook

The Overview workbook for a storage account shows performance metrics to assess service health, availability, transactions, latency, and capacity. It provides interactive charts and status tiles[3].

### Detailed Workbooks

Selecting options like Failures, Performance, Availability, or Capacity opens detailed interactive workbooks tailored to that category. They provide deeper analysis of metrics like end-to-end latency, server latency, transaction errors, and capacity usage[3].

### Pinning and Exporting

Metric sections can be pinned to Azure Dashboards. The multi-subscription Overview and Capacity workbooks also support exporting results to Excel[3].

## Resource Logs

### Accessing Logs

Resource logs for Azure Storage can be accessed as blobs in a storage account, as event data, or through Log Analytics queries. The specific operations and status messages that are logged can be found in the Storage Analytics documentation[4][5].

In summary, Azure Storage accounts provide a rich set of configuration options and monitoring capabilities to control access, enable diagnostics, and analyze performance and usage. The Azure portal, PowerShell, and CLI make it easy to manage these settings for optimal storage management.

# Deployment Models in Azure

Azure provides two deployment models:

1. Resource Manager, the current model that uses the Azure Resource Manager API
2. Classic, a legacy offering that uses the Azure Service Management API.
   Most Azure resources only work with the Resource Manager and make it easy to decide which model to choose.

However, storage accounts, virtual machines, and virtual networks support both. You must choose one or the other when you create your storage account.
Azure uses Azure Resource Manager for its resources, and as part of this, the resource manager requires a resource to be created in a resource group. A resource group lets you deploy and manage a collection of resources as a single unit. Microsoft recommends that you use Resource Manager for all new resources.

# Kinds of Storage Accounts

Here is a detailed comparison of the different kinds of storage accounts available in Azure, presented in a markdown table:

| Feature                         | General Purpose v2 (GPv2)                                                                                                                                                      | General Purpose v1 (GPv1)                                                                                                                                               | Blob Storage                                                                                                                                                   | File Storage                                                                                                               | Block Blob Storage                                                                                                                              |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| **Description**                 | The latest and recommended storage account type for most scenarios, offering a combination of features from Blob, Table, File, and Queue storage with the latest capabilities. | An older storage account type for blobs, files, queues, and tables. It supports all Azure storage features but does not have the latest enhancements and optimizations. | Optimized for storing large amounts of unstructured data, such as text or binary data. Only supports Blob storage (Block Blobs, Append Blobs, and Page Blobs). | Designed specifically for Azure File shares, providing fully managed file shares in the cloud accessible via SMB protocol. | Specifically optimized for high-performance scenarios that require block blobs storage. Ideal for streaming, big data, and backup applications. |
| **Storage Services**            | Blob, File, Queue, Table                                                                                                                                                       | Blob, File, Queue, Table                                                                                                                                                | Blob only                                                                                                                                                      | File only                                                                                                                  | Block Blob only                                                                                                                                 |
| **Performance Tiers**           | Standard and Premium                                                                                                                                                           | Standard only                                                                                                                                                           | Standard only                                                                                                                                                  | Premium only                                                                                                               | Premium only                                                                                                                                    |
| **Access Tiers**                | Hot, Cool, and Archive                                                                                                                                                         | N/A                                                                                                                                                                     | Hot and Cool                                                                                                                                                   | N/A                                                                                                                        | N/A                                                                                                                                             |
| **Scalability and Performance** | High scalability and performance with the latest features                                                                                                                      | Lower scalability and performance compared to GPv2                                                                                                                      | High scalability and performance, optimized for unstructured data                                                                                              | High performance for file shares with low latency                                                                          | High performance with low latency for block blobs                                                                                               |
| **Use Cases**                   | General-purpose storage for various data types and access patterns                                                                                                             | Legacy applications, general-purpose storage                                                                                                                            | Large-scale unstructured data storage, data lakes, backups                                                                                                     | File shares for applications, lift-and-shift, shared storage                                                               | Media streaming, data lakes, analytics, backup                                                                                                  |
| **Replication Options**         | LRS, ZRS, GRS, RA-GRS, GZRS, RA-GZRS                                                                                                                                           | LRS, ZRS, GRS, RA-GRS                                                                                                                                                   | LRS, ZRS, GRS, RA-GRS                                                                                                                                          | LRS                                                                                                                        | LRS                                                                                                                                             |
| **Pricing Model**               | Pay-as-you-go, based on storage capacity, transactions, and data egress                                                                                                        | Pay-as-you-go, based on storage capacity, transactions, and data egress                                                                                                 | Pay-as-you-go, based on storage capacity, transactions, and data egress                                                                                        | Pay-as-you-go, based on storage capacity and transactions                                                                  | Pay-as-you-go, based on storage capacity and transactions                                                                                       |
| **Features**                    | All latest features including soft delete, lifecycle management, tiering, and more                                                                                             | Basic features without the latest optimizations                                                                                                                         | Features specific to blob storage like soft delete, snapshots, and blob versioning                                                                             | Features specific to file storage like SMB protocol support, NTFS ACLs                                                     | High performance, low latency, optimized for large-scale data ingestion and analytics                                                           |
| **Redundancy Options**          | Local, Zone, Geo, Read-access Geo                                                                                                                                              | Local, Zone, Geo, Read-access Geo                                                                                                                                       | Local, Zone, Geo, Read-access Geo                                                                                                                              | Local                                                                                                                      | Local                                                                                                                                           |
| **SLA**                         | 99.9% availability for read and write operations                                                                                                                               | 99.9% availability for read and write operations                                                                                                                        | 99.9% availability for read and write operations                                                                                                               | 99.9% availability for read and write operations                                                                           | 99.9% availability for read and write operations                                                                                                |

### Key Points:

- **General Purpose v2 (GPv2)**: This is the most versatile and recommended storage account type, supporting all storage services and the latest features.
- **General Purpose v1 (GPv1)**: An older type of storage account, offering similar capabilities to GPv2 but without the latest features and optimizations.
- **Blob Storage**: Specifically optimized for storing unstructured data as blobs, with support for different access tiers (hot and cool).
- **File Storage**: Designed for fully managed file shares accessible via SMB protocol, ideal for lift-and-shift applications.
- **Block Blob Storage**: Optimized for high-performance scenarios requiring block blobs, such as media streaming and big data analytics.

Choosing the right type of storage account depends on the specific needs of your application, including performance requirements, data access patterns, and cost considerations.

# How to Create Storage Accounts

There are several tools that create a storage account. Your choice is typically based on if you want a Graphical User Interface or GUI, and whether you need automation.
The available tools are:

1. Azure portal: The Azure portal provides a GUI with explanations for each setting. This makes the portal easy to use and helpful for learning about the options.
2. Azure CLI (support automation), command-line interface: The Azure CLI in Azure PowerShell lets you write scripts while the Management Libraries allow you to incorporate the creation into client app.
3. Azure PowerShell (support automation)
4. Management Client Libraries (support automation)
   Storage accounts are typically based on an analysis of your data, so they tend to be relatively stable. As a result, storage account creation is usually a one-time operation done at the start of a project. For one-time activities, the portal is the most common choice.
   The rare cases where you need automation, the decision is between a programmatic API or a scripting solution. Scripts are typically faster to create and less work to maintain because there is no need for an integrated development environment, NuGet Packages or build steps. If you have an existing client application, the management libraries might be an attractive choice. Otherwise, scripts will likely be a better option.

# Types of Azure Storage

Azure storage includes four types of data.

1. There are Blobs which are massively scalable object store for text and binary data. These can include support for Azure data lake storage gen 2 (ADLS Gen 2).
2. Another data type is managed file shares for cloud or on premises deployments.
3. A third type includes queues which are a messaging store for reliable messaging between application components.
4. And there is table storage or a no sequel store for schema less storage of structured data.

All these data types in Azure storage are accessible from anywhere in the world over HTTP or HTTPS. Microsoft provides software development kits or SDK for Azure storage in various languages and arrest API. You can also visually explore your data right in the Azure portal.

## Azure blob storage

Azure blob storage is an object storage solution optimized for storing massive amounts of unstructured data, such as text or binary data. Blob storage is ideal for serving:

1. Images or documents directly to a browser including full static websites
2. storing files for distributed access
3. streaming video and audio
4. storing data for backup and restoration and Disaster recovery and archiving
5. storing data for analysis by on premises or Azure hosted service.

### Types of Blob Storge

1. Block blobs are used to hold text or binary files up to 5 terabytes, 50,000 blocks of 100 megabytes in size.
   The primary use case for block blobs is the storage of files that are read from beginning to end, such as media files or image files for websites. And they are named block blobs because files larger than 100 megabytes must be uploaded a small blocks. These blocks are then consolidated or committed into the final blob.
2. Page blobs are used to hold random access files up to 8 terabytes in size.
   Page Blobs are used primarily as the backing storage for the virtual hard disks or VHDs used to provide durable discs for Azure virtual machines or Azure VMs. They are named page blobs because they provide random read write access to 512-byte pages.
3. Finally, append blobs are made up of blocks like block blobs, but they are optimized for append operations.
   These blobs are frequently used for logging information from one or more sources into the same blob, and to give an example, you might write all your trace logging to the same append blob for an application running on multiple VMs. A single append blob can be up to 195 gigabytes.

## Azure File Storage

Azure files enables you to set up highly available network file shares that can be accessed using the standard server message block or SMB protocol. This means that multiple VMs can share the same files with both read and write access. You can also read the files using the REST interface and the storage client libraries. Finally, you can also associate a unique URL to any file to allow fine grained access to a private file for a set period.
File shares can be used for many common scenarios:

1. Storing shared configuration files for VMs tools or utilities so that everyone is using the same version
2. Log files such as diagnostics metrics crash dumps
3. Shared data between on premises applications and Azure VMs to allow migration of apps to the cloud over a period.

# Azure Queues

The Azure Queue service is used to store and retrieve messages. Queue messages can be up to 64 kilobytes in size and a queue can contain millions of messages. Finally, queues are used to store lists of messages to be processed asynchronously.
You can use queues to loosely connect different parts of your application together. For example:
We could perform image processing on the photos uploaded by our users.
Perhaps we want to provide some sort of face detection or tagging capability so people can search through all the images they have stored in our service.
And we could use queues to pass messages to our image processing service to let it know that new images have been uploaded and are ready for processing. This sort of architecture would allow you to develop and update each part of the service independently.

## Choosing Type of Storage Account

| Account type              | Description                                                                                                                                                                                                                                                                                                                                                  |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| General-purpose v2 (GPv2) | General-purpose v2 (GPv2) accounts are storage accounts that support all the latest features for blobs, files, queues, and tables. Pricing for GPv2 accounts has been designed to deliver the lowest per gigabyte prices.                                                                                                                                    |
| General-purpose v1 (GPv1) | General-purpose v1 (GPv1) accounts provide access to all Azure Storage services but may not have the latest features or the lowest per gigabyte pricing. For example, cool storage and archive storage aren't supported in GPv1. Pricing is lower for GPv1 transactions, so workloads with high churn or high read rates may benefit from this account type. |
| Blob storage accounts     | A legacy account type, blob storage accounts support all the same block blob features as GPv2, but they're limited to supporting only block and append blobs. Pricing is broadly like pricing for general-purpose v2 accounts.                                                                                                                               |

# Connecting a Storage Account

To work with data in a storage account, your app will need two pieces of data;

1. access key
2. REST API endpoint
   Each storage account has two unique access keys that are used to secure the storage account. If your app needs to connect to multiple storage accounts, your app will require an access key for each storage account.
   In addition to access keys for authentication to storage accounts, your app will need to know the storage service endpoints to issue the REST requests.
   The REST endpoint is a combination of your storage account name, the data type, and a known domain, for example, blobs, queues, table, and files. If you have a custom domain tied to Azure, then you can also create a custom domain URL for the endpoint.

Next up is storage account connection strings. The simplest way to handle access keys and endpoint URLs within applications is to use storage account connection strings. A connection string provides all needed connectivity information in a single text string. Azure storage connection strings look like the example provided, but with the access key and account name of your specific storage account.
There are several best practices to follow when working with secure access keys. Access keys are critical to providing access to your storage account, and as a result, should not be given to any system or person that you do not want to have access to your storage account. Remember that access keys are the equivalent of a username and password to access your computer.

Typically, storage account connectivity information is stored within an environment variable database or configuration file. It is important to note that storing this information in a configuration file can be dangerous if you include that file in source control and store it in a public repository. Don't forget that doing so is a common mistake. It means that anyone can browse your source code in the public repository and see your storage account connection information.

Each storage account has two access keys. The reason for this is to allow keys to be rotated or regenerated periodically as part of security best practice in keeping your storage account secure. This process can be done from:

1. the Azure Portal
2. the Azure CLI
3. PowerShell command-line tool

Rotating a key will invalidate the original key value immediately and will revoke access to anyone who obtained the key inappropriately.

With support for two keys, you can rotate keys without causing downtime in your applications that use them. Your app can switch to using the alternate access key while the other key is regenerated. If you have multiple apps using this storage account, they should all use the same key to support this technique.

Let's run through the basic idea.

1. First, update the connection strings in your application code to reference the secondary access key of the storage account.
2. Next, regenerate the primary access key for your storage account using the Azure Portal or command-line tool.
3. Then, update the connection strings in your code to reference the new primary access key.
4. Finally, regenerate the secondary access key in the same manner.

It's highly recommended that you periodically rotate your access keys to ensure they remain private, just like changing your passwords.

If you are using the key in a server application, you can use an Azure Key Vault to store the access key for you. Key Vaults include support to synchronize directly to the storage account and automatically rotate the keys periodically.

Finally, using a Key Vault provides an additional layer of security, so your app never has to work directly with an access key.
You can also maintain a secure account with shared access signatures.

Access keys are the easiest approach to authenticating access to a storage account. They provide full access to anything in the storage account, like a root password on a computer.

Storage accounts offer a separate authentication mechanism called shared access signatures that support exploration and limited permissions for scenarios where you need to grant limited access. You should use this approach when you are allowing other users to read and write data to your storage account.

# Azure Storage security feature

Azure storage accounts provide a wealth of security options that protect your cloud-based data. Azure services such as Blob storage, file share, table storage, and Data Lake store, all build on Azure storage. Because of this foundation, the services benefit from the fine-grain security controls in Azure storage. Imagine the network administrator at Contoso is auditing security of the assets within the domain. At the end of the audit, she needs to be satisfied that all the data stored in Azure strictly follows Contoso security policy. As Contoso's primary data consultant, you'll help the network administrator understand how Azure storage can help her meet Contoso security requirements.

Explore Azure Storage security features
Contoso relies heavily on massive amounts of data in Microsoft Azure storage. Contoso's as many applications rely on:

1. Blobs
2. unstructured table storage
3. Azure Data Lake
4. server message block, or SMB-based file shares

After Contoso's competitor has a data breach. Contoso tasks the network administrator to check the organization's data security. As Contoso's data consultant, you assure the network administrator that Azure storage accounts provide several high-level security benefits for the data in the cloud:

1. Protect the data at rest: All data written to Azure storage is automatically encrypted by storage, service encryption or SSE. With a 256-bit advanced encryption standard or AES cipher and is FIPS 140-2 compliant, SSE automatically encrypts data when writing it to Azure storage.
2. Protect the data in transit
3. Support browser cross domain access
4. Control who can access data
5. And audit storage access

When you read data from Azure storage, Azure storage decrypts the data before returning it. This process incurs no additional charges and doesn't degrade performance. It can't be disabled.

For virtual machines or VMS, Azure lets you encrypt virtual hard disks or VHDs by using Azure disk encryption.
And this encryption uses bit locker for Windows images or DM-crypt for Linux.

Azure key vault stores the keys automatically to help you control and manage the disk encryption keys and secrets. So even if someone gets access to the VHD image and downloads, they can't access the data on the VHD.

Keep your data secure by enabling transport level security between Azure and the client.

And always use https to secure communication over the public internet.

- When you call the rest APIs to access objects in storage accounts, you can enforce the use of https by requiring secure transfer for the storage account.

- After you enable secure transfer, connections that use http will be refused. And this flag will also enforce secure transfer over SMB by requiring SMB 3.0 for all file share amounts.

- CORS (Cross Origin resource sharing)
  Contoso stores several website asset types in Azure storage. These types include images and videos. To secure browser apps Contoso locks GET requests down to specific domains. Azure storage supports cross domain access through cross origin resource sharing or CORS. CORS uses http headers so that a web application at one domain can access resources from a server at a different domain.

- Finally, using CORS web apps ensures that they load only authorized content from authorized sources.
  CORS support is an optional flag you can enable on storage accounts. The flag has the appropriate headers when you use http get requests to retrieve resources from the storage account.

- RBAC or role based access control
  To access data in a storage account, the client makes a request over http or https. Every request for a secure resource must be authorized. This service ensures that the client has the permissions required to access the data.

You can choose from several access options. Arguably the most flexible option is role-based access.
Azure storage supports Azure Active Directory and role-based access control Or RBAC for both resource management and data operations.

To security principles you can assign RBAC roles that are scoped to the storage account.
Use Active Directory to authorize resource management operations such as configuration.

# Active Directory

Active Directory is supported for data operations on blob and queue storage. To a security principle or a managed identity for Azure resources, you can assign RBAC roles that are scoped to:

1. a subscription
2. a resource group
3. a storage account
4. an individual container or queue

Auditing is another part of controlling access. You can audit Azure storage access by using the built-in storage analytics service.

- **Storage analytics**, logs every operation in real time. And you can search the storage analytics logs for specific requests. Filter based on the authentication mechanism, the success of the operation and the resource that was accessed.

- **Storage account keys**
  Microsoft Azure storage accounts can create authorized apps in the active directory to control access to the data in blobs and queues. This authentication approach is the best solution for apps that use blob storage or queue storage.

For other storage models, clients can use a shared key or shared secret. This authentication option is one of the easiest to use and it supports blobs, files, queues, and tables.
The client embeds the shared key in the HTTP authorization header of every request, and the storage account validates the key. For example, an application can issue a GET request against a blob resource and HTTP headers control the version of the REST API, the date, and the encoded shared key.

In Azure storage accounts, shared keys are called storage account keys. Azure creates two of these keys, primary and secondary, for each storage account you create.
The keys give access to everything in the account. You'll find the storage account keys in the Azure portal view of the storage account. Under Security and Networking, select Access Keys. The storage account has only two keys and they provide full access to the account. Because these keys are powerful, use them only with trusted in-house applications that you control completely. If the keys are compromised, change the key values in the Azure portal.
Here are several reasons to regenerate your storage account keys.
For security reasons, you might regenerate keys periodically. If someone hacks into an application and gets the key that was hard coded or saved in a configuration file, regenerate the key. The compromised key can give the hacker full access to your storage account.

Finally, if your team is using a storage explorer application that keeps the storage account key and one of the team members leaves, regenerate the key. Otherwise, the application will continue to work, giving the former team member access to your storage account.

To refresh keys, change each trusted app to use the secondary key. Refresh the primary key in the Azure portal. Consider this as the new secondary key value. And after you refresh keys, any client that attempts to use the old key value will be refused. Make sure you identify all clients that use the shared key and update them to keep them operational.

## Access control and threat protection

As a best practice, you shouldn't share storage account keys with external third-party applications. And if these apps need access to your data, then you'll need to secure their connections without using storage account keys.

### How to share resources with Untrusted Clients ?

For untrusted clients, use **Shared Access Signature or SAS**. The SAS is a string that contains a security token that can be attached to a URL. And use an SAS to delegate access to storage objects. And specify constraints such as the permissions and the time range of access.

You can give a customer an SAS token, for example, so they can upload pictures to a file system in blob storage. And separately you can give a web app permission to read those pictures.

In both cases, you allow only the access that the application needs to do the task. As a best practice, you shouldn't share storage account keys with external third-party applications. And if these apps need access to your data, then you'll need to secure their connections without using storage account keys.

For untrusted clients, use Shared Access Signature or SAS. The SAS is a string that contains a security token that can be attached to a URL. And use an SAS to delegate access to storage objects and specify constraints such as the permissions and the time range of access.

So now that you know what shared access signatures are, take a moment to explore two different types:

1. service level SAS : You can use a service-level SAS to allow access to specific resources in a storage account. And you would also use this type of SAS for example to allow an app to retrieve a list of files in a file system or to download a file.
2. account level SAS : Use an account level SAS to allow access to anything that a service level SAS can allow plus additional resources and abilities. And you can use an account level SAS to allow the ability to create file systems. You typically use a SAS for a service where users read and write their data to your storage account.

Accounts that store user data have typical designs:

1. a front-end proxy service
2. a lightweight or SAS provider service

In the first design clients upload and download data through a front-end proxy service which performs authentication. This front-end proxy service has the advantage of allowing validation of business rules. And if the service must handle large amounts of data or high-volume transactions, you might find it complicated or expensive to scale this service to match demand.

A lightweight service authenticates the client as needed. Next, it generates an SAS. After receiving the SAS the client can access storage account resources directly.

finally, the SAS defines the client's permissions and access interval. It reduces the need to write all data through the front-end proxy service.

### Control network access to a storage account

By default, storage accounts accept connections from clients on any network. To limit access to selected networks, you must first change the default action. You can restrict access to:

1. specific IP addresses
2. ranges
3. virtual networks
   Be careful as changing network rules can affect your application's ability to connect to Azure Storage. If you set the default network rule to deny, you'll block all access to the data unless specific network rules grant access. Before you change the default rule to deny access, be sure to use network rules to grant access to any allowed networks.

Next, explore the methods for managing default network access rules. You can manage default network access rules for storage accounts through the Azure portal. Using PowerShell and the Azure CLI. If you decide to use the Azure portal, then follow these steps to change default network access. Go to the storage account you want to secure, select Networking. To restrict traffic from selected networks, select Selected Networks. To allow traffic from all networks, select All Networks.

Finally, to apply your changes, select Save.
Advanced threat protection for Azure Storage
Microsoft Azure defender for storage provides an extra layer of security intelligence that detects unusual and potentially harmful attempts to access or exploit storage accounts. This layer of protection allows you to address threats without being a security expert or managing security monitoring systems. This does incur an additional cost with its own pricing structure.
Security alerts are triggered when anomalies in activity occur. And these security alerts are integrated with Azure security center and are also sent via email to subscription administrators with details of suspicious activity and recommendations on how to investigate and remediate threats.

Azure defender for storage is currently available for:

1. blob storage
2. Azure Files
3. Azure data Lake Storage Gen2

Account types that support Azure defender include:

1. general purpose V2
2. block blob
3. blob storage accounts.

And Azure defender for storage is available in all public clouds and US government clouds, but not in other sovereign or Azure government cloud regions.

Accounts with hierarchical name spaces enabled for data lake storage support transactions using both the Azure blob storage APIs and the data lake storage APIs. And Azure file shares support transactions over SMB.
You can turn on Azure defender for storage in the Azure portal through the configuration page of the Azure storage account or in the advanced security section of the Azure portal. To turn on Azure defender for storage, follow these steps, first launch the Azure portal. Next, navigate to your storage account, then under settings, select advanced security. Finally, select enable Azure defender for storage.
So how does the Azure environment handle security anomalies?
When storage activity anomalies occur, you receive an email notification with information about the suspicious security event. A typical email will include the:

1. nature of the anomaly
2. the storage account
3. Name
4. the event times
5. storage type
6. potential causes
7. guidance around investigation
8. remediation steps.

Finally, the email will also include details about possible causes and recommended actions to investigate and mitigate the potential threat. You can review and manage your current security alerts from Azure security centers security alerts tile. Selecting a specific alert provides details and actions for investigating the current threat and addressing future threats.

### Azure Data Lake Storage security features

Microsoft Azure Data Lake Storage Generation 2 or Gen2 provides a first-class data lake solution that enables enterprises to consolidate their data.
It's built on Azure Blob Storage, so it inherits all the security features you reviewed in this module.
Along with role-based access control or RBAC, Azure Data Lake Storage Gen2 provides Access Control Lists, ACLs, that are POSIX (Portable Operating System Interface)-compliant, and that restrict access to only authorized users, groups, or service principles.
It applies restrictions in a way that's:

1. Flexible
2. fine-grained
3. Manageable

Azure Data Lake Storage Gen2 authenticates through Azure Active Directory OAuth 2.0 bearer tokens.

This allows for flexible authentication schemes, including federation with Azure AD Connect and multi-factor authentication that provides stronger protection than just passwords.

More significantly, these authentication schemes are integrated into the main analytic services that use the data. These services include:

1. Azure Databricks
2. HDInsight
3. Azure Synapse Analytics
4. management tools such as Azure Storage Explorer are also included

After authentication finishes, permissions are applied at the finest granularity to ensure the right level of authorization for an enterprise's big data assets. The Azure Storage end-to-end encryption of data and transport layer protections complete the security shield for an Enterprise Data Lake. The same set of analytics engines and tools can take advantage of these additional layers of protection resulting in complete protection of your analytics pipelines.

Summary
Authorization is supported by:

1. Azure Active Directory credentials for blobs and queues
2. a valid account access key
3. a shared access signature, SAS token
4. Data Encryption is enabled by default
5. You can proactively monitor systems by using

# Advanced Threat Protection.

Introduction to Blob storage
Blobs give you file storage in the cloud and an API that lets you build apps to access the data. Suppose you work at an augmented reality gaming company and your game runs on every mobile platform. You want to add a new feature to let users record video clips of their gameplay and upload the clips to your servers. Users will be able to watch clips directly in the game or through your website. You plan to log every upload and viewing for use in analytics and for traceability. You need a storage solution that can handle thousands of simultaneous uploads, massive amounts of video data and constantly growing log files. And you also need to add the viewing functionality to all your mobile apps and your website. So, you want API access from multiple platforms and languages here, you will see how Azure blob storage could be appropriate for this app.

What are blobs?
Microsoft Azure Blobs are files for the Cloud. The term BLOB is an acronym for Binary Large Object. Apps work with Blobs in much the same way as they would work with files on a disk, like reading and writing data.
Unlike a local file, Blobs can be reached from anywhere with an Internet connection.

Azure Blob Storage is unstructured, meaning that there are no restrictions on the kind of data it can hold. For example, Blob can hold a PDF document, a JPEG image, a JSON file, video content, and so on. Blobs aren't limited to common file formats.

A Blob could contain gigabytes of binary data streamed from a scientific instrument, an encrypted message for another application, or data in a custom format for an app you're developing.

Blobs are usually not appropriate for structured data that needs to be queried frequently. They have higher latency than memory and local disk and don't have the indexing features that make databases efficient at running queries.

Blob Storage is ideal for storing:

1. up to eight terabytes of data for virtual machines
2. storing data for analysis by an On-premises or Azure hosting service
3. storing data for backup and restore disaster recovery and archiving
4. Streaming video and audio
5. storing files for distributed access
6. serving images or documents directly to a browser
   Many Azure components use Blobs behind the scenes. For example:
7. Azure Cloud Shell stores your files and configuration in Blobs
8. Azure Virtual Machines uses Blobs for hard disk storage.

Also, Blobs are frequently used in combination with databases to store non-query-able data. For example, an app with a database of user profiles could store profile pictures in Blobs. Each user record in the database would include the name or URL of the Blob containing the user's picture.

In Blob Storage, every Blob lives inside a Blob container. You can store an unlimited number of Blobs in a container and an unlimited number of containers in a storage account.
Remember that containers are flat. They can only store Blobs, not other containers. Blobs and containers support metadata in the form of name-value string pairs. Your apps can use metadata for anything you like. A human-readable description of a Blob's contents to be displayed by the app or a string that your app uses to determine how to process the Blob's data and so on.
Finally, Blob Storage does not provide any mechanism for searching or sorting Blobs by metadata. For information about using Azure Cognitive Search, at the end of this module, see the further reading section. The Blob Storage API is REST-based and supported by client libraries in many popular languages. It lets you write apps that create and delete Blobs and containers, upload and download Blob data, and list the Blobs in a container.

### Design a storage organization strategy

When designing an app that needs to store data, it's important to think about how the app is going to organize data across Microsoft Azure storage accounts, containers, and blobs. A single storage account is flexible enough to organize your blobs however you like. You should use additional storage accounts as necessary to logically separate costs and control access to data. The nature of your app and the data that it stores should drive your strategy for naming and organizing containers and blobs.
Apps using blobs as part of a storage scheme that includes a database often don't need to rely heavily on organization, naming, or metadata to indicate anything about their data. Such apps commonly use identifiers like GUIDs as blob names and reference these identifiers in database records. The app will use the database to determine where blobs are stored and the kind of data they contain.
Other apps may use Azure Blob Storage more like a personal file system where container and blob names are used to indicate meaning and structure. Blob names in these kinds of apps will often look like traditional filenames. They include file name extensions like .JPEG to indicate what kind of data they contain.

Finally, they'll use virtual directories to organize blobs and will frequently use metadata tags to store information about blobs and containers. There are a few key things to consider when deciding how to organize and store blobs and containers.
Container and blob names must conform to a set of rules, including length limitations and character restrictions. By default, all blobs require authentication to access. However, individual containers can be configured to allow public downloading of their blobs without authentication. This feature supports many use cases, such as hosting static website assets and sharing files. This is because downloading blob contents works the same way as reading any other kind of data over the web. You just point a browser or anything that can make a GET request at the blob URL.

Enabling public access is important for scalability because data downloaded directly from blob storage doesn't generate any traffic in your server-side app. Even if you don't immediately take advantage of public access, or if you will use a database to control data access via your app, plan on using separate containers for data that you want to be publicly available. Blobs in a container configured for public access can be downloaded without any kind of authentication or auditing by anyone who knows their storage URLs.

Finally, never put blob data in a public container that you don't intend to share publicly. In addition to public access, Azure has a shared access signature feature that allows fine-grained permissions control on containers. Don't forget the Precision Access Control enables scenarios that further improve scalability. Thinking about containers, a security boundary in general is a helpful guideline.

Technically, containers are flat and do not support any kind of nesting or hierarchy. But, if you give your blobs hierarchical names that look like file paths such as finance/budget//2017/q1.xls, the API's listing operation can filter results to specific prefixes. This enables you to navigate the list as if it were a hierarchical system of files and folders. This feature is often called **Virtual Directories** because some tools and Client Libraries use it to visualize and navigate blob storage as if it were a file system. Each folder navigation triggers a separate call to list the blobs in that folder. Using names that are like filenames for blobs is a common technique for organizing and navigating complex blob data.
There are three different kinds of blobs you can store data in. They are:

1. block blobs:
   a. Block blobs are composed of blocks of different sizes that can be uploaded independently and in parallel.

Writing to a block blob involves uploading data to blocks and committing them to the blob. The block is the smallest amount of data that can be read or written as an individual unit. Block blobs are best used to store discrete, large binary objects that change infrequently.  
2. Append
a. Append blobs are specialized block blobs that support only appending new data, not updating or deleting existing data. But they're very efficient at it. Append blobs are great for scenarios like storing logs are writing streamed data. 3. page blobs
a. Finally, page blobs are designed for scenarios that involve random access reads and writes. Page blobs are used to store the virtual hard disk or VHD files used by Azure Virtual Machines but they're great for any scenario that involves random access.
Block blobs are the best choice for most scenarios that don't specifically call for append or page blobs. Their block-based structure supports very fast uploads and downloads and efficient access to individual pieces of a blob. The process of managing and committing blocks is automatically handled by most Client Libraries. Some will also handle parallel uploads and downloads to maximize performance.

Here is a detailed comparison between Azure Data Lake Storage (ADLS) Gen1 and Gen2 in a markdown table:

| Feature                              | ADLS Gen1                                                                                                                           | ADLS Gen2                                                                                                                                           |
| ------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Overview**                         | A standalone service designed for big data analytics.                                                                               | Built on top of Azure Blob Storage, offering a hierarchical namespace. Combines capabilities of Azure Blob Storage and Azure Data Lake.             |
| **Underlying Storage**               | Proprietary storage technology.                                                                                                     | Built on Azure Blob Storage, leveraging its scalability and durability.                                                                             |
| **Hierarchical Namespace**           | Yes, supports hierarchical namespace for organizing data in directories and subdirectories.                                         | Yes, supports hierarchical namespace, enabling efficient data management and improved performance for analytics workloads.                          |
| **Integration with Azure Ecosystem** | Limited integration with other Azure services.                                                                                      | Deep integration with Azure Blob Storage, supporting a wide range of Azure services and features (e.g., Azure Databricks, Azure Synapse Analytics). |
| **Access Control**                   | Role-based access control (RBAC) and access control lists (ACLs) for fine-grained security.                                         | Enhanced security with RBAC, ACLs, and shared key/Shared Access Signature (SAS) token support.                                                      |
| **Data Management**                  | Limited management tools and features.                                                                                              | Advanced data management capabilities, including blob lifecycle management, soft delete, and versioning.                                            |
| **Scalability**                      | Scalable but not as flexible as Gen2.                                                                                               | Highly scalable with Azure Blob Storage's scalability and performance features.                                                                     |
| **Performance**                      | Optimized for large-scale analytics, but may have performance limitations for certain workloads.                                    | Improved performance for big data analytics and faster data processing due to hierarchical namespace and integration with Blob Storage.             |
| **Data Redundancy**                  | Locally-redundant storage (LRS), geographically-redundant storage (GRS), and read-access geographically-redundant storage (RA-GRS). | Same redundancy options as Blob Storage: LRS, ZRS (Zone-redundant storage), GRS, and RA-GRS.                                                        |
| **Pricing Model**                    | Pay-as-you-go based on storage capacity and transactions.                                                                           | More cost-effective pricing model, leveraging Blob Storage's pricing. Supports hot, cool, and archive tiers for cost optimization.                  |
| **Protocol Support**                 | HDFS-compatible, WebHDFS, REST API.                                                                                                 | Supports HDFS, REST API, and Azure Blob Storage APIs (Blobfuse, ADLS Gen2 REST API).                                                                |
| **Security Features**                | Encryption at rest, TLS for data in transit.                                                                                        | Advanced security features including encryption at rest, customer-managed keys, Azure AD integration, and more.                                     |
| **Use Cases**                        | Primarily designed for big data analytics workloads, Hadoop-based applications.                                                     | Suitable for a wide range of scenarios, including big data analytics, data warehousing, and general-purpose object storage.                         |
| **Availability**                     | General Availability.                                                                                                               | General Availability with additional features and better integration within Azure.                                                                  |

### Key Differences

1. **Architecture and Integration**:

   - **ADLS Gen1**: A standalone service specifically for big data analytics.
   - **ADLS Gen2**: Built on Azure Blob Storage, combining the benefits of both Blob Storage and ADLS, with deep integration with Azure services.

2. **Hierarchical Namespace**:

   - Both versions support a hierarchical namespace, but ADLS Gen2 offers improved performance and management capabilities due to its integration with Blob Storage.

3. **Scalability and Performance**:

   - **ADLS Gen1**: Scalable but may have performance limitations.
   - **ADLS Gen2**: Highly scalable with superior performance due to Blob Storage's underlying architecture.

4. **Security and Access Control**:

   - **ADLS Gen1**: Basic RBAC and ACLs.
   - **ADLS Gen2**: Enhanced security with RBAC, ACLs, and additional features like shared key and SAS token support.

5. **Pricing and Cost Optimization**:

   - **ADLS Gen1**: Traditional pay-as-you-go model.
   - **ADLS Gen2**: More cost-effective, with support for different access tiers (hot, cool, archive) to optimize costs based on usage patterns.

6. **Redundancy Options**:

   - **ADLS Gen1**: Supports LRS, GRS, and RA-GRS.
   - **ADLS Gen2**: Same redundancy options as Blob Storage, including ZRS.

7. **Protocol and API Support**:

   - **ADLS Gen1**: Supports HDFS-compatible APIs.
   - **ADLS Gen2**: Supports HDFS, Blob Storage APIs, and REST API, offering more flexibility.

8. **Data Management**:
   - **ADLS Gen1**: Basic data management tools.
   - **ADLS Gen2**: Advanced data management features, including lifecycle management, soft delete, and versioning.

### Conclusion

Azure Data Lake Storage Gen2 is the preferred choice for new projects due to its enhanced features, better performance, scalability, and cost-effectiveness. It provides a unified storage solution that leverages the capabilities of Azure Blob Storage while offering advanced data management and security features.
