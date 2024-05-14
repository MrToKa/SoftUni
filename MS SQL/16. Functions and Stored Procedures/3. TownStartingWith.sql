CREATE PROC usp_GetTownsStartingWith (@Town VARCHAR(50))
AS
BEGIN
	SELECT
		[Name]
	FROM Towns
	WHERE [Name] LIKE @Town + '%'
END

EXEC usp_GetTownsStartingWith 'B'