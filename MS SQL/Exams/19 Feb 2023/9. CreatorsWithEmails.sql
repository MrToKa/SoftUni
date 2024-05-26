WITH CreatorBoardgameRatings AS (
    SELECT
        c.Id AS CreatorId,
        CONCAT(c.FirstName, ' ', c.LastName) AS FullName,
        c.Email,
        bg.Name AS BoardgameName,
        bg.Rating,
        ROW_NUMBER() OVER (PARTITION BY c.Id ORDER BY bg.Rating DESC) AS RowNumber
    FROM
        Creators AS c
    JOIN
        CreatorsBoardgames AS cb ON c.Id = cb.CreatorId
    JOIN
        Boardgames AS bg ON cb.BoardgameId = bg.Id
    WHERE
        c.Email LIKE '%.com'
)
SELECT
    FullName,
    Email,
    Rating
FROM
    CreatorBoardgameRatings
WHERE
    RowNumber = 1
ORDER BY
    FullName ASC;
