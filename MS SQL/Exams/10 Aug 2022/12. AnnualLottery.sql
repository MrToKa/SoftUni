CREATE PROCEDURE usp_AnnualRewardLottery(@TouristName VARCHAR(50))
AS
BEGIN
	SELECT
		t.[Name],
		CASE
			WHEN COUNT(*) >= 100 THEN 'Gold badge'
			WHEN COUNT(*) >= 50 THEN 'Silver badge'
			WHEN COUNT(*) >= 25 THEN 'Bronze badge'
			ELSE NULL
		END AS Reward
	FROM Tourists AS t
	JOIN SitesTourists AS st
	ON t.Id = st.TouristID
	JOIN Sites AS s
	ON st.SiteID = s.Id
	GROUP BY t.[Name]
	HAVING t.[Name] = @TouristName
END

EXEC usp_AnnualRewardLottery 'Gerhild Lutgard'
EXEC usp_AnnualRewardLottery 'Teodor Petrov'
EXEC usp_AnnualRewardLottery 'Zac Walsh'
EXEC usp_AnnualRewardLottery 'Brus Brown'