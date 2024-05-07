SELECT TOP (5)
    CountryName AS Country,
    CASE 
		WHEN PeakName IS NULL THEN '(no highest peak)' 
		ELSE PeakName
	END AS [Highest Peak Name],
    CASE
        WHEN Elevation IS NULL THEN 0 
		ELSE Elevation
    END AS [Highest Peak Elevation],
    CASE 
        WHEN MountainRange IS NULL THEN '(no mountain)'
        ELSE MountainRange
    END AS [Mountain]
FROM(
    SELECT 
        c.CountryName, 
        p.PeakName, 
        p.Elevation, 
        m.MountainRange,
        DENSE_RANK() OVER (PARTITION BY c.CountryName ORDER BY p.Elevation DESC) AS PeakRanks
    FROM Countries AS c
        LEFT JOIN MountainsCountries AS mc
        ON c.CountryCode = mc.CountryCode
        LEFT JOIN Mountains AS m
        ON mc.MountainID = m.ID
        LEFT JOIN Peaks AS p
        ON m.ID = p.MountainID
    ) AS subquery
WHERE PeakRanks = 1
ORDER BY Country, [Highest Peak Name]