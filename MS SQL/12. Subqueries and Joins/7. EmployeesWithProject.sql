SELECT TOP (5) 
	e.EmployeeID,
	e.FirstName,
	p.[Name] AS ProjectName
FROM Employees AS e
JOIN EmployeesProjects AS pe
ON e.EmployeeID = pe.EmployeeID
JOIN Projects AS p
ON pe.ProjectID = p.ProjectID
WHERE p.StartDate > = '2002-08-13' AND p.EndDate IS NULL
ORDER BY e.EmployeeID