SELECT 
    c.CountryCode,
    m.MountainRange,
    p.PeakName,
    p.Elevation
FROM Countries AS c
JOIN MountainsCountries AS mc
ON c.CountryCode = mc.CountryCode
JOIN Mountains AS m
ON mc.MountainID = m.ID
JOIN Peaks AS p
ON m.ID = p.MountainID
WHERE c.CountryCode = 'BG' AND p.Elevation > 2835
ORDER BY p.Elevation DESC;