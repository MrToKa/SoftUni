SELECT 
	t.[Name],
	Age,
	PhoneNumber,
	Nationality,
	--Reward,
	--bp.[Name] AS BonusPrizeName,
	CASE
	WHEN Reward IS NULL AND bp.[Name] IS NULL THEN '(no bonus prize)'
	ELSE bp.[Name]
	END AS Reward
FROM Tourists AS t
LEFT JOIN TouristsBonusPrizes AS tbp
ON t.Id = tbp.TouristID
LEFT JOIN BonusPrizes AS bp
ON tbp.BonusPrizeID = bp.Id
ORDER BY t.[Name] ASC