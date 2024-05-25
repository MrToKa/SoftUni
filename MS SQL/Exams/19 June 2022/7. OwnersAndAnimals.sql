SELECT TOP(5) 
	o.[Name], 
	COUNT(a.ID) AS CountOfAnimals
FROM Owners AS o
LEFT JOIN Animals AS a ON o.ID = a.OwnerID
GROUP BY o.Id, o.[Name]
ORDER BY CountOfAnimals DESC, o.[Name] ASC;