SELECT 
	MIN(AverageSalary) AS MinAverageSalary
	FROM(
SELECT 
	AVG(e.Salary) AS AverageSalary
FROM Employees AS e
JOIN Departments AS d
ON e.DepartmentId = d.DepartmentID
GROUP BY d.DepartmentID) AS Subquery;