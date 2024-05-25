UPDATE Volunteers
SET DepartmentId = 1
WHERE DepartmentId = (SELECT Id FROM VolunteersDepartments WHERE DepartmentName = 'Education program assistant');

DELETE FROM VolunteersDepartments
WHERE DepartmentName = 'Education program assistant';