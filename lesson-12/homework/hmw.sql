
----Combine Two Tables (LEFT JOIN)
Select firstName, lastName, city,state from Person as Per
left join Address as Ad
on Per.personId=Ad.personId


----Employees Earning More Than Their Managers
Select Emp.name as Employee from Employee as Emp
join Employee as Man
on Emp.managerId=Man.id
where Emp.salary>Man.salary

----Duplicate Emails

SELECT email AS Email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;

----Delete Duplicate Emails (Keep lowest ID)

delete from Person
where id not in 
(Select min(id) from Person
group by email
)


----5. Find those parents who has only girls.

Select distinct G.ParentName from girls as G
left join boys as B
on G.Id=B.Id
where G.ParentName <>B.ParentName

----6. Total over 50 and least????????????????

SELECT customerId,
SUM(salesAmount) AS totalSalesOver50,
MIN(weight) AS leastWeight
FROM Sales.Orders
WHERE weight > 50
GROUP BY customerId;

----7. Carts

Select * from Cart1 as C1
full join Cart2 as C2
on C1.Item=C2.Item
order by C2.Item, C1.Item desc

----8

Select name from Customers as C
left join Orders as O
on C.id=O.customerId
where customerId is null

----9


Select St.student_id, Student_name, Ex.subject_name, count(Ex.subject_name) as SN from Students St
left join Examinations Ex
on St.student_id=Ex.student_id
left join Subjects Su
on Ex.subject_name=Su.subject_name
group by St.student_id, Student_name, Ex.subject_name
order by SN desc
