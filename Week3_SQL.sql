-- Week 3 Assignment: SQL & Excel for Data Analytics
-- Student: Gajanan Harinarayan Raje
-- Database: SQLite (sqliteonline.com)

-- ===== SETUP =====
CREATE TABLE Departments (DeptID INT PRIMARY KEY, DeptName TEXT);
INSERT INTO Departments VALUES (1,'IT'),(2,'HR'),(3,'Sales'),(4,'Finance');

CREATE TABLE Employees (EmpID INT PRIMARY KEY, Name TEXT, DeptID INT, Salary INT);
INSERT INTO Employees VALUES
(1,'Amit',1,50000),(2,'Neha',1,60000),(3,'Ravi',2,40000),
(4,'Sneha',3,55000),(5,'Om',NULL,35000);

-- ===== TASK 1: SELECT =====
SELECT * FROM Employees;
SELECT Name, Salary FROM Employees;
SELECT Name AS Employee_Name, Salary AS Monthly_Salary FROM Employees;

-- ===== TASK 2: WHERE, ORDER BY, AGGREGATES =====
SELECT * FROM Employees WHERE Salary > 45000;
SELECT Name, Salary FROM Employees WHERE DeptID = 1;
SELECT * FROM Employees ORDER BY Salary DESC;
SELECT COUNT(*) AS Total_Employees FROM Employees;
SELECT SUM(Salary) AS Total_Salary FROM Employees;
SELECT AVG(Salary) AS Average_Salary FROM Employees;
SELECT MIN(Salary) AS Lowest_Salary, MAX(Salary) AS Highest_Salary FROM Employees;

-- ===== TASK 3: GROUP BY & HAVING =====
SELECT DeptID, COUNT(*) AS Total_Employees, SUM(Salary) AS Total_Salary, AVG(Salary) AS Avg_Salary
FROM Employees
GROUP BY DeptID;

SELECT DeptID, COUNT(*) AS Total_Employees, AVG(Salary) AS Avg_Salary
FROM Employees
GROUP BY DeptID
HAVING AVG(Salary) > 45000;

-- ===== TASK 4: JOINS =====
SELECT e.EmpID, e.Name, d.DeptName, e.Salary
FROM Employees e
INNER JOIN Departments d ON e.DeptID = d.DeptID;

SELECT e.EmpID, e.Name, d.DeptName, e.Salary
FROM Employees e
LEFT JOIN Departments d ON e.DeptID = d.DeptID;

SELECT e.EmpID, e.Name, d.DeptName, e.Salary
FROM Employees e
RIGHT JOIN Departments d ON e.DeptID = d.DeptID;

-- ===== TASK 5: SUBQUERIES =====
SELECT Name, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

SELECT Name, Salary
FROM Employees
WHERE DeptID IN (SELECT DeptID FROM Departments WHERE DeptName = 'IT');
