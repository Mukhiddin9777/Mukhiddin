----1. You must provide a report of all distributors and their sales by region. If a distributor did not have any sales for a region, rovide a zero-dollar value for that day. Assume there is at least one sale for each region
----SQL Setup:

DROP TABLE IF EXISTS #RegionSales;
GO
CREATE TABLE #RegionSales (
  Region      VARCHAR(100),
  Distributor VARCHAR(100),
  Sales       INTEGER NOT NULL,
  PRIMARY KEY (Region, Distributor)
);
GO
INSERT INTO #RegionSales (Region, Distributor, Sales) VALUES
('North','ACE',10), ('South','ACE',67), ('East','ACE',54),
('North','ACME',65), ('South','ACME',9), ('East','ACME',1), ('West','ACME',7),
('North','Direct Parts',8), ('South','Direct Parts',7), ('West','Direct Parts',12);


WITH AllRegions AS (
  SELECT DISTINCT Region FROM #RegionSales
),
AllDistributors AS (
  SELECT DISTINCT Distributor FROM #RegionSales
),
AllCombinations AS (
  SELECT r.Region, d.Distributor
  FROM AllRegions r
  CROSS JOIN AllDistributors d
),
FilledSales AS (
  SELECT ac.Region, ac.Distributor, COALESCE(rs.Sales, 0) AS Sales
  FROM AllCombinations ac
  LEFT JOIN #RegionSales rs
    ON ac.Region = rs.Region AND ac.Distributor = rs.Distributor
)
SELECT * FROM FilledSales
ORDER BY Distributor, Region;


----Input:

----|Region       |Distributor    | Sales |
----|-------------|---------------|--------
----|North        |ACE            |   10  |
----|South        |ACE            |   67  |
----|East         |ACE            |   54  |
----|North        |Direct Parts   |   8   |
----|South        |Direct Parts   |   7   |
----|West         |Direct Parts   |   12  |
----|North        |ACME           |   65  |
----|South        |ACME           |   9   |
----|East         |ACME           |   1   |
----|West         |ACME           |   7   |
----Expected Output:

----|Region |Distributor   | Sales |
----|-------|--------------|-------|
----|North  |ACE           | 10    |
----|South  |ACE           | 67    |
----|East   |ACE           | 54    |
----|West   |ACE           | 0     |
----|North  |Direct Parts  | 8     |
----|South  |Direct Parts  | 7     |
----|East   |Direct Parts  | 0     |
----|West   |Direct Parts  | 12    |
----|North  |ACME          | 65    |
----|South  |ACME          | 9     |
----|East   |ACME          | 1     |
----|West   |ACME          | 7     |
----2. Find managers with at least five direct reports
----SQL Setup:

CREATE TABLE Employee (id INT, name VARCHAR(255), department VARCHAR(255), managerId INT);
TRUNCATE TABLE Employee;
INSERT INTO Employee VALUES
(101, 'John', 'A', NULL), (102, 'Dan', 'A', 101), (103, 'James', 'A', 101),
(104, 'Amy', 'A', 101), (105, 'Anne', 'A', 101), (106, 'Ron', 'B', 101);
Select * from Employee

SELECT name
FROM Employee e
WHERE id IN (
  SELECT managerId
  FROM Employee
  WHERE managerId IS NOT NULL
  GROUP BY managerId
  HAVING COUNT(*) >= 5
);



----Input:

----| id  | name  | department | managerId |
----+-----+-------+------------+-----------+
----| 101 | John  | A          | null      |
----| 102 | Dan   | A          | 101       |
----| 103 | James | A          | 101       |
----| 104 | Amy   | A          | 101       |
----| 105 | Anne  | A          | 101       |
----| 106 | Ron   | B          | 101       |
----Expected Output:

----+------+
----| name |
----+------+
----| John |
----+------+
----You cal also solve this puzzle in Leetcode: https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description/?envType=study-plan-v2&envId=top-sql-50
----3. Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount.
----SQL Setup:

