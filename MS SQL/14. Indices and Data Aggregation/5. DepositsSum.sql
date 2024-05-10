SELECT 
	DepositGroup,
	SUM(DepositAmount) AS TotalDeposits
FROM WizzardDeposits
GROUP BY DepositGroup