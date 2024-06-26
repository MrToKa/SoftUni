CREATE OR ALTER FUNCTION ufn_CashInUsersGames (@gameName NVARCHAR(50))
RETURNS TABLE
AS
RETURN
(
	SELECT SUM(Cash) AS [SumCash]
	FROM(
		SELECT 
			g.[Name],
			ug.Cash,
			ROW_NUMBER() OVER (ORDER BY ug.Cash DESC) AS [RowNumber]
		FROM UsersGames AS ug
		INNER JOIN Games AS g
		ON g.Id = ug.GameId
		WHERE g.[Name] = @gameName
	) AS CashInUsersGames
	WHERE [RowNumber] % 2 <> 0
)

SELECT * FROM dbo.ufn_CashInUsersGames('Love in a mist')