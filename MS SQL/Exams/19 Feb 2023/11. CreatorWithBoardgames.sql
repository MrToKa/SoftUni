CREATE FUNCTION udf_CreatorWithBoardgames
(
    @name NVARCHAR(50)
)
RETURNS INT
AS
BEGIN
    DECLARE @creatorId INT;

    -- Get the ID of the creator based on the provided first name
    SELECT @creatorId = Id
    FROM Creators
    WHERE FirstName = @name;

    -- Return the total number of boardgames created by the creator
    RETURN (
        SELECT COUNT(*)
        FROM CreatorsBoardgames
        WHERE CreatorId = @creatorId
    );
END;
