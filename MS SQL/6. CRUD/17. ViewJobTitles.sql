CREATE VIEW [V_EmployeeNameJobTitle]
AS
(
	SELECT CONCAT([FirstName], ' ', [MiddleName], ' ', [LastName]) 
	AS [FullName], [JobTitle]
	FROM [Employees]
)