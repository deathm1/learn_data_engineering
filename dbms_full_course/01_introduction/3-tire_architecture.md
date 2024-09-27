# Types of DBMS Architecture

There are several types of DBMS Architecture that we use according to the usage requirements. Types of DBMS Architecture are discussed here.

## 1-Tier Architecture

- **1-Tier Architecture**: Database is directly accessible to the user.
- **Components**: Client, server, and database reside on the same machine.
- **Use Case**: Commonly used for learning SQL (e.g., setting up a local SQL server).
- **Interaction**: Allows direct interaction with the relational database to execute operations.
- **Industry Preference**: Rarely used in professional settings; typically replaced by 2-Tier and 3-Tier Architectures for better scalability and organization.

### Advantages of 1-Tier Architecture

Below mentioned are the advantages of 1-Tier Architecture.

- Simple Architecture: 1-Tier Architecture is the most simple architecture to set up, as only a single machine is required to maintain it.
- Cost-Effective: No additional hardware is required for implementing 1-Tier Architecture, which makes it cost-effective.
- Easy to Implement: 1-Tier Architecture can be easily deployed, and hence it is mostly used in small projects.

![alt text](image-2.png)

## 2-Tier Architecture

- **Model**: Similar to a basic client-server architecture.
- **Communication**: Client directly interacts with the database on the server.
- **APIs**: Uses ODBC and JDBC for database interaction.
- **Server Responsibilities**: Handles query processing and transaction management.
- **Client Responsibilities**: Runs user interfaces and application programs.
- **Connection**: Client establishes a connection to communicate with the DBMS.
  
### Advantages:
- **Ease of Maintenance**: Simplified management and understanding of the system.
- **Compatibility**: Works well with existing systems.

### Disadvantages:
- **Performance**: Poor scalability with a large number of users.

![alt text](image-3.png)

## 3-Tier Architecture

1. **Intermediate Layer**: There is an additional layer between the client and server.
2. **Client-Server Interaction**: The client does not directly communicate with the server; it communicates with the application server.
3. **Application Server Role**: The application server handles communication with the database system.
4. **Data Processing**: Query processing and transaction management occur after the application server interacts with the database.
5. **Data Exchange**: The intermediate layer exchanges partially processed data between the client and server.
6. **Use Case**: Commonly used in large web applications.


![alt text](image-4.png)

# 3-Tier Architecture in DBMS

![alt text](image.png)

## Database Levels

- **Physical Level:** Details where database objects are stored, focusing on the data's physical storage in devices like disks. Users are unaware of these locations.
- **Conceptual Level:** Represents data in database tables (e.g., STUDENT and COURSE tables) that users can see, while storage details remain hidden. It describes the types of data stored in the database.
- **External Level:** Provides specific views of data based on user needs, such as FACULTY viewing course details or STUDENTS accessing academic and account information. This level emphasizes data abstraction.

## Data Independence

- **Physical Data Independence:** Changes in the physical storage of tables and indexes do not impact the conceptual or external views. This is typically easy to implement.

- **Conceptual Data Independence:** Changes in the conceptual schema should not affect the external schema, like adding or removing table attributes without altering user views. This is more challenging to achieve than physical data independence.

## 3-Tier Architecture

The 3-tier architecture in DBMS separates user interface, application processing, and data management into three distinct layers, enhancing scalability, flexibility, and security. Here’s a brief overview:

- **Presentation Tier:** The user interface layer that displays data and accepts user input. It can be a web browser, mobile app, or desktop application.

- **Application Tier:** The middle layer responsible for **processing business logic**. It communicates with both the presentation tier for user input and the data management tier for data retrieval and storage. This tier may include application servers, web servers, or APIs.

- **Data Management Tier:** The bottom layer focused on **data storage and management**. It includes databases, data warehouses, or data lakes and communicates with the application tier to handle data operations.

![alt text](image-1.png)

## Benefits of 3-Tier Architecture

- **Scalability:** Each layer (application processing and data management) can be scaled independently, allowing for easier resource management.

- **Flexibility:** Layers can be replaced or upgraded without impacting the other layers, facilitating maintenance and enhancements.

- **Security:** An additional security layer isolates the data management tier from the application and presentation tiers, reducing unauthorized access risks.
