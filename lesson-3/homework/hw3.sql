--Define and explain the purpose of BULK INSERT in SQL Server.

----BULK INSERT quickly imports large amounts of data from text or CSV files into SQL Server tables. 
----It’s useful because it's significantly faster than individual row insertions (INSERT INTO) when dealing with large datasets.

 ----List four file formats that can be imported into SQL Server:
--CSV (Comma Separated Values)
--TXT (Text files)
--XML files
--XLSX files

 --Create a table Products with columns: ProductID (INT, PRIMARY KEY), ProductName (VARCHAR(50)), Price (DECIMAL(10,2)):
 Create table Products (ProductID INT PRIMARY KEY, ProductName VARCHAR(50), Price DECIMAL(10,2))

 --Insert three records into the Products table using INSERT INTO.
 Insert into Products values (1, 'Toy', 550), (2, 'Fruit', 330), (3, 'Flower', 750)
  
  --Explain the difference between NULL and NOT NULL with examples.
  ----NULL means a value is unknown or missing.
  ----NOT NULL means a column must always contain a value.
 CREATE TABLE Example(ID INT NOT NULL, Description VARCHAR(50) NULL )
  
 --Add a UNIQUE constraint to the ProductName column in Products
  Alter table Products 
  Add constraint UQ_ProductName unique (Productname)
 
 --Write a comment in a SQL query explaining its purpose.
  Select * from Products

 --Create a table Categories with a CategoryID as PRIMARY KEY and a CategoryName as UNIQUE.
  Create table Categories (CategoryID int PRIMARY KEY, CategoryName varchar(50) UNIQUE)

  --Explain the purpose of the IDENTITY column in SQL Server.
  ----An IDENTITY column auto-generates numeric values automatically for new rows. 
  ----It’s commonly used for primary keys to uniquely identify each row.
  CREATE TABLE Users(UserID INT IDENTITY(1,1) PRIMARY KEY, UserName VARCHAR(50))

  --Use BULK INSERT to import data from a text file into the Products table.
bulk insert Products
from 'C:\Users\m_mad\OneDrive\Desktop\Products.txt'
with (firstrow=2,Fieldterminator = ',',rowterminator = '\n')

--Create a FOREIGN KEY in the Products table that references the Categories table.
Alter table Products
add CategoryID int

go
ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories FOREIGN KEY (CategoryID)
REFERENCES Categories(CategoryID)

----Explain the differences between PRIMARY KEY and UNIQUE KEY with examples.
--PRIMARY KEY: Uniquely identifies each row, must be NOT NULL, only one per table.
--UNIQUE KEY: Allows one NULL value and ensures column uniqueness.
CREATE TABLE Example2 (ID INT PRIMARY KEY, Email VARCHAR(50) UNIQUE);

--Add a CHECK constraint to the Products table ensuring 
Add Stock int not null default 0

--Use the ISNULL function to replace NULL values in a column with a default value.
Select ProductName, ISNULL (Price, 0) as Price from Products

----Describe the purpose and usage of FOREIGN KEY constraints in SQL Server.
--FOREIGN KEY constraints maintain referential integrity between tables. They ensure relationships between rows in related tables are valid and prevent invalid data insertion.

--Write a script to create a Customers table with a CHECK constraint ensuring Age >= 18.

Create table Customers (ID int Primary key, Name Varchar(50), Age int check (Age>=18))
--Create a table with an IDENTITY column starting at 100 and incrementing by 10.

Create table Test (Id int identity (100,10) Primary key, Name varchar (50))

--Write a query to create a composite PRIMARY KEY in a new table OrderDetails.
CREATE TABLE OrderDetails(OrderID INT, ProductID INT, Quantity INT, PRIMARY KEY (OrderID, ProductID))

----Explain with examples the use of COALESCE and ISNULL functions for handling NULL values.

--ISNULL faqat bitta variantni tekshiradi:
--SELECT ISNULL(NULL, 'Muqobil qiymat');

--COALESCE bir nechta variantlarni tekshiradi:
--SELECT COALESCE(NULL, NULL, 'Birinchi NOT NULL qiymat')

--Create a table Employees with both PRIMARY KEY on EmpID and UNIQUE KEY on Email
Create table Employees (EmpID int primary key, Name varchar (50), Email varchar(50) unique)

--Write a query to create a FOREIGN KEY with ON DELETE CASCADE and ON UPDATE CASCADE options.
	
Create table EmployeesOrder(OrderID INT PRIMARY KEY, EmpID INT, 
FOREIGN KEY (EmpID) REFERENCES Employees(EmpID)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