CREATE TABLE Products (product_id INT, product_name VARCHAR(40), product_category VARCHAR(40));
CREATE TABLE Orders (product_id INT, order_date DATE, unit INT);
TRUNCATE TABLE Products;
INSERT INTO Products VALUES
(1, 'Leetcode Solutions', 'Book'),
(2, 'Jewels of Stringology', 'Book'),
(3, 'HP', 'Laptop'), (4, 'Lenovo', 'Laptop'), (5, 'Leetcode Kit', 'T-shirt');
TRUNCATE TABLE Orders;
INSERT INTO Orders VALUES
(1,'2020-02-05',60),(1,'2020-02-10',70),
(2,'2020-01-18',30),(2,'2020-02-11',80),
(3,'2020-02-17',2),(3,'2020-02-24',3),
(4,'2020-03-01',20),(4,'2020-03-04',30),(4,'2020-03-04',60),
(5,'2020-02-25',50),(5,'2020-02-27',50),(5,'2020-03-01',50);


Select Product_name, sum(unit) TotUnit from Products as P
join Orders as O
on P.Product_id=O.Product_id
WHERE O.order_date BETWEEN '2020-02-01' AND '2020-02-29'
group by Product_name
having sum(unit) >=100

----Input:

----| product_id  | product_name          | product_category |
----+-------------+-----------------------+------------------+
----| 1           | Leetcode Solutions    | Book             |
----| 2           | Jewels of Stringology | Book             |
----| 3           | HP                    | Laptop           |
----| 4           | Lenovo                | Laptop           |
----| 5           | Leetcode Kit          | T-shirt          |
----Expected Output:

----| product_name       | unit  |
----+--------------------+-------+
----| Leetcode Solutions | 130   |
----| Leetcode Kit       | 100   |
----4. Write an SQL statement that returns the vendor from which each customer has placed the most orders
----SQL Setup:

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
  OrderID    INTEGER PRIMARY KEY,
  CustomerID INTEGER NOT NULL,
  [Count]    MONEY NOT NULL,
  Vendor     VARCHAR(100) NOT NULL
);
INSERT INTO Orders VALUES
(1,1001,12,'Direct Parts'), (2,1001,54,'Direct Parts'), (3,1001,32,'ACME'),
(4,2002,7,'ACME'), (5,2002,16,'ACME'), (6,2002,5,'Direct Parts');



SELECT CustomerID, Vendor
FROM (
  SELECT CustomerID, Vendor, 
         COUNT(*) AS cnt,
         RANK() OVER (PARTITION BY CustomerID ORDER BY COUNT(*) DESC) AS rnk
  FROM Orders
  GROUP BY CustomerID, Vendor
) ranked
WHERE rnk = 1;


----Input:

----|Order ID   | Customer ID | Order Count|     Vendor     |
-------------------------------------------------------------
----|Ord195342  |     1001    |      12    |  Direct Parts  |
----|Ord245532  |     1001    |      54    |  Direct Parts  |
----|Ord344394  |     1001    |      32    |     ACME       |
----|Ord442423  |     2002    |      7     |     ACME       |
----|Ord524232  |     2002    |      16    |     ACME       |
----|Ord645363  |     2002    |      5     |  Direct Parts  |
----Expected Output:

----| CustomerID | Vendor       |
----|------------|--------------|
----| 1001       | Direct Parts |
----| 2002       | ACME         |
----5. You will be given a number as a variable called @Check_Prime check if this number is prime then return 'This number is prime' else eturn 'This number is not prime'
----Example Input:

----DECLARE @Check_Prime INT = 91;
---- Your WHILE-based SQL logic here
----Expected Output:

DECLARE @Check_Prime INT = 91;
DECLARE @i INT = 2;
DECLARE @IsPrime BIT = 1;

WHILE @i * @i <= @Check_Prime
BEGIN
  IF @Check_Prime % @i = 0
  BEGIN
    SET @IsPrime = 0;
    BREAK;
  END
  SET @i = @i + 1;
END

IF @Check_Prime <= 1
  SET @IsPrime = 0;

SELECT 
  CASE 
    WHEN @IsPrime = 1 THEN 'This number is prime'
    ELSE 'This number is not prime'
  END AS Result;


----This number is not prime(or "This number is prime")
----6. Write an SQL query to return the number of locations,in which location most signals sent, and total number of signal for each device from the given table.
----SQL Setup:

