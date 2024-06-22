SELECT 
    a.[Name] AS Author,
    b.Title AS Title,
    l.[Name] AS [Library],
    c.PostAddress AS [Library Address]
FROM 
    Books AS b
    JOIN Authors AS a ON b.AuthorId = a.Id
    JOIN Genres AS g ON b.GenreId = g.Id
    JOIN LibrariesBooks AS lb ON b.Id = lb.BookId
    JOIN Libraries AS l ON lb.LibraryId = l.Id
    JOIN Contacts AS c ON l.ContactId = c.Id
WHERE c.PostAddress LIKE '%Denver%' AND g.[Name] = 'Fiction'
ORDER BY b.Title ASC;
