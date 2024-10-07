![alt text](image.png)

# Integration Runtimes

- Azure IR network environment: Azure Integration Runtime supports connecting to data stores and computes services with public accessible endpoints. Enabling Managed Virtual Network, Azure Integration Runtime supports connecting to data stores using private link service in private network environment.

- Self-Hosted Integration runtime: Running copy activity between a cloud data stores and a data store in private network. Use self-hosted integration runtime to support data stores that require bring-your-own driver, such as SAP Hana, MySQL, etc. For more information, see supported data stores.

- Azure-SSIS integration runtime: To lift and shift existing SSIS workload, you can create an Azure-SSIS IR to natively execute SSIS packages.

![alt text](image-1.png)

![alt text](image-2.png)

![alt text](image-3.png)



![alt text](image-4.png)

![alt text](image-5.png)

Here's a brief difference between **Azure Event Hubs** and **Azure Event Grid**:

- **Azure Event Hubs**: 
  - **Purpose**: Data streaming and event ingestion service.
  - **Use Case**: High-throughput scenarios like telemetry, log data, and real-time analytics.
  - **Key Feature**: Handles millions of events per second for processing by analytics systems.

- **Azure Event Grid**: 
  - **Purpose**: Event routing service.
  - **Use Case**: Trigger workflows or actions based on events, enabling reactive architectures.
  - **Key Feature**: Routes events to handlers (e.g., Azure Functions) in near real-time.

In summary, **Event Hubs** is for **event streaming** and **Event Grid** is for **event routing and triggering actions**.
![alt text](image-6.png)

![alt text](image-7.png)

![alt text](image-8.png)

![alt text](image-9.png)

![alt text](image-10.png)

![alt text](image-11.png)

![alt text](image-12.png)

![alt text](image-13.png)

![alt text](image-14.png)


# References

- https://learn.microsoft.com/en-us/azure/data-factory/concepts-integration-runtime#azure-integration-runtime
- https://learn.microsoft.com/en-us/azure/storage/blobs/data-lake-storage-use-databricks-spark
- https://learn.microsoft.com/en-us/azure/data-factory/how-to-create-event-trigger?tabs=data-factory
