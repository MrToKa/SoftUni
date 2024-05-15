CREATE OR ALTER PROC usp_GetHoldersWithBalanceHigherThan (@balance DECIMAL(18, 2))
AS
BEGIN
SELECT FirstName,LastName
FROM AccountHolders AS ah
JOIN Accounts AS a ON ah.Id = a.AccountHolderId
GROUP BY FirstName,LastName
HAVING SUM (a.Balance) > @balance
ORDER BY FirstName,LastName
END

usp_GetHoldersWithBalanceHigherThan 50000