SELECT 
	DepositGroup,
	SUM(DepositAmount) AS TotalDeposits
FROM WizzardDeposits
WHERE MagicWandCreator = 'Ollivander family'
GROUP BY DepositGroup
HAVING SUM(DepositAmount) < 150000
ORDER BY TotalDeposits DESC;