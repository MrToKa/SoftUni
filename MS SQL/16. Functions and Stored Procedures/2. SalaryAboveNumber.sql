CREATE OR ALTER PROC usp_GetEmployeesSalaryAboveNumber (@Salary DECIMAL(18,4))
AS
BEGIN
	SELECT
		FirstName,
		LastName
	FROM Employees 
	WHERE Salary >= @Salary
END

EXEC usp_GetEmployeesSalaryAboveNumber 48100