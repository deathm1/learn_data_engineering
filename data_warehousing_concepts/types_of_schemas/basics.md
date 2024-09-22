# Fact Table vs Dimensional Table

| **Criteria**            | **Fact Table**                                            | **Dimension Table**                                   |
|-------------------------|-----------------------------------------------------------|-------------------------------------------------------|
| **Definition**           | A table that stores quantitative data for analysis, often referred to as metrics or measurements. | A table that contains descriptive attributes (context) related to the facts. |
| **Data Type**            | Contains numeric or measurable data (facts) such as sales, revenue, quantity, etc. | Contains descriptive data (textual or categorical) such as product names, dates, and geographical locations. |
| **Granularity**          | Low granularity, stores data at the most detailed (transactional) level. | Higher granularity, stores data at aggregated levels (e.g., by product, date, or region). |
| **Purpose**              | Used for analysis and reporting, answers "what happened?" | Provides the context for analysis, answers "who, what, where, when, how?" |
| **Primary Key**          | Typically uses a composite key made of foreign keys from related dimension tables. | Uses a surrogate or natural primary key that uniquely identifies each record. |
| **Foreign Keys**         | Contains foreign keys linking to dimension tables. | Does not contain foreign keys but acts as a reference for fact tables. |
| **Examples**             | Sales Fact Table: Order ID, Date ID, Product ID, Revenue, Quantity | Date Dimension Table: Date ID, Day, Month, Year |
| **Data Volume**          | Fact tables usually have a large number of rows as they store historical data over time. | Dimension tables tend to have fewer rows since they store unique descriptions. |
| **Type of Data**         | Transactional data (e.g., order quantities, amounts, etc.) | Descriptive, categorical data (e.g., product descriptions, employee names, etc.) |
| **Updates**              | Fact tables are usually append-only, updated by adding new transactions. | Dimension tables may require periodic updates (e.g., adding new products or regions). |
| **Aggregation**          | Data can be aggregated (sum, average, count) for analysis. | No aggregation; provides detailed attributes for grouping or filtering. |

