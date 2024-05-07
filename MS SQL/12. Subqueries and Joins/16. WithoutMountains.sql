SELECT COUNT(*) AS [Count]
FROM(
SELECT DISTINCT c.CountryCode
	FROM Countries AS c
	LEFT JOIN MountainsCountries AS mc ON c.CountryCode = mc.CountryCode
	LEFT JOIN Mountains AS m ON mc.MountainID = m.ID
	WHERE m.ID IS NULL
) AS Subquery;