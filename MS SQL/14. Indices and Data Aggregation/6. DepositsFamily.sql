SELECT 
	DepositGroup,
	SUM(DepositAmount) AS TotalDeposits
FROM WizzardDeposits
WHERE MagicWandCreator = 'Ollivander family'
GROUP BY DepositGroup