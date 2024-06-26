--CREATE DATABASE Zoo
--GO
--USE Zoo
--GO


CREATE TABLE Owners
(
	Id INT PRIMARY KEY IDENTITY(1,1),
	[Name] VARCHAR(50) NOT NULL,
	PhoneNumber VARCHAR(15) NOT NULL,
	[Address] VARCHAR(50) NULL
)

CREATE TABLE AnimalTypes
(
	Id INT PRIMARY KEY IDENTITY(1,1),
	AnimalType VARCHAR(30) NOT NULL
)

CREATE TABLE Cages
(
	Id INT PRIMARY KEY IDENTITY(1,1),
	AnimalTypeId INT NOT NULL,
	FOREIGN KEY (AnimalTypeId) REFERENCES AnimalTypes(Id)
)

CREATE TABLE Animals
(
	Id INT PRIMARY KEY IDENTITY(1,1),
	[Name] VARCHAR(30) NOT NULL,
	BirthDate DATE NOT NULL,
	OwnerId INT NULL,
	FOREIGN KEY (OwnerId) REFERENCES Owners(Id),
	AnimalTypeId INT NOT NULL,
	FOREIGN KEY (AnimalTypeId) REFERENCES AnimalTypes(Id)
)

CREATE TABLE AnimalsCages
(
	CageId INT NOT NULL,
	FOREIGN KEY (CageId) REFERENCES Cages(Id),
	AnimalId INT NOT NULL,
	FOREIGN KEY (AnimalId) REFERENCES Animals(Id),
	PRIMARY KEY (CageId, AnimalId)
)

CREATE TABLE VolunteersDepartments
(
	Id INT PRIMARY KEY IDENTITY(1,1),
	DepartmentName VARCHAR(30) NOT NULL
)

CREATE TABLE Volunteers
(
	Id INT PRIMARY KEY IDENTITY(1,1),
	[Name] VARCHAR(50) NOT NULL,
	PhoneNumber VARCHAR(15) NOT NULL,
	[Address] VARCHAR(50) NULL,
	AnimalId INT NULL,
	FOREIGN KEY (AnimalId) REFERENCES Animals(Id),
	DepartmentId INT NOT NULL,
	FOREIGN KEY (DepartmentId) REFERENCES VolunteersDepartments(Id)
)