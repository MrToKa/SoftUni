SELECT 
SUM([Difference]) AS [SumDifference]
FROM(
SELECT 
	FirstName AS [Host Wizard],
	DepositAmount AS [Host Wizard Deposit],
	LEAD(FirstName, 1) OVER (ORDER BY Id) AS [Guest Wizard],
	LEAD(DepositAmount, 1) OVER (ORDER BY Id) AS [Guest Wizard Deposit],
	[Difference] = DepositAmount - LEAD(DepositAmount, 1) OVER (ORDER BY Id)	
FROM WizzardDeposits
) AS [Data]