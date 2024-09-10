![alt text](image.png)

![alt text](image-1.png)

![alt text](image-2.png)

![alt text](image-3.png)

![alt text](image-4.png)

![alt text](image-5.png)

![alt text](image-6.png)

![alt text](image-7.png)
![alt text](image-8.png)

![alt text](image-9.png)

![alt text](image-10.png)

![alt text](image-11.png)

| Comparison                                       | View                                       | Materialized View                                                                                                       |
| ------------------------------------------------ | ------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------- |
| View definition                                  | Stored in dedicated SQL pool.              | Stored in dedicated SQL pool.                                                                                           |
| View content                                     | Generated each time when the view is used. | Pre-processed and stored in dedicated SQL pool during view creation. Updated as data is added to the underlying tables. |
| Data refresh                                     | Always updated                             | Always updated                                                                                                          |
| Speed to retrieve view data from complex queries | Slow                                       | Fast                                                                                                                    |
| Extra storage                                    | No                                         | Yes                                                                                                                     |
| Syntax                                           | `CREATE VIEW`                              | `CREATE MATERIALIZED VIEW AS SELECT`                                                                                    |

![alt text](image-12.png)

![alt text](image-13.png)

![alt text](image-14.png)

![alt text](image-15.png)

![alt text](image-16.png)

# References

- https://learn.microsoft.com/en-us/azure/stream-analytics/stream-analytics-real-time-fraud-detection
- https://learn.microsoft.com/en-us/azure/synapse-analytics/sql-data-warehouse/performance-tuning-materialized-views
- https://learn.microsoft.com/en-us/azure/synapse-analytics/monitoring/apache-spark-applications
