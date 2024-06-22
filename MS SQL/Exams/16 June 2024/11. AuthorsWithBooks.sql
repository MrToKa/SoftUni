CREATE FUNCTION udf_AuthorsWithBooks(@name NVARCHAR(100))
RETURNS INT
AS
BEGIN
    DECLARE @totalBooks INT;

    SELECT @totalBooks = COUNT(*)
    FROM Books AS b
    JOIN Authors AS a ON b.AuthorId = a.Id
    JOIN LibrariesBooks AS lb ON b.Id = lb.BookId
    WHERE a.[Name] = @name;

    RETURN @totalBooks;
END;

--GO

--SELECT dbo.udf_AuthorsWithBooks('J.K. Rowling')