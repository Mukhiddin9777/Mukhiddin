--Question-1: Define the following terms: data, database, relational database, and table. 
--1. Data: Data refers to raw facts and figures that can be processed to generate information. It can be in various forms such as numbers, text, images, and more.

--2. Database: A database is an organized collection of structured information or data, typically stored electronically in a computer system. Databases are managed by Database Management Systems (DBMS).

--3. Relational Database: A relational database is a type of database that stores data in tables (relations) and allows for relationships between the tables. Each table consists of rows and columns, where each row represents a record and each column represents an attribute of the data.

--4. Table: A table is a set of data elements (values) that is organized using a model of vertical columns and horizontal rows. Each table in a relational database represents a different entity, and each column in a table represents a specific attribute of that entity.


--Question-2: List five key features of SQL Server.
--Key Features of SQL Server

--1. High Availability: SQL Server offers features like Always On Availability Groups, which provide high availability and disaster recovery solutions.

--2. Scalability: SQL Server can handle large volumes of data and a high number of concurrent users, making it suitable for enterprise-level applications.

--3. Security: SQL Server includes built-in security features such as encryption, authentication, and role-based access control to protect sensitive data.

--4. Integration Services: SQL Server provides tools for data integration and transformation, enabling users to extract, transform, and load (ETL) data from various sources.

--5. Advanced Analytics: SQL Server supports advanced analytics through integration with R and Python, allowing users to perform complex data analysis and machine learning.


--Question-3: What are the different authentication modes available when connecting to SQL Server? (Give at least 2)
--▎Authentication Modes in SQL Server

--1. Windows Authentication: This mode uses Windows accounts to authenticate users. It is considered more secure as it leverages the existing Windows security model.

--2. SQL Server Authentication: This mode requires users to provide a username and password specific to SQL Server. It is useful for applications that need to connect without relying on Windows accounts.


--Question-4: Create a new database in SSMS named SchoolDB.
Create database SchoolDB

Use SchoolDB


-- Question-5: Write and execute a query to create a table called Students with columns: StudentID (INT, PRIMARY KEY), Name (VARCHAR(50)), Age (INT).  
Create table Students (StudentID int, Name varchar(50), Age int)

-- Question-6: Describe the differences between SQL Server, SSMS, and SQL.
--Differences Between SQL Server, SSMS, and SQL

--• SQL Server: A relational database management system developed by Microsoft that allows for the creation, management, and manipulation of databases.
  
--• SSMS (SQL Server Management Studio): A graphical user interface tool used to manage SQL Server databases. It allows users to execute queries, manage database objects, and perform administrative tasks.

--• SQL (Structured Query Language): A standard programming language used to communicate with relational databases. It is used for querying, updating, inserting, and deleting data in databases.


-- Question-7: Research and explain the different SQL commands: DQL, DML, DDL, DCL, TCL with examples.
--SQL Commands

--DQL - Data Query language = Select
--DML - Data Manipulation Language = Insert, Update, Delete
--DDL - Data definition Language = Create, alter, drop, Truncate
--DCL - Data Control Language = Grant, revoke
--TCL - Transaction Control Language = Begin tran, commit tran, rollback tran


-- Question-8: Write a query to insert three records into the Students table.
Insert into Students values (95963,'Max', 19)

Insert into Students values (95963,'RRR', 19)

Insert into Students values (95963,'TTT', 19)


-- Question-9: Create a backup of your SchoolDB database and restore it. (write its steps to submit)
--Create a Backup of Your SchoolDB Database and Restore It

--Steps to Backup SchoolDB Database

--1. Open SQL Server Management Studio (SSMS).

--2. Connect to your SQL Server instance.

--3. Right-click on the "SchoolDB" database in Object Explorer.

--4. Select "Tasks" > "Back Up..."

--5. In the Backup Database dialog:

--   • Ensure "Database" is set to "SchoolDB".

--   • Choose "Full" as the backup type.

--   • Specify the backup destination (e.g., disk) and provide a filename.

--6. Click "OK" to create the backup.

--Steps to Restore SchoolDB Database

--1. Right-click on the "Databases" node in Object Explorer.

--2. Select "Restore Database..."

--3. In the Restore Database dialog:

--   • Choose "Device" and click on the ellipsis (...) to select the backup file you created.

--   • Ensure that the correct backup file is selected.

--4. Click "OK" to restore the database.
