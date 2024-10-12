
CREATE TABLE [logging].[system_logs] (
    log_id INT IDENTITY(1,1) PRIMARY KEY,
    log_type_id INT NOT NULL,
    log_source NVARCHAR(100) NOT NULL,
    log_message NVARCHAR(500) NOT NULL,
    log_date DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (log_type_id) REFERENCES [logging].[log_type_lookup] (log_type_id)
);


CREATE TABLE [logging].[log_type_lookup] (
    [log_type_id] INT IDENTITY(1,1) PRIMARY KEY,
    [log_type_name] NVARCHAR(50),
    [log_type_desc] NVARCHAR(100)
);


