-- Step 1: Identify AddressId's to be deleted
SELECT Id
INTO #AddressesToDelete
FROM Addresses
WHERE Town LIKE 'L%';

-- Step 2: Remove or update dependent records in related tables

-- Delete related records in the CreatorsBoardgames table based on the deleted Boardgames
DELETE FROM CreatorsBoardgames
WHERE BoardgameId IN (
    SELECT Id FROM Boardgames
    WHERE PublisherId IN (
        SELECT Id FROM Publishers
        WHERE AddressId IN (SELECT Id FROM #AddressesToDelete)
    )
);

-- Delete related records in the Boardgames table
DELETE FROM Boardgames
WHERE PublisherId IN (
    SELECT Id FROM Publishers
    WHERE AddressId IN (SELECT Id FROM #AddressesToDelete)
);

-- Delete related records in the Publishers table
DELETE FROM Publishers
WHERE AddressId IN (SELECT Id FROM #AddressesToDelete);

-- Step 3: Delete the identified rows from Addresses
DELETE FROM Addresses
WHERE Id IN (SELECT Id FROM #AddressesToDelete);

-- Clean up temporary table
DROP TABLE #AddressesToDelete;