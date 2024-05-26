SELECT TOP 5
    bg.Name,
    bg.Rating,
    c.Name AS CategoryName
FROM
    Boardgames AS bg
JOIN
    Categories AS c ON bg.CategoryId = c.Id
JOIN
    PlayersRanges AS pr ON bg.PlayersRangeId = pr.Id
WHERE
    (bg.Rating > 7.00 AND CHARINDEX('a', bg.Name) > 0)
    OR (bg.Rating > 7.50 AND pr.PlayersMin >= 2 AND pr.PlayersMax <= 5)
ORDER BY
    bg.Name ASC,
    bg.Rating DESC;
