CREATE FUNCTION udf_GetVolunteersCountFromADepartment (@VolunteersDepartment VARCHAR(30))
RETURNS INT
AS
BEGIN
	DECLARE @VolunteersCount INT
	SELECT @VolunteersCount = COUNT(*) 
	FROM Volunteers AS v
	JOIN VolunteersDepartments AS d
	ON v.DepartmentId = d.ID
	WHERE d.DepartmentName = @VolunteersDepartment
	RETURN @VolunteersCount
END

SELECT dbo.udf_GetVolunteersCountFromADepartment ('Education program assistant')