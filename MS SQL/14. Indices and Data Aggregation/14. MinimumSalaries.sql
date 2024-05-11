SELECT
	DepartmentID,
	MIN(Salary) AS MinSalary
FROM Employees
WHERE HireDate > '2000-01-01' AND DepartmentID IN (2, 5, 7)
GROUP BY DepartmentID

