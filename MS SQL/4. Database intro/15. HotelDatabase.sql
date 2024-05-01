CREATE DATABASE Hotel
USE Hotel
GO

CREATE TABLE [Employees](
	[Id] INT PRIMARY KEY IDENTITY(1,1),
	[FirstName] NVARCHAR(50) NOT NULL,
	[LastName] NVARCHAR(50) NOT NULL,
	[Title] NVARCHAR(50) NOT NULL,
	[Notes] NVARCHAR(MAX) 
);

CREATE TABLE [Customers](
	[AccountNumber] INT PRIMARY KEY IDENTITY(1,1),
	[FirstName] NVARCHAR(50) NOT NULL,
	[LastName] NVARCHAR(50) NOT NULL,
	[PhoneNumber] NVARCHAR(50) NOT NULL,
	[EmergencyName] NVARCHAR(50),
	[EmergencyNumber] NVARCHAR(50),
	[Notes] NVARCHAR(MAX)
);

CREATE TABLE [RoomStatus](
	[RoomStatus] NVARCHAR(50) PRIMARY KEY,
	[Notes] NVARCHAR(MAX)
);

CREATE TABLE [RoomTypes](
	[RoomType] NVARCHAR(50) PRIMARY KEY,
	[Notes] NVARCHAR(MAX)
);

CREATE TABLE [BedTypes](
	[BedType] NVARCHAR(50) PRIMARY KEY,
	[Notes] NVARCHAR(MAX)
);

CREATE TABLE [Rooms](
	[RoomNumber] INT PRIMARY KEY IDENTITY(1,1),
	[RoomType] NVARCHAR(50) FOREIGN KEY REFERENCES RoomTypes(RoomType),
	[BedType] NVARCHAR(50) FOREIGN KEY REFERENCES BedTypes(BedType),
	[Rate] DECIMAL(8,2),
	[RoomStatus] NVARCHAR(50) FOREIGN KEY REFERENCES RoomStatus(RoomStatus),
	[Notes] NVARCHAR(MAX)
);

CREATE TABLE [Payments](
	[Id] INT PRIMARY KEY IDENTITY(1,1),
	[EmployeeId] INT FOREIGN KEY REFERENCES Employees(Id),
	[PaymentDate] DATETIME,
	[AccountNumber] INT FOREIGN KEY REFERENCES Customers(AccountNumber),
	[FirstDateOccupied] DATETIME,
	[LastDateOccupied] DATETIME,
	[TotalDays] INT,
	[AmountCharged] DECIMAL(8,2),
	[TaxRate] DECIMAL(8,2),
	[TaxAmount] DECIMAL(8,2),
	[PaymentTotal] DECIMAL(10,2),
	[Notes] NVARCHAR(MAX)
);

CREATE TABLE [Occupancies](
	[Id] INT PRIMARY KEY IDENTITY(1,1),
	[EmployeeId] INT FOREIGN KEY REFERENCES Employees(Id),
	[DateOccupied] DATETIME,
	[AccountNumber] INT FOREIGN KEY REFERENCES Customers(AccountNumber),
	[RoomNumber] INT FOREIGN KEY REFERENCES Rooms(RoomNumber),
	[RateApplied] DECIMAL(8,2),
	[PhoneCharge] DECIMAL(8,2),
	[Notes] NVARCHAR(MAX)
);

-- Inserting sample data into the [Employees] table
INSERT INTO [Employees] ([FirstName], [LastName], [Title], [Notes])
VALUES
('John', 'Doe', 'Manager', 'Manager of the hotel'),
('Jane', 'Doe', 'Receptionist', 'Front desk receptionist'),
('Alice', 'Smith', 'Housekeeper', 'Housekeeping staff');

-- Inserting sample data into the [Customers] table
INSERT INTO [Customers] ([FirstName], [LastName], [PhoneNumber], [EmergencyName], [EmergencyNumber], [Notes])
VALUES
('John', 'Doe', '123-456-7890', 'Jane Doe', '098-765-4321', 'Regular customer'),
('Alice', 'Smith', '234-567-8901', 'Bob Smith', '987-654-3210', 'VIP customer'),
('Bob', 'Johnson', '345-678-9012', 'Alice Johnson', '876-543-2109', 'Regular customer');

-- Inserting sample data into the [RoomStatus] table
INSERT INTO [RoomStatus] ([RoomStatus], [Notes])
VALUES
('Available', 'Room is available for occupancy'),
('Occupied', 'Room is currently occupied'),
('Maintenance', 'Room is under maintenance');

-- Inserting sample data into the [RoomTypes] table
INSERT INTO [RoomTypes] ([RoomType], [Notes])
VALUES
('Single', 'Room with a single bed'),
('Double', 'Room with two beds'),
('Suite', 'Luxury suite with multiple rooms');

-- Inserting sample data into the [BedTypes] table
INSERT INTO [BedTypes] ([BedType], [Notes])
VALUES
('Single', 'Room with a single bed'),
('Double', 'Room with two beds'),
('King', 'Room with a king-sized bed');

-- Inserting sample data into the [Rooms] table
INSERT INTO [Rooms] ([RoomType], [BedType], [Rate], [RoomStatus], [Notes])
VALUES
('Single', 'Single', 100.00, 'Available', 'Room 101'),
('Double', 'Double', 150.00, 'Available', 'Room 201'),
('Suite', 'King', 250.00, 'Available', 'Room 301');

-- Inserting sample data into the [Payments] table
INSERT INTO [Payments] ([EmployeeId], [PaymentDate], [AccountNumber], [FirstDateOccupied], [LastDateOccupied], [TotalDays], [AmountCharged], [TaxRate], [TaxAmount], [PaymentTotal], [Notes])
VALUES
(1, '2020-01-01', 1, '2020-01-01', '2020-01-03', 2, 200.00, 0.08, 16.00, 216.00, 'Payment for room 101'),
(2, '2020-01-02', 2, '2020-01-02', '2020-01-04', 2, 300.00, 0.08, 24.00, 324.00, 'Payment for room 201'),
(3, '2020-01-03', 3, '2020-01-03', '2020-01-05', 2, 500.00, 0.08, 40.00, 540.00, 'Payment for room 301');

-- Inserting sample data into the [Occupancies] table
INSERT INTO [Occupancies] ([EmployeeId], [DateOccupied], [AccountNumber], [RoomNumber], [RateApplied], [PhoneCharge], [Notes])
VALUES
(1, '2020-01-01', 1, 1, 100.00, 10.00, 'Occupancy for room 101'),
(2, '2020-01-02', 2, 2, 150.00, 15.00, 'Occupancy for room 201'),
(3, '2020-01-03', 3, 3, 250.00, 25.00, 'Occupancy for room 301');
