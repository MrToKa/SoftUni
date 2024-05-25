SELECT 	
	a.[Name] AS Name,
	YEAR(a.BirthDate) AS BirthYear,
	[at].AnimalType
FROM Animals AS a
JOIN AnimalTypes AS [at] ON a.AnimalTypeId = [at].Id
WHERE a.OwnerId IS NULL 
AND BirthDate > '01/01/2018'
AND [at].AnimalType <> 'Birds'
ORDER BY a.[Name]
