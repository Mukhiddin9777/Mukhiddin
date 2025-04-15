----Write a query to select the top 5 employees from the Employees table.
Select Top 5 * from Employees

----Use SELECT DISTINCT to select unique ProductName values from the Products table.
select distinct ProductName from Products

----Write a query that filters the Products table to show products with Price > 100.
Select * from Products
where price>100

----Write a query to select all CustomerName values that start with 'A' using the LIKE operator.
Select CustomerName from Customers
Where CustomerName Like 'A%'

----Order the results of a Products query by Price in ascending order.
Select * from Products
order by Price asc

----Write a query that uses the WHERE clause to filter for employees with Salary >= 60000 and Department = 'HR'.

Alter table employees
add Salary varchar (50), Department varchar (50) 

Select * from Employees
where Salary >=60000 and Department='HR'

----Use ISNULL to replace NULL values in the Email column with the text "noemail@example.com".From Employees table
Select *, Isnull (Email, 'noemail@example.com') as Email from Employees

----Write a query that shows all products with Price BETWEEN 50 AND 100.
Select * from Products where price between 50 and 100 

----Use SELECT DISTINCT on two columns (Category and ProductName) in the Products table.
Alter table Products
add Category varchar (50)

Select Distinct Category, ProductName from Products

----After SELECT DISTINCT on two columns (Category and ProductName) Order the results by ProductName in descending order.
Select distinct Category, ProductName from Products
Order by ProductName desc

----Write a query to select the top 10 products from the Products table, ordered by Price DESC.
Select Top 10 * from Products
order by Price desc

----Use COALESCE to return the first non-NULL value from FirstName or LastName in the Employees table.
Alter table Employees
Add FirstName varchar (50), LastName varchar (50)

Select COALESCE(FirstName, Lastname) as Name from Employees
	
----Write a query that selects distinct Category and Price from the Products table.
Select distinct Category, Price from Products

----Write a query that filters the Employees table to show employees whose 
----Age is either between 30 and 40 or Department = 'Marketing'.
Alter table Employees
Add Age int

Select * from Employees
where Age between 30 and 40 or Department = 'Marketing'

----Use OFFSET-FETCH to select rows 11 to 20 from the Employees table, ordered by Salary DESC.

Select * from Employees
Order by Salary Desc OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY

----Write a query to display all products with Price <= 1000 and Stock > 50, sorted by Stock in ascending order.
Select * from Products
where Price <=0 and Stock>0
order by Stock asc

----Write a query that filters the Products table for ProductName values containing the letter 'e' using LIKE.

Select * from Products
Where ProductName Like '%e%'

----Use IN operator to filter for employees who work in either 'HR', 'IT', or 'Finance'.????????

Select * from Employees
Where Department in ('HR', 'IT', 'Finance')

----Use ORDER BY to display a list of customers ordered by City in ascending and PostalCode in descending order.Use customers table
Alter table Customers
Add City varchar(50), PostalCode int 

Select * from Customers
Order by City asc, PostalCode desc

----Write a query that selects the top 10 products with the highest sales, using TOP(10) and ordered by SalesAmount DESC.
Alter table Products
Add SalesAmount int

Select Top 10 * from Products
Order by SalesAmount desc

----Combine FirstName and LastName into one column named FullName in the Employees table. (only in select statement)????
Select FirstName +' '+ LastName as FullName from Employees

----Write a query to select the distinct Category, ProductName, and Price for products that are priced above $50, using DISTINCT on three columns.
Select distinct Category, ProductName, Price from Products
where price > 50

----Write a query that selects products whose Price is less than 10% of the average price in the Products table. (Do some research on how to find average price of all products)
Select * from Products
where Price < (Select Avg (price)*0.1 from Products)

----Use WHERE clause to filter for employees whose Age is less than 30 and who work in either the 'HR' or 'IT' department.
Select * from Employees
where Age<30 and Department in ('HR', 'IT')

----Use LIKE with wildcard to select all customers whose Email contains the domain '@gmail.com'.
Select * from Employees
where Email like '%@gmail.com%'

----Write a query that uses the ALL operator to find employees 
----whose salary is greater than all employees in the 'Sales' department. ????
Select * from Employees
Where Salary > All (Select Salary from Employees where Department = 'Sales')

----Write a query that filters the Orders table for orders placed in the 
----last 180 days using BETWEEN and CURRENT_DATE. (Search how to get the current date)?????
Create table Orders (ID int Primary key, OrderDate int)

Select * from Orders
WHERE OrderDate BETWEEN DATEADD(DAY, -180, GETDATE()) AND GETDATE()
