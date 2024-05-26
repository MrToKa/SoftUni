SELECT
        c.LastName,
        CEILING(AVG(bg.Rating)) AS AvgRating,
        p.Name AS PublisherName
    FROM Creators AS c
    JOIN CreatorsBoardgames AS cb ON c.Id = cb.CreatorId
    JOIN Boardgames AS bg ON cb.BoardgameId = bg.Id
    JOIN Publishers AS p ON bg.PublisherId = p.Id
    WHERE p.Name = 'Stonemaier Games'
    GROUP BY c.LastName, p.Name
ORDER BY AVG(bg.Rating) DESC;
