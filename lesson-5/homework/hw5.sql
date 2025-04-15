--Write a query that uses an alias to rename the ProductName column as Name in the Products table.
Select ProductName as Name from Products

--Write a query that uses an alias to rename the Customers table as Client for easier reference.
Select * from Customers as Client

--Use UNION to combine results from two queries that select ProductName from Products and ProductName from Products_Discounted.
Create table Products_Discounted (ID int Primary key, ProductName varchar (50))
Insert into Products_Discounted values (1, 'Cloth'), (2, 'Board')

Select ProductName from Products
union
Select ProductName from Products_Discounted

--Write a query to find the intersection of Products and Products_Discounted tables using INTERSECT.
Select ProductName from Products
intersect
Select ProductName from Products_Discounted

--Write a query to select distinct customer names and their corresponding Country using SELECT DISTINCT.
Alter table Customers
Add Customernames varchar (50), Country varchar (50)
Insert into Customers values (1,'Eshmat', 30, 'Tash', 100149, 'Esh', 'Uzb')

Select distinct Customernames, Country from customers

--Write a query that uses CASE to create a conditional column that displays 
--'High' if Price > 1000, and 'Low' if Price <= 1000 from Products table.

Select *, case when price>1000 then 'High'
				when price<=1000 then 'Low'
				end as Degree from Products
			
--Use IIF to create a column that shows 'Yes' if Stock > 100, and 'No' otherwise (Products_Discounted table, StockQuantity column).
Alter table Products_Discounted
Add StockQuantity int

Update Products_Discounted 
set StockQuantity = 110
where Id = 2


Select *, iif (StockQuantity>100, 'Yes', 'No') as Stock 

from Products_Discounted

--Use UNION to combine results from two queries that select ProductName from Products and ProductName from OutOfStock tables.

Create table OutOfStock (ID int Primary key, ProductName varchar (50))
Insert into OutOfStock values (1, 'Computer'), (2, 'Bottle')

Select ProductName from Products
union
Select ProductName from OutOfStock

--Write a query that returns the difference between the Products and Products_Discounted tables using EXCEPT.

Select ProductName from Products
except
Select ProductName from Products_Discounted

--Create a conditional column using IIF that shows 'Expensive' if the Price is greater than 1000, 
--and 'Affordable' if less, from Products table.

Select *, iif (Price> 1000, 'Expensive', 'Affordable') as Value
from Products

--Write a query to find employees in the Employees table who have either Age < 25 or Salary > 60000.

Select * from Employees where Age <25 or Salary>60000

--Update the salary of an employee based on their department, increase by 10% if they work in 'HR' or EmployeeID = 5
Update Employees
set SAlary = Salary*1.1
Where Department = 'Hr' or EmpID = 5

--Use INTERSECT to show products that are common between Products and Products_Discounted tables.
Select ProductName from Products
intersect
Select ProductName from Products_Discounted

--Write a query that uses CASE to assign 'Top Tier' if SaleAmount > 500, 'Mid Tier' 
--if SaleAmount BETWEEN 200 AND 500, and 'Low Tier' otherwise. (From Sales table)

Create table Sales (ID int, Name Varchar(50), SaleAmount int)
Insert into Sales values (1, 'DiaryProducts', 300), (2, 'Tablets', 100), (3, 'Electronics', 700)


Select *, case when SaleAmount > 500 then 'Top Tier'
				when SaleAmount between 200 and 500 then 'Mid Tier'
				else 'Low Tier'
				end as Tier from Sales
				
--Use EXCEPT to find customers' ID who have placed orders but do not have a corresponding record in the Invoices table.
Create table Invoices (ID int, Name Varchar(50))

SELECT ID FROM Orders
EXCEPT
SELECT ID FROM Invoices;

--Write a query that uses a CASE statement to determine the discount percentage based on the quantity purchased. Use orders table. 
--Result set should show customerid, quantity and discount percentage. The discount should be applied as follows: 
--1 item: 3% Between 1 and 3 items : 5% Otherwise: 7%

Alter table orders
add quantity int

Insert into orders values (4, 7, 0.1)


Select *, case when quantity < 1 then '3%'
				when quantity between 1 and 3 then '5%'
				else '7%' 
				end As discount
				from Orders

Select * from orders
