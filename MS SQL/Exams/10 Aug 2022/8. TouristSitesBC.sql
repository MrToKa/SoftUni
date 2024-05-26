SELECT
	s.[Name] AS [Site],
	l.[Name] AS [Location],
	l.Municipality AS Municipality,
	l.Province AS Province,
	s.Establishment AS Establishment
FROM Locations AS l
JOIN Sites AS s
ON l.Id = s.LocationId
WHERE s.Establishment LIKE '%BC%' 
AND (l.[Name] NOT LIKE 'B%' AND l.[Name] NOT LIKE 'M%' AND l.[Name] NOT LIKE 'D%')
ORDER BY s.[Name]