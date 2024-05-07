SELECT TOP (3) 
    e.EmployeeID,
    e.FirstName
From Employees AS e
LEFT JOIN EmployeesProjects AS ep
ON e.EmployeeID = ep.EmployeeID
WHERE ep.EmployeeID IS NULL