CREATE PROCEDURE usp_SearchByGenre
    @genreName NVARCHAR(30)
AS
BEGIN
    SELECT 
        b.Title AS Title,
        b.YearPublished AS Year,
        b.ISBN AS ISBN,
        a.[Name] AS Author,
        g.[Name] AS Genre
    FROM 
        Books AS b
    JOIN Authors AS a ON b.AuthorId = a.Id
    JOIN Genres AS g ON b.GenreId = g.Id
    WHERE g.[Name] = @genreName
    ORDER BY b.Title ASC;
END;

--GO
--EXEC usp_SearchByGenre 'Fantasy'