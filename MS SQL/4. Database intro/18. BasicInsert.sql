CREATE DATABASE [SoftUni]
USE [SoftUni]
GO

CREATE TABLE [Towns](
	[Id] INT PRIMARY KEY IDENTITY(1,1),
	[Name] NVARCHAR(50) NOT NULL,
);

CREATE TABLE [Addresses](
	[Id] INT PRIMARY KEY IDENTITY(1,1),
	[AddressText] NVARCHAR(100) NOT NULL,
	[TownId] INT FOREIGN KEY REFERENCES Towns(Id),
);

CREATE TABLE [Departments](
	[Id] INT PRIMARY KEY IDENTITY(1,1),
	[Name] NVARCHAR(50) NOT NULL,
);

CREATE TABLE [Employees](
	[Id] INT PRIMARY KEY IDENTITY(1,1),
	[FirstName] NVARCHAR(50) NOT NULL,
	[MiddleName] NVARCHAR(50),
	[LastName] NVARCHAR(50) NOT NULL,
	[JobTitle] NVARCHAR(50) NOT NULL,
	[DepartmentId] INT FOREIGN KEY REFERENCES Departments(Id),
	[HireDate] DATETIME NOT NULL,
	[Salary] DECIMAL(10,2) NOT NULL,
	[AddressId] INT FOREIGN KEY REFERENCES Addresses(Id),
);

-- Inserting sample data into the [Towns] table
INSERT INTO [Towns] ([Name]) 
VALUES 
('Sofia'),
('Plovdiv'),
('Varna'),
('Burgas')

-- Inserting sample data into the [Addresses] table
INSERT INTO [Addresses] ([AddressText], [TownId])
VALUES
('Sofia, 15-17 Tintyava Str.', 1),
('Plovdiv, 23-25 Hristo Botev Blvd.', 2),
('Varna, 33-35 Slivnitsa Blvd.', 3),
('Burgas, 45-47 Aleksandrovska Str.', 4)

-- Inserting sample data into the [Departments] table
INSERT INTO [Departments] ([Name])
VALUES
('Engineering'),
('Sales'),
('Marketing'),
('Software Development'),
('Quality Assurance')

-- Inserting sample data into the [Employees] table
INSERT INTO [Employees] ([FirstName], [MiddleName], [LastName], [JobTitle], [DepartmentId], [HireDate], [Salary], [AddressId])
VALUES
('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '2013-02-01', 3500.00, 1),
('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '2004-03-02', 4000.00, 3),
('Maria', 'Petrova', 'Ivanova', 'Intern', 5, '2016-08-26', 525.25, 2),
('Georgi', 'Teziev', 'Ivanov', 'CEO', 2, '2007-12-09', 3000.00, 4),
('Peter', 'Pan', 'Pan', 'Intern', 3, '2016-08-26', 599.88, 1)