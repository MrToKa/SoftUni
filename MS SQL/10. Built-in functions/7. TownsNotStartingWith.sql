SELECT [TownID], [Name]
FROM Towns
WHERE SUBSTRING([Name], 1, 1) NOT IN ('R','B','D')
ORDER BY [Name]