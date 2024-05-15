CREATE FUNCTION ufn_CalculateFutureValue (
	@Sum DECIMAL(18, 4),
	@InterestRate FLOAT,
	@Years INT
)
RETURNS DECIMAL(18, 4)
AS
BEGIN
	DECLARE @FutureValue DECIMAL(18, 4)
	SET @FutureValue = @Sum * POWER(1 + @InterestRate, @Years)
	RETURN ROUND(@FutureValue , 4)
END