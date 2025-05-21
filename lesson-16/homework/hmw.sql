
CREATE TABLE Numbers1(Number INT)

INSERT INTO Numbers1 VALUES (5),(9),(8),(6),(7)

CREATE TABLE FindSameCharacters
(
     Id INT
    ,Vals VARCHAR(10)
)
 
INSERT INTO FindSameCharacters VALUES
(1,'aa'),
(2,'cccc'),
(3,'abc'),
(4,'aabc'),
(5,NULL),
(6,'a'),
(7,'zzz'),
(8,'abc')



CREATE TABLE RemoveDuplicateIntsFromNames
(
      PawanName INT
    , Pawan_slug_name VARCHAR(1000)
)
 
 
INSERT INTO RemoveDuplicateIntsFromNames VALUES
(1,  'PawanA-111'  ),
(2, 'PawanB-123'   ),
(3, 'PawanB-32'    ),
(4, 'PawanC-4444' ),
(5, 'PawanD-3'  )





CREATE TABLE Example
(
Id       INTEGER IDENTITY(1,1) PRIMARY KEY,
String VARCHAR(30) NOT NULL
);


INSERT INTO Example VALUES('123456789'),('abcdefghi');


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    DepartmentID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, DepartmentID, FirstName, LastName, Salary) VALUES
(1, 1, 'John', 'Doe', 60000.00),
(2, 1, 'Jane', 'Smith', 65000.00),
(3, 2, 'James', 'Brown', 70000.00),
(4, 3, 'Mary', 'Johnson', 75000.00),
(5, 4, 'Linda', 'Williams', 80000.00),
(6, 2, 'Michael', 'Jones', 85000.00),
(7, 1, 'Robert', 'Miller', 55000.00),
(8, 3, 'Patricia', 'Davis', 72000.00),
(9, 4, 'Jennifer', 'García', 77000.00),
(10, 1, 'William', 'Martínez', 69000.00);


CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Sales'),
(3, 'Marketing'),
(4, 'Finance'),
(5, 'IT'),
(6, 'Operations'),
(7, 'Customer Service'),
(8, 'R&D'),
(9, 'Legal'),
(10, 'Logistics');


CREATE TABLE Sales (
    SalesID INT PRIMARY KEY,
    EmployeeID INT,
    ProductID INT,
    SalesAmount DECIMAL(10, 2),
    SaleDate DATE
);
INSERT INTO Sales (SalesID, EmployeeID, ProductID, SalesAmount, SaleDate) VALUES
-- January 2025
(1, 1, 1, 1550.00, '2025-01-02'),
(2, 2, 2, 2050.00, '2025-01-04'),
(3, 3, 3, 1250.00, '2025-01-06'),
(4, 4, 4, 1850.00, '2025-01-08'),
(5, 5, 5, 2250.00, '2025-01-10'),
(6, 6, 6, 1450.00, '2025-01-12'),
(7, 7, 1, 2550.00, '2025-01-14'),
(8, 8, 2, 1750.00, '2025-01-16'),
(9, 9, 3, 1650.00, '2025-01-18'),
(10, 10, 4, 1950.00, '2025-01-20'),
(11, 1, 5, 2150.00, '2025-02-01'),
(12, 2, 6, 1350.00, '2025-02-03'),
(13, 3, 1, 2050.00, '2025-02-05'),
(14, 4, 2, 1850.00, '2025-02-07'),
(15, 5, 3, 1550.00, '2025-02-09'),
(16, 6, 4, 2250.00, '2025-02-11'),
(17, 7, 5, 1750.00, '2025-02-13'),
(18, 8, 6, 1650.00, '2025-02-15'),
(19, 9, 1, 2550.00, '2025-02-17'),
(20, 10, 2, 1850.00, '2025-02-19'),
(21, 1, 3, 1450.00, '2025-03-02'),
(22, 2, 4, 1950.00, '2025-03-05'),
(23, 3, 5, 2150.00, '2025-03-08'),
(24, 4, 6, 1700.00, '2025-03-11'),
(25, 5, 1, 1600.00, '2025-03-14'),
(26, 6, 2, 2050.00, '2025-03-17'),
(27, 7, 3, 2250.00, '2025-03-20'),
(28, 8, 4, 1350.00, '2025-03-23'),
(29, 9, 5, 2550.00, '2025-03-26'),
(30, 10, 6, 1850.00, '2025-03-29'),
(31, 1, 1, 2150.00, '2025-04-02'),
(32, 2, 2, 1750.00, '2025-04-05'),
(33, 3, 3, 1650.00, '2025-04-08'),
(34, 4, 4, 1950.00, '2025-04-11'),
(35, 5, 5, 2050.00, '2025-04-14'),
(36, 6, 6, 2250.00, '2025-04-17'),
(37, 7, 1, 2350.00, '2025-04-20'),
(38, 8, 2, 1800.00, '2025-04-23'),
(39, 9, 3, 1700.00, '2025-04-26'),
(40, 10, 4, 2000.00, '2025-04-29'),
(41, 1, 5, 2200.00, '2025-05-03'),
(42, 2, 6, 1650.00, '2025-05-07'),
(43, 3, 1, 2250.00, '2025-05-11'),
(44, 4, 2, 1800.00, '2025-05-15'),
(45, 5, 3, 1900.00, '2025-05-19'),
(46, 6, 4, 2000.00, '2025-05-23'),
(47, 7, 5, 2400.00, '2025-05-27'),
(48, 8, 6, 2450.00, '2025-05-31'),
(49, 9, 1, 2600.00, '2025-06-04'),
(50, 10, 2, 2050.00, '2025-06-08'),
(51, 1, 3, 1550.00, '2025-06-12'),
(52, 2, 4, 1850.00, '2025-06-16'),
(53, 3, 5, 1950.00, '2025-06-20'),
(54, 4, 6, 1900.00, '2025-06-24'),
(55, 5, 1, 2000.00, '2025-07-01'),
(56, 6, 2, 2100.00, '2025-07-05'),
(57, 7, 3, 2200.00, '2025-07-09'),
(58, 8, 4, 2300.00, '2025-07-13'),
(59, 9, 5, 2350.00, '2025-07-17'),
(60, 10, 6, 2450.00, '2025-08-01');


CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    CategoryID INT,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, CategoryID, ProductName, Price) VALUES
(1, 1, 'Laptop', 1000.00),
(2, 1, 'Smartphone', 800.00),
(3, 2, 'Tablet', 500.00),
(4, 2, 'Monitor', 300.00),
(5, 3, 'Headphones', 150.00),
(6, 3, 'Mouse', 25.00),
(7, 4, 'Keyboard', 50.00),
(8, 4, 'Speaker', 200.00),
(9, 5, 'Smartwatch', 250.00),
(10, 5, 'Camera', 700.00);

----Easy Tasks
----Create a numbers table using a recursive query from 1 to 1000.

with numbers as
( select 1 as n
union all
select n+1 from numbers 

)
Select * from numbers
option (maxrecursion 999)

----Write a query to find the total sales per employee using a derived table.(Sales, Employees)

with cte as 
(
Select FirstName, LastName, SUM(SalesAmount) AS Totalamount from Employees as E
join Sales as S
on E.EmployeeID=S.EmployeeID 
group by FirstName, LastName
)
Select * from cte

----Create a CTE to find the average salary of employees.(Employees)

with cte as
(Select Salary from Employees)
Select avg(Salary) as AVGSAL from cte

----Write a query using a derived table to find the highest sales for each product.(Sales, Products)

Select P.ProductID, ProductName, HighSale from Products as P
join (Select ProductID, max(SalesAmount) HighSale from Sales
Group by ProductID)  as S
on P.ProductID=S.ProductID

----Beginning at 1, write a statement to double the number for each record, the max value you get should be less than 1000000.

with cte as
(
Select 1 as n
union all
Select n*2 as n_2 from cte
where n*2<1000000
)
Select * from cte

----Use a CTE to get the names of employees who have made more than 5 sales.(Sales, Employees)

with cte as 
(
Select FirstName, LastName, count(SalesAmount) AS Countamount from Employees as E
join Sales as S
on E.EmployeeID=S.EmployeeID 
group by FirstName, LastName
)
Select * from cte
where Countamount>5

----Write a query using a CTE to find all products with sales greater than $500.(Sales, Products)

with cte as 
(
Select ProductName, sum(SalesAmount) TotalSales from Sales as S
join Products as P
on S.ProductID=P.ProductID
Group by ProductName
)
Select * from cte
where TotalSales>500

----Create a CTE to find employees with salaries above the average salary.(Employees)

with cte as
(
Select FirstName, LastName, Salary from Employees
)
Select FirstName, LastName, Salary from cte

where Salary > (Select avg(Salary) from Employees)

----Medium Tasks
----Write a query using a derived table to find the top 5 employees by the number of orders made.(Employees, Sales)

Select Top(5)* from Employees as E
join (Select EmployeeID, Count(*) as Count from Sales
group by EmployeeID) as S
on E.EmployeeID= S.EmployeeID
order by S.Count desc

----Write a query using a derived table to find the sales per product category.(Sales, Products)

