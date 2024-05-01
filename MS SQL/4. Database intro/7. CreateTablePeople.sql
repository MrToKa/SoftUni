CREATE TABLE [People](
	[Id] INT PRIMARY KEY IDENTITY (1,1),
	[Name] NVARCHAR(200) NOT NULL,
	[Picture] VARBINARY(MAX),
	CHECK (DATALENGTH([Picture]) <= 2097152),
	[Height] DECIMAL (3,2),
	[Weight] DECIMAL (5,2),
	[Gender] CHAR(1) NOT NULL,
	CHECK ([Gender] = 'm' OR [Gender] = 'f'),
	[Birthdate] DATE NOT NULL,
	[Biography] NVARCHAR(MAX)
)

INSERT INTO [People] ([Name], [Picture], [Height], [Weight], [Gender], [Birthdate], [Biography])
VALUES
('John Doe', NULL, 1.80, 75.5, 'm', '1990-05-15', 'John Doe is a fictional character.'),
('Jane Smith', NULL, 1.65, 60.2, 'f', '1988-10-20', 'Jane Smith is a fictional character.'),
('Michael Johnson', NULL, 1.75, 80.0, 'm', '1975-03-12', 'Michael Johnson is a fictional character.'),
('Emily Davis', NULL, 1.70, 55.8, 'f', '1995-07-28', 'Emily Davis is a fictional character.'),
('David Brown', NULL, 1.85, 90.3, 'm', '1980-12-03', 'David Brown is a fictional character.');