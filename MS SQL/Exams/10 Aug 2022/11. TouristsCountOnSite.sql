CREATE FUNCTION udf_GetTouristsCountOnATouristSite (@Site VARCHAR(100))
RETURNS INT
AS
BEGIN
	DECLARE @Count INT
	SELECT 
	@Count = COUNT(t.Id)
	FROM Sites AS s
	JOIN SitesTourists AS st
	ON s.Id = st.SiteID
	JOIN Tourists AS t
	ON st.TouristID = t.Id
	GROUP BY s.[Name]
	HAVING s.[Name] = @Site
	RETURN @Count
END

SELECT dbo.udf_GetTouristsCountOnATouristSite ('Regional History Museum – Vratsa')