CREATE TABLE Device(
  Device_id INT,
  Locations VARCHAR(25)
);
INSERT INTO Device VALUES
(12,'Bangalore'), (12,'Bangalore'), (12,'Bangalore'), (12,'Bangalore'),
(12,'Hosur'), (12,'Hosur'),
(13,'Hyderabad'), (13,'Hyderabad'), (13,'Secunderabad'),
(13,'Secunderabad'), (13,'Secunderabad');


WITH DeviceStats AS (
  SELECT Device_id, Locations, COUNT(*) AS Signals
  FROM Device
  GROUP BY Device_id, Locations
),
Aggregated AS (
  SELECT Device_id,
         COUNT(DISTINCT Locations) AS no_of_location,
         SUM(Signals) AS no_of_signals,
         MAX(Signals) AS max_signals
  FROM DeviceStats
  GROUP BY Device_id
),
MaxLocation AS (
  SELECT d.Device_id, d.Locations AS max_signal_location, ds.Signals
  FROM DeviceStats d
  JOIN (
    SELECT Device_id, MAX(Signals) AS max_signals
    FROM DeviceStats
    GROUP BY Device_id
  ) ds ON d.Device_id = ds.Device_id AND d.Signals = ds.max_signals
)
SELECT a.Device_id, a.no_of_location, m.max_signal_location, a.no_of_signals
FROM Aggregated a
JOIN MaxLocation m ON a.Device_id = m.Device_id;




----Expected Output:

----| Device_id | no_of_location | max_signal_location | no_of_signals |
----|-----------|----------------|---------------------|---------------|
----| 12        | 2              | Bangalore           | 6             |
----| 13        | 2              | Secunderabad        | 5             |
----7. Write a SQL to find all Employees who earn more than the average salary in their corresponding department. Return EmpID, EmpName,Salary in your output
----SQL Setup:

CREATE TABLE Employee (
  EmpID INT,
  EmpName VARCHAR(30),
  Salary FLOAT,
  DeptID INT
);
INSERT INTO Employee VALUES
(1001,'Mark',60000,2), (1002,'Antony',40000,2), (1003,'Andrew',15000,1),
(1004,'Peter',35000,1), (1005,'John',55000,1), (1006,'Albert',25000,3), (1007,'Donald',35000,3);

SELECT EmpID, EmpName, Salary
FROM Employee e
WHERE Salary > (
  SELECT AVG(Salary)
  FROM Employee
  WHERE DeptID = e.DeptID
);


----Expected Output:

----| EmpID | EmpName | Salary |
----|-------|---------|--------|
----| 1001  | Mark    | 60000  |
----| 1004  | Peter   | 35000  |
----| 1005  | John    | 55000  |
----| 1007  | Donald  | 35000  |
----8. You are part of an office lottery pool where you keep a table of the winning lottery numbers along with a table of each ticket’s chosen numbers. If a ticket has some but not all the winning numbers, you win $10. If a ticket has all the winning numbers, you win $100. Calculate the total winnings for today’s drawing.
----Winning Numbers:

----|Number|
------------
----|  25  |
----|  45  |
----|  78  |

----Tickets:

----| Ticket ID | Number |
----|-----------|--------|
----| A23423    | 25     |
----| A23423    | 45     |
----| A23423    | 78     |
----| B35643    | 25     |
----| B35643    | 45     |
----| B35643    | 98     |
----| C98787    | 67     |
----| C98787    | 86     |
----| C98787    | 91     |


WITH WinningNumbers AS (
  SELECT Number FROM (VALUES (25), (45), (78)) AS W(Number)
),
MatchCounts AS (
  SELECT t.TicketID, COUNT(*) AS matched
  FROM Tickets t
  JOIN WinningNumbers w ON t.Number = w.Number
  GROUP BY t.TicketID
),
Results AS (
  SELECT 
    SUM(CASE WHEN matched = 3 THEN 100 
             WHEN matched > 0 THEN 10 
             ELSE 0 END) AS Total_Winnings
  FROM MatchCounts
)
SELECT Total_Winnings FROM Results;



----Expected Output would be $110, as you have one winning ticket, and one ticket that has some but not all the winning numbers.

----9. The Spending table keeps the logs of the spendings history of users that make purchases from an online shopping website which has a desktop and a mobile devices.
----Write an SQL query to find the total number of users and the total amount spent using mobile only, desktop only and both mobile and desktop together for each date.
----SQL Setup:

