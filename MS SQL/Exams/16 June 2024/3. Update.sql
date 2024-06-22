UPDATE Contacts
SET Website = 'www.' + REPLACE(LOWER(a.[Name]), ' ', '') + '.com'
FROM Contacts c
JOIN Authors a ON c.Id = a.ContactId
WHERE c.Website IS NULL;
