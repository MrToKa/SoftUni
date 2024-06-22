DELETE lb
FROM LibrariesBooks lb
JOIN Books b ON lb.BookId = b.Id
WHERE b.AuthorId = (SELECT Id FROM Authors WHERE [Name] = 'Alex Michaelides');

DELETE FROM Books
WHERE AuthorId = (SELECT Id FROM Authors WHERE [Name] = 'Alex Michaelides');

DELETE FROM Authors
WHERE Id = (SELECT Id FROM Authors WHERE [Name] = 'Alex Michaelides');
