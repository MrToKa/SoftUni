SELECT 
	CountryCode,
	COUNT(MountainID)
FROM MountainsCountries AS mc
WHERE CountryCode IN
(
	SELECT 
		CountryCode
	FROM Countries AS c
	WHERE CountryName IN ('Bulgaria', 'Russia', 'United States')
)
GROUP BY CountryCode