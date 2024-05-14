CREATE FUNCTION ufn_GetSalaryLevel(@salary DECIMAL(18,4))
RETURNS NVARCHAR(7)
AS
BEGIN
	DECLARE @salaryLevel NVARCHAR(7)
	IF @salary < 30000
		SET @salaryLevel = 'Low'
	ELSE IF @salary <= 50000
		SET @salaryLevel = 'Average'
	ELSE
		SET @salaryLevel = 'High'
	RETURN @salaryLevel
END

GO 

SELECT 
	Salary,
	dbo.ufn_GetSalaryLevel(Salary) AS SalaryLevel
	FROM Employees