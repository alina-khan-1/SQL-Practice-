
create database Question_set 
--Step 1) Create Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary) VALUES
(1, 'John', 'Doe', 'HR', 55000.00),
(2, 'Jane', 'Smith', 'IT', 75000.00),
(3, 'Emily', 'Jones', 'Finance', 65000.00),
(4, 'Michael', 'Brown', 'IT', 80000.00),
(5, 'Sarah', 'Davis', 'HR', 60000.00),
(6, 'David', 'Wilson', 'Finance', 70000.00),
(7, 'Laura', 'Garcia', 'IT', 72000.00),
(8, 'Robert', 'Miller', 'HR', 58000.00),
(9, 'Sophia', 'Martinez', 'Finance', 67000.00),
(10, 'James', 'Anderson', 'IT', 81000.00);




--1) How do you select all columns from the Employees table?
select * from Employees

--2) How do you select only the FirstName and Last Name columns from the Employees table?
select firstname,lastname from Employees


--3) How do you find all employees who work in the 'IT' department?
select * from Employees where Department = 'it'

--or
select * from Employees where Department like 'IT'

--4) How do you select employees with a salary greater than 70,000?

SELECT * FROM Employees WHERE Salary > 70000


--5) How do you sort the results by Last Name in ascending order?

SELECT * FROM Employees ORDER BY LastName ASC
---- OR
SELECT * FROM Employees ORDER BY LastName

--6) How do you select distinct departments from the Employees table?

SELECT DISTINCT DEPARTMENT FROM Employees

--7) How do you count the number of employees in each department?

SELECT Department,COUNT(*) [Number of Employes] FROM Employees GROUP BY Department
--or
select department, COUNT(EmployeeID) from Employees group by Department

--8) How do you find the maximum salary in the Employees table?

select max(salary)[maximum salary] from Employees

--9) How do you find the average salary of employees in the 'Finance' department?

select avg(salary) from Employees where Department like 'Finance'

--10) How do you select employees whose last name starts with 'M'?

select * from Employees where LastName like 'm%'





select * from Employees

--11. How do you select employees who work in the 'IT' department and have a salary greater than 75,000?

SELECT * FROM Employees WHERE Department IN ('IT') AND SALARY>75000

SELECT * FROM Employees WHERE DEPARTMENT = 'IT' AND SALARY >75000

--12. How do you find employees who work in the 'HR' department or have a salary less than 60,000?
SELECT * FROM Employees WHERE Department IN ('HR')  OR Salary<6000

--13. How do you select employees who do not work in the 'Finance' department?
SELECT * FROM Employees WHERE Department NOT LIKE 'FINANCE'
--or
SELECT * FROM Employees WHERE Department NOT IN ('FINANCE')
SELECT * FROM Employees WHERE NOT Department = 'FINANCE'

--14. How do you find employees whose salary is between 60,000 and 70,000 and who work in the 'Finance' department?

SELECT * FROM Employees WHERE Salary BETWEEN 60000 AND 70000 AND Department = 'FINANCE'
SELECT * FROM Employees WHERE Salary BETWEEN 60000 AND 70000 AND Department IN ('FINANCE')

--15. How do you find employees who work in the 'IT' department and do not have a salary greater than 80,000?

SELECT * FROM Employees WHERE Department='IT' AND SALARY <=80000
--or
SELECT * FROM Employees WHERE Department IN ('IT') AND NOT Salary>80000

--16. How do you find employees who work in the 'HR' or 'Finance' departments and have a salary greater than 65,000?

SELECT * FROM Employees WHERE (Department IN ('HR') OR DEPARTMENT IN ('FINANCE') ) AND Salary>=65000

--17. How do you select employees whose last name starts with 'D' and do not work in the 'HR' department?

SELECT * FROM Employees WHERE LastName LIKE 'D%' AND Department NOT IN ('HR')

--18. How do you find employees who do not work in the 'IT' department and have a salary greater than 70,000?

SELECT * FROM Employees WHERE Department NOT IN ('IT') AND Salary>70000
--19. How do you select employees who work in the 'IT' department and either have a salary greater 
--than 75,000 or have the first name 'Laura'?

SELECT * FROM Employees WHERE (Salary>75000 OR FirstName='LAURA') AND Department = 'IT'

--20. How do you find employees who do not work in the 'HR' or 'IT' departments?

SELECT * FROM Employees WHERE Department NOT IN ('HR','IT')