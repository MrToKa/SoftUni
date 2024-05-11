SELECT TOP (10)
	FirstName,
	LastName,
	DepartmentID	
FROM Employees AS e
WHERE e.Salary > 
	(SELECT
		AVG(e2.Salary)
	FROM Employees AS e2
	WHERE e.DepartmentID = e2.DepartmentID)
ORDER BY e.DepartmentID;