SELECT 
	s.[Name] AS Site,
	l.[Name],
	s.Establishment,
	c.[Name] AS Category
FROM Sites AS s
JOIN Locations AS l ON s.LocationID = l.Id
JOIN Categories AS c ON s.CategoryID = c.Id
ORDER BY c.[Name] DESC, l.[Name], s.[Name];