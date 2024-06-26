SELECT
	SUBSTRING(t.[Name], CHARINDEX(' ', t.[Name]) + 1, LEN(t.[Name])) AS LastName,
	t.Nationality,
	t.Age,
	t.PhoneNumber
FROM Tourists AS t
JOIN SitesTourists AS st
ON t.Id = st.TouristID
JOIN Sites AS s
ON st.SiteID = s.Id
JOIN Categories AS c
ON s.CategoryID = c.Id
WHERE c.[Name] = 'History and archaeology'
ORDER BY LastName ASC;
