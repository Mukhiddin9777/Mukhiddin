-- Create a table Employees with columns: EmpID INT, Name (VARCHAR(50)), and Salary (DECIMAL(10,2))
Create table employees (EmpID int, Name varchar(50), Salary DECIMAL(10,2))

-- Insert three records into the Employees table using different INSERT INTO approaches (single-row insert and multiple-row insert).
Insert into employees values (1, 'Eshmat', 104.2)

Insert into employees values (2, 'Toshmat', 109.25), (3, 'Bolta', 111.54)

-- Update the Salary of an employee where EmpID = 1.
Update employees
set Salary = 108.51
where EmpID = 1

-- Delete a record from the Employees table where EmpID = 2.
Delete from employees
where EmpID = 2

--Demonstrate the difference between DELETE, TRUNCATE, and DROP commands on a test table.
Create table Test (ID int, Name nchar(40), Salary float)
Insert into Test values (1, 'Eshmat', 104.2), (2, 'Toshmat', 108.3)

Delete from Test
Truncate table test
Drop table Test

--Modify the Name column in the Employees table to VARCHAR(100).
alter table employees 
alter column Name varchar(100)

--Add a new column Department (VARCHAR(50)) to the Employees table.
Alter table employees
add department varchar(50)

--Change the data type of the Salary column to FLOAT.
alter table employees 
alter column Salary float

--Create another table Departments with columns DepartmentID (INT, PRIMARY KEY) and DepartmentName (VARCHAR(50)).
Create table Departments (DepartmentID int primary key, DepartmentName varchar(50))

--Remove all records from the Employees table without deleting its structure.
delete from employees

--Insert five records into the Departments table using INSERT INTO SELECT from an existing table??????
INSERT INTO Departments (DepartmentID, DepartmentName)
SELECT EmpID, Name FROM Employees

--Update the Department of all employees where Salary > 5000 to 'Management'??????
UPDATE Employees SET Department = 'Management' WHERE Salary > 5000

--Write a query that removes all employees but keeps the table structure intact.
delete from employees

--Drop the Department column from the Employees table.
Alter table employees 
drop column department

--Rename the Employees table to StaffMembers using SQL commands.
exec sp_rename 'dbo.employees', 'StaffMembers' 

--Write a query to completely remove the Departments table from the database.
drop table Departments

--Create a table named Products with at least 5 columns, including: ProductID (Primary Key), ProductName (VARCHAR), Category (VARCHAR), Price (DECIMAL)
Create table Products (ProductID int Primary key, ProductName varchar(50), Category varchar(50), Price decimal(10,2), Explanation varchar(200))

--Add a CHECK constraint to ensure Price is always greater than 0.

Alter table Products
add constraint Price check (Price>0)

--Modify the table to add a StockQuantity column with a DEFAULT value of 50.

alter table Products
add StockQuantity int default 50

--Rename Category to ProductCategory
exec sp_rename 'dbo.Products.Category', 'ProductCategory'

--Insert 5 records into the Products table using standard INSERT INTO queries.
Insert into Products values 
 (1,'Car', 'Toy', 15, 'sss', 50),
(2, 'Rose', 'Flower', 16, 'sss', 60), 
(3, 'TTT', 'RRR', 17, 'sss', 70),
(4, 'WWW', 'EEE', 18, 'sss', 80),  
(5, 'WDD', 'DDD', 19, 'sasa', 90)

--Use SELECT INTO to create a backup table called Products_Backup containing all Products data.
Select * into Products_Backup from Products

--Rename the Products table to Inventory.
exec sp_rename 'dbo.Products', 'Inventory'

--Alter the Inventory table to change the data type of Price from DECIMAL(10,2) to FLOAT.
Alter table Inventory 
Alter column Price float

--Add an IDENTITY column named ProductCode that starts from 1000 and increments by 5
Alter table Inventory 
Add ProductCode int IDENTITY (1000,5)
