CREATE OR ALTER PROCEDURE usp_CalculateFutureValueForAccount (
	@AccountID INT,
	@InterestRate FLOAT
)
AS
BEGIN
	SELECT 
	t.[Account Id],
	t.[First Name],
	t.[Last Name],
	t.[Current Balance],
	dbo.ufn_CalculateFutureValue(t.[Current Balance], @InterestRate, 5) AS [Balance in 5 years]
	FROM(
		SELECT 
			ah.Id AS [Account Id],
			ah.FirstName AS [First Name],
			ah.LastName AS [Last Name],
			a.Balance AS [Current Balance]
		FROM AccountHolders AS ah
		JOIN Accounts AS a
		ON ah.Id = a.AccountHolderId
		WHERE a.Id = @AccountID
		--WHERE a.AccountHolderId = 1
	) AS t
END