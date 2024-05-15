CREATE PROC usp_GetHoldersFullName
AS
BEGIN
	SELECT FirstName + ' ' + LastName AS [Full Name]
	FROM dbo.AccountHolders
END

EXEC usp_GetHoldersFullName