# Introduction

CDC (Change Data Capture) is a process of identifying and capturing changes made to a database and then delivering those changes to a target system. It’s widely used in real-time data replication, synchronization, and ETL (Extract, Transform, Load) processes, ensuring that data across different systems is kept consistent and up-to-date.

CDC plays a crucial role in modern architectures that require real-time data processing, particularly in industries where timely information can make a significant impact, such as finance, retail, and technology platforms.

# How CDC Works:
CDC captures changes to data (inserts, updates, and deletes) as they happen in a source system (usually a database). These changes are then propagated to other systems (such as data warehouses, real-time analytics platforms, or other databases) so that all systems remain synchronized without needing to replicate the entire data set constantly.

There are various ways CDC can be implemented:

- **Log-based CDC**: This method uses the database's transaction logs to detect changes.
- **Trigger-based CDC**: Database triggers detect changes by executing custom code after data modification.
- **Table comparison**: Regular comparisons are made between old and new versions of data, identifying the differences.

# CDC Solution:

- When a user makes a post, CDC detects this change in the database (new post insert).
- This change is propagated in real time to the notification system, which triggers alerts for the user's followers.
- The notification system can also store a history of these updates for future reference (e.g., showing all recent activity on a user's timeline).

# Benefits of CDC:
- Efficiency: Only changes are captured and propagated, reducing the need to replicate entire datasets.
- Real-Time Data Availability: Changes are available to all connected systems as soon as they occur.
- Data Consistency: Keeps systems synchronized and up-to-date, reducing the risk of data discrepancies.
- Scalability: CDC scales well as data volume grows, ensuring continuous synchronization without manual intervention.

# Common Use Cases for CDC:
- Data replication and synchronization: Between on-premises and cloud databases or between multiple regions.
- ETL/ELT processes: Continuous ingestion of real-time changes for analytical systems.
- Microservices: Keeping independent services synchronized when changes happen in a monolithic database.
- Event-driven architecture: Where changes in the database act as triggers for other actions across services.

# Real World Examples

## E-commerce Inventory Management


**Scenario**: An online retail company needs to ensure that inventory levels are always up-to-date across multiple systems: the website, the warehouse system, and the shipping system.

**Problem**: When a customer buys an item on the website, the inventory level should update not only on the website but also in the warehouse system (so the warehouse knows how much stock is available) and the shipping system (to ensure it can be packed and shipped).

CDC Solution:

- Every time an order is placed, CDC detects changes to the inventory in the central database (insert, update, or delete operations).

- These changes are then automatically propagated in real time to the warehouse system and shipping system, keeping the inventory consistent across all platforms.
- Log-based CDC can be used here, where every inventory change recorded in the transaction logs is captured and sent to the appropriate systems.



# Change Data Capture Methods

There are multiple common Change Data Capture methods that you can implement depending on your application requirements and tolerance for performance overhead. Here are the common methods, how they work, and their advantages as well as shortcomings.

## Audit Columns

By using existing “LAST_UPDATED” or “DATE_MODIFIED” columns, or by adding them if not available in the application, you can create your own change data capture solution at the application level. This approach retrieves only the rows that have been changed since the data was last extracted.

## Table Deltas
You can use table delta or ‘tablediff’ utilities to compare the data in two tables for non-convergence. Then you can use additional scripts to apply the deltas from the source table to the target as another approach to change data capture. There are several examples of SQL scripts that can find the difference of two tables.

- LEFT JOINS
- MINUS QUERIES

## Trigger-based CDC

Another method for building change data capture at the application level is defining database triggers and creating your own change log in shadow tables. Triggers fire before or after INSERT, UPDATE, or DELETE commands (that indicate a change) and are used to create a change log. Operating at the SQL level, some users prefer this approach. Some databases even have native support for triggers.

However, triggers are required for each table in the source database, and they have greater overhead associated with running triggers on operational tables while the changes are being made. In addition to having a significant impact on the performance of the application, maintaining the triggers as the application change leads to management burden.


## Log-Based Change Data Capture

Databases contain transaction logs (also called redo logs) that store all database events allowing for the database to be recovered in the event of a crash. With log-based change data capture, new database transactions – including inserts, updates, and deletes – are read from source databases’ native transaction logs.