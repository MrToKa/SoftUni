SELECT 
	DepositGroup
FROM(
	SELECT 
		DepositGroup,
		RANK() OVER (ORDER BY AVG(MagicWandSize)) AS [Rank]
	FROM WizzardDeposits
	GROUP BY DepositGroup
) AS [RankTable]
WHERE [Rank] = 1