CREATE TABLE Spending (
  User_id INT,
  Spend_date DATE,
  Platform VARCHAR(10),
  Amount INT
);
INSERT INTO Spending VALUES
(1,'2019-07-01','Mobile',100),
(1,'2019-07-01','Desktop',100),
(2,'2019-07-01','Mobile',100),
(2,'2019-07-02','Mobile',100),
(3,'2019-07-01','Desktop',100),
(3,'2019-07-02','Desktop',100);

WITH Platforms AS (
  SELECT User_id, Spend_date,
    MAX(CASE WHEN Platform = 'Mobile' THEN 1 ELSE 0 END) AS Used_Mobile,
    MAX(CASE WHEN Platform = 'Desktop' THEN 1 ELSE 0 END) AS Used_Desktop,
    SUM(CASE WHEN Platform = 'Mobile' THEN Amount ELSE 0 END) AS Mobile_Amount,
    SUM(CASE WHEN Platform = 'Desktop' THEN Amount ELSE 0 END) AS Desktop_Amount
  FROM Spending
  GROUP BY User_id, Spend_date
),
Classified AS (
  SELECT Spend_date,
         CASE 
           WHEN Used_Mobile = 1 AND Used_Desktop = 1 THEN 'Both'
           WHEN Used_Mobile = 1 THEN 'Mobile'
           WHEN Used_Desktop = 1 THEN 'Desktop'
         END AS Platform,
         SUM(CASE 
               WHEN Used_Mobile = 1 AND Used_Desktop = 1 THEN Mobile_Amount + Desktop_Amount
               WHEN Used_Mobile = 1 THEN Mobile_Amount
               WHEN Used_Desktop = 1 THEN Desktop_Amount
             END) AS Total_Amount,
         COUNT(*) AS Total_Users
  FROM Platforms
  GROUP BY Spend_date, 
           CASE 
             WHEN Used_Mobile = 1 AND Used_Desktop = 1 THEN 'Both'
             WHEN Used_Mobile = 1 THEN 'Mobile'
             WHEN Used_Desktop = 1 THEN 'Desktop'
           END
)
SELECT ROW_NUMBER() OVER (ORDER BY Spend_date, Platform) AS Row,
       Spend_date, Platform, Total_Amount, Total_Users
FROM Classified;



----Expected Output:

----| Row | Spend_date | Platform | Total_Amount | Total_users |
----|-----|------------|----------|--------------|-------------|
----| 1   | 2019-07-01 | Mobile   | 100          | 1           |
----| 2   | 2019-07-01 | Desktop  | 100          | 1           |
----| 3   | 2019-07-01 | Both     | 200          | 1           |
----| 4   | 2019-07-02 | Mobile   | 100          | 1           |
----| 5   | 2019-07-02 | Desktop  | 100          | 1           |
----| 6   | 2019-07-02 | Both     | 0            | 0           |
----10. Write an SQL Statement to de-group the following data.
----Input Table: 'Grouped'

----|Product  |Quantity|
------------------------
----|Pencil   |   3    |
----|Eraser   |   4    |
----|Notebook |   2    |
----Expected Output:

----|Product  |Quantity|
------------------------
----|Pencil   |   1    |
----|Pencil   |   1    |
----|Pencil   |   1    |
----|Eraser   |   1    |
----|Eraser   |   1    |
----|Eraser   |   1    |
----|Eraser   |   1    |
----|Notebook |   1    |
----|Notebook |   1    |
----SQL Setup:

DROP TABLE IF EXISTS Grouped;
CREATE TABLE Grouped
(
  Product  VARCHAR(100) PRIMARY KEY,
  Quantity INTEGER NOT NULL
);
INSERT INTO Grouped (Product, Quantity) VALUES
('Pencil', 3), ('Eraser', 4), ('Notebook', 2);


WITH Numbers AS (
  SELECT 1 AS n
  UNION ALL
  SELECT n + 1 FROM Numbers WHERE n < 100
),
Expanded AS (
  SELECT g.Product, 1 AS Quantity
  FROM Grouped g
  JOIN Numbers n ON n.n <= g.Quantity
)
SELECT * FROM Expanded
ORDER BY Product
OPTION (MAXRECURSION 100);
