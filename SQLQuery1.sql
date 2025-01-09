CREATE DATABASE TestDB;
USE TestDB;
CREATE TABLE data (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    Email NVARCHAR(50) NOT NULL UNIQUE,
    Phone NVARCHAR(15) NOT NULL,
    Age INT NOT NULL
);

INSERT INTO data (Name, Email, Phone, Age) 
VALUES 
('John Doe', 'john.doe@example.com', '1234567890', 25),
('Jane Smith', 'jane.smith@example.com', '0987654321', 30),
('Alice Johnson', 'alice.johnson@example.com', '1122334455', 22);

SELECT * FROM data;



