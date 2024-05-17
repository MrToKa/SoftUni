CREATE FUNCTION ufn_IsWordComprised(@setOfLetters VARCHAR(50), @word VARCHAR(50))
RETURNS BIT
AS
BEGIN
	DECLARE @i INT = 1
	DECLARE @letter CHAR(1)
	DECLARE @isComprised BIT = 1

	WHILE @i <= LEN(@word)
	BEGIN
		SET @letter = SUBSTRING(@word, @i, 1)
		IF CHARINDEX(@letter, @setOfLetters) = 0
		BEGIN
			SET @isComprised = 0
			BREAK
		END
		SET @i = @i + 1
	END
	RETURN @isComprised
END