SELECT * 
INTO avgSalary
FROM Employees
WHERE Salary > 30000

DELETE FROM avgSalary
WHERE ManagerID = 42

UPDATE avgSalary
SET Salary = Salary + 5000
WHERE DepartmentID = 1

SELECT 
	DepartmentID,
	AVG(Salary) AS AverageSalary
FROM avgSalary
GROUP BY DepartmentID