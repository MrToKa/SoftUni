CREATE PROCEDURE usp_SearchByCategory
    @category NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        bg.Name,
        bg.YearPublished,
        bg.Rating,
        c.Name AS CategoryName,
        p.Name AS PublisherName,
        CONCAT(pr.PlayersMin, ' people') AS MinPlayers,
        CONCAT(pr.PlayersMax, ' people') AS MaxPlayers
    FROM 
        Boardgames AS bg
    JOIN 
        Categories AS c ON bg.CategoryId = c.Id
    JOIN 
        Publishers AS p ON bg.PublisherId = p.Id
    JOIN 
        PlayersRanges AS pr ON bg.PlayersRangeId = pr.Id
    WHERE 
        c.Name = @category
    ORDER BY 
        p.Name ASC,
        bg.YearPublished DESC;
END;
