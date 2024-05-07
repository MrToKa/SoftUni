SELECT TOP 5
	Country,
	HighestPeakElevation,
	LongestRiverLength
FROM(
SELECT 
	c.[CountryName] AS Country,
	p.[Elevation] AS HighestPeakElevation,
	r.[Length] AS LongestRiverLength,
	DENSE_RANK() OVER (PARTITION BY c.CountryName ORDER BY p.Elevation DESC, r.Length DESC) AS Rank
FROM Countries AS c
LEFT JOIN MountainsCountries AS mc
ON c.CountryCode = mc.CountryCode
LEFT JOIN Peaks AS p
ON mc.MountainID = p.MountainID
LEFT JOIN CountriesRivers AS rc
ON c.CountryCode = rc.CountryCode
LEFT JOIN Rivers AS r
ON rc.RiverID = r.ID
) AS [CountryPeakRiver]
WHERE Rank = 1
ORDER BY HighestPeakElevation DESC, LongestRiverLength DESC, Country;

--SELECT TOP (5)
--	c.CountryName,
--	MAX(p.Elevation) AS HighestPeakElevation,
--	MAX(r.[Length]) AS LongestRiverLength
--FROM Countries AS c
--LEFT JOIN CountriesRivers AS cr
--ON c.CountryCode = cr.CountryCode
--LEFT JOIN Rivers AS r
--ON cr.RiverID = r.ID
--LEFT JOIN MountainsCountries AS mc
--ON c.CountryCode = mc.CountryCode
--LEFT JOIN Peaks AS p
--ON mc.MountainID = p.MountainID
--GROUP BY c.CountryName
--ORDER BY HighestPeakElevation DESC, LongestRiverLength DESC, c.CountryName