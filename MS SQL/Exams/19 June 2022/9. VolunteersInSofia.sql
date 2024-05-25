SELECT 
	v.[Name], 
	v.PhoneNumber, 
	SUBSTRING(TRIM(v.[Address]), CHARINDEX(',', TRIM(v.[Address])) + 1, LEN(TRIM(v.[Address]))) AS [Address] 
FROM Volunteers AS v
JOIN VolunteersDepartments AS vd
ON v.DepartmentId = vd.Id
WHERE vd.DepartmentName = 'Education program assistant'
AND SUBSTRING(TRIM(v.[Address]), 1, CHARINDEX(',', TRIM(v.[Address])) - 1) LIKE 'Sofia'
ORDER BY v.[Name];
