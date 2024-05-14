CREATE PROC usp_GetEmployeesFromTown (@Town VARCHAR(50))
AS
BEGIN
	SELECT
		FirstName,
		LastName
	FROM Employees as e
	JOIN Addresses as a
	ON e.AddressID = a.AddressID
	JOIN Towns as t
	ON a.TownID = t.TownID
	WHERE [Name] = @Town
END

EXEC usp_GetEmployeesFromTown 'Sofia'