Select CategoryID, sum(SalesAmount) TotAmount from Sales as S
join (Select distinct(CategoryID), ProductID from Products) as P
on S.ProductID=P.ProductID
Group by CategoryID

----Write a script to return the factorial of each value next to it.(Numbers1)

with cte as
(
Select Number, Number as Numb2, 1 as Factar  from Numbers1
union all
Select c.Number, c.Numb2*c.Factar, c.Factar+1 from cte c
where c.Factar<c.Number
)
Select Number, max(Numb2) as Factorial from cte
group by Number

----This script uses recursion to split a string into rows of substrings for each character in the string.(Example)

Select * from Example

with cte as
( Select String, String as ST, 1 as n, SUBSTRING(String, 1, 1) as Subs from Example
WHERE LEN(String) > 0
union all
Select String, ST, n+1, SUBSTRING(String, n+1, 1) from cte 
where n<len(String)
)
Select * from cte
order by subs

----Use a CTE to calculate the sales difference between the current month and the previous month.(Sales)?????

WITH MonthlySales AS (
    SELECT 
        FORMAT(SaleDate, 'yyyy-MM') AS SaleMonth,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY FORMAT(SaleDate, 'yyyy-MM')
),
Diffs AS (
    SELECT 
        SaleMonth,
        TotalSales,
        LAG(TotalSales) OVER (ORDER BY SaleMonth) AS PrevSales,
        TotalSales - LAG(TotalSales) OVER (ORDER BY SaleMonth) AS Diff
    FROM MonthlySales
)
SELECT * FROM Diffs;


----Create a derived table to find employees with sales over $45000 in each quarter.(Sales, Employees)


Select FirstName, LastName, TotAmount from Employees as Emp
join (
Select EmployeeID, Datepart(QUARTER, Saledate) Quart, sum(SalesAmount) TotAmount from Sales
group by EmployeeID,  Datepart(QUARTER, Saledate)) as Sal
on Emp.EmployeeID=Sal.EmployeeID
where Totamount > 45000

----Difficult Tasks
----This script uses recursion to calculate Fibonacci numbers??????????

WITH Fibonacci(n, fib, prev) AS (
    SELECT 1, 1, 0  -- (n = 1, fib = 1, prev = 0)
    UNION ALL
    SELECT n + 1, fib + prev, fib
    FROM Fibonacci
    WHERE n < 20
)
SELECT n, fib FROM Fibonacci;



----Find a string where all characters are the same and the length is greater than 1.(FindSameCharacters)????????

SELECT * FROM FindSameCharacters
WHERE LEN(Vals) > 1 AND LEN(REPLACE(Vals, LEFT(Vals, 1), '')) = 0;

----Create a numbers table that shows all numbers 1 through n and their order gradually increasing by the next number in the sequence.(Example:n=5 | 1, 12, 123, 1234, 12345)????????????

WITH Numbers(n, seq) AS (
    SELECT 1, CAST('1' AS VARCHAR(MAX))
    UNION ALL
    SELECT n + 1, seq + CAST(n + 1 AS VARCHAR)
    FROM Numbers
    WHERE n < 5
)
SELECT * FROM Numbers;

----Write a query using a derived table to find the employees who have made the most sales in the last 6 months.(Employees,Sales)??????

SELECT TOP 1 
    e.EmployeeID, e.FirstName, e.LastName, SUM(s.SalesAmount) AS TotalSales
FROM Sales s
JOIN Employees e ON s.EmployeeID = e.EmployeeID
WHERE s.SaleDate >= DATEADD(MONTH, -6, GETDATE())
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY TotalSales DESC;


----Write a T-SQL query to remove the duplicate integer values present in the string column. Additionally, remove the single integer character that appears in the string.(RemoveDuplicateIntsFromNames)??????

 WITH Chars AS (
    SELECT 
        PawanName,
        SUBSTRING(Pawan_slug_name, v.number, 1) AS ch,
        v.number,
        CASE 
            WHEN SUBSTRING(Pawan_slug_name, v.number, 1) LIKE '[0-9]' THEN 1
            ELSE 0
        END AS isDigit
    FROM RemoveDuplicateIntsFromNames
    JOIN master..spt_values v ON v.type = 'P' AND v.number BETWEEN 1 AND LEN(Pawan_slug_name)
),
Numbered AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY PawanName, ch ORDER BY number) AS rn
    FROM Chars
),
Cleaned AS (
    SELECT 
        PawanName,
        STRING_AGG(ch, '') WITHIN GROUP (ORDER BY number) AS CleanedName
    FROM Numbered
    WHERE isDigit = 0 OR rn = 1 -- Keep non-digits and first occurrence of each digit
    GROUP BY PawanName
)
SELECT * FROM Cleaned;
