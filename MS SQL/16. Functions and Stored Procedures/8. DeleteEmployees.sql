CREATE PROCEDURE usp_DeleteEmployeesFromDepartment (@departmentId INT)
AS
BEGIN
	DECLARE @employeesToDelete TABLE(Id INT)
		INSERT INTO @employeesToDelete
		SELECT EmployeeId
		FROM Employees
		WHERE DepartmentId = @departmentId

	DELETE FROM EmployeesProjects
	WHERE EmployeeId IN (SELECT * FROM @employeesToDelete)

	ALTER TABLE Departments
	ALTER COLUMN ManagerId INT

	UPDATE Departments
	SET ManagerId = NULL
	WHERE ManagerId IN (SELECT * FROM @employeesToDelete)

	UPDATE Employees
	SET ManagerID = NULL
	WHERE ManagerId IN (SELECT * FROM @employeesToDelete)

	DELETE FROM Employees
	WHERE DepartmentID = @departmentId

	DELETE FROM Departments
	WHERE DepartmentId = @departmentId
END

SELECT COUNT(*) AS [Employees Count] FROM Employees AS e
JOIN Departments AS d
ON d.DepartmentID = e.DepartmentID
WHERE e.DepartmentID = @departmentId