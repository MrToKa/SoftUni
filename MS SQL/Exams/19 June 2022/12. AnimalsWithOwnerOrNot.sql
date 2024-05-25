CREATE PROCEDURE usp_AnimalsWithOwnersOrNot(@AnimalName VARCHAR(30))
AS
BEGIN
	SELECT 
	a.[Name] AS [Name],	
	CASE
		WHEN a.OwnerID IS NULL THEN 'For adoption'
		ELSE o.[Name]
	END AS OwnersName
	FROM Animals a
	LEFT JOIN Owners o
	ON a.OwnerID = o.ID
	WHERE a.[Name] = @AnimalName
END

EXEC usp_AnimalsWithOwnersOrNot 'Pumpkinseed Sunfish'
EXEC usp_AnimalsWithOwnersOrNot 'Hippo'