SELECT 
	CONCAT(o.[Name], '-', a.[Name]) AS [OwnersAnimals],
	o.PhoneNumber,
	c.Id AS CageId
FROM Owners AS o
JOIN Animals AS a ON o.ID = a.OwnerID
JOIN AnimalsCages AS ac ON a.ID = ac.AnimalID
JOIN Cages AS c ON ac.CageID = c.ID
JOIN AnimalTypes AS [at] ON a.AnimalTypeId = [at].ID
WHERE [at].AnimalType = 'Mammals'
ORDER BY o.[Name], a.[Name] DESC;