CREATE TABLE [Categories](
	[Id] INT PRIMARY KEY IDENTITY (1,1),
	[CategoryName] NVARCHAR(50) NOT NULL,
	[DailyRate] DECIMAL (6,2) NOT NULL,
	[WeeklyRate] DECIMAL (6,2) NOT NULL,
	[MonthlyRate] DECIMAL (6,2) NOT NULL,
	[WeekendRate] DECIMAL (6,2) NOT NULL,
);

CREATE TABLE [Cars](
	[Id] INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	[PlateNumber] NVARCHAR(10) NOT NULL,
	[Manufacturer] NVARCHAR(50) NOT NULL,
	[Model] NVARCHAR(50) NOT NULL,
	[CarYear] DATE NOT NULL,
	[CategoryId] INT FOREIGN KEY REFERENCES [Categories]([Id]),
	[Doors] TINYINT NOT NULL,
	[Picture] IMAGE,
	[Condition] NVARCHAR(50) NOT NULL,
	[Available] BIT NOT NULL,
);

CREATE TABLE [Employees](
	[Id] INT PRIMARY KEY IDENTITY (1,1),
	[FirstName] NVARCHAR(50) NOT NULL,
	[LastName] NVARCHAR(50) NOT NULL,
	[Title] NVARCHAR(50) NOT NULL,
	[Notes] NVARCHAR(MAX)
);

CREATE TABLE [Customers](
	[Id] INT PRIMARY KEY IDENTITY (1,1),
	[DriverLicenseNumber] NVARCHAR(20) NOT NULL,
	[FullName] NVARCHAR(100) NOT NULL,
	[Address] NVARCHAR(100) NOT NULL,
	[City] NVARCHAR(50) NOT NULL,
	[ZIPCode] NVARCHAR(50) NOT NULL,
	[Notes] NVARCHAR(MAX)
);

CREATE TABLE [RentalOrders](
	[Id] INT PRIMARY KEY IDENTITY (1,1),
	[EmployeeId] INT FOREIGN KEY REFERENCES [Employees]([Id]),
	[CustomerId] INT FOREIGN KEY REFERENCES [Customers]([Id]),
	[CarId] INT FOREIGN KEY REFERENCES [Cars]([Id]),
	[TankLevel] DECIMAL (3,1) NOT NULL,
	[KilometrageStart] INT NOT NULL,
	[KilometrageEnd] INT NOT NULL,
	[TotalKilometrage] INT NOT NULL,
	[StartDate] DATE NOT NULL,
	[EndDate] DATE NOT NULL,
	[TotalDays] INT NOT NULL,
	[RateApplied] DECIMAL (5,2) NOT NULL,
	[TaxRate] DECIMAL (3,2) NOT NULL,
	[OrderStatus] NVARCHAR(50) NOT NULL,
	[Notes] NVARCHAR(MAX)
);

-- Inserting sample data into the [Categories] table
INSERT INTO [Categories] ([CategoryName], [DailyRate], [WeeklyRate], [MonthlyRate], [WeekendRate]) 
VALUES
('Economy', 35.00, 200.00, 500.00, 50.00),
('Compact', 40.00, 230.00, 600.00, 55.00),
('Midsize', 45.00, 250.00, 700.00, 60.00)

-- Inserting sample data into the [Cars] table
INSERT INTO [Cars] ([PlateNumber], [Manufacturer], [Model], [CarYear], [CategoryId], [Doors], [Condition], [Available]) VALUES
('ABC123', 'Toyota', 'Corolla', '2019-01-01', 1, 4, 'Excellent', 1),
('DEF456', 'Honda', 'Civic', '2018-01-01', 2, 4, 'Good', 1),
('GHI789', 'Ford', 'Focus', '2017-01-01', 3, 4, 'Fair', 1)

-- Inserting sample data into the [Employees] table
INSERT INTO [Employees] ([FirstName], [LastName], [Title], [Notes]) 
VALUES
('John', 'Doe', 'Manager', 'Responsible for overseeing daily operations and managing staff.'),
('Jane', 'Smith', 'Sales Associate', 'Assists customers with rental inquiries and vehicle selection.'),
('Alice', 'Johnson', 'Customer Service Representative', 'Handles customer inquiries, reservations, and complaints.')

-- Inserting sample data into the [Customers] table
INSERT INTO [Customers] ([DriverLicenseNumber], [FullName], [Address], [City], [ZIPCode], [Notes]) 
VALUES
('123456', 'Alice Adams', '123 Main St', 'Anytown', '12345', 'Frequent customer with excellent driving record.'),
('234567', 'Bob Baker', '456 Elm St', 'Smallville', '23456', 'First-time customer looking to rent a vehicle.'),
('345678', 'Charlie Clark', '789 Oak St', 'Metro City', '34567', 'Corporate client in need of long-term rental services.')

-- Inserting sample data into the [RentalOrders] table
INSERT INTO [RentalOrders] ([EmployeeId], [CustomerId], [CarId], [TankLevel], [KilometrageStart], [KilometrageEnd], [TotalKilometrage], [StartDate], [EndDate], [TotalDays], [RateApplied], [TaxRate], [OrderStatus], [Notes]) 
VALUES
(1, 1, 1, 0.75, 10000, 10500, 500, '2020-01-01', '2020-01-05', 5, 200.00, 0.13, 'Completed', 'Customer returned vehicle in good condition.'),
(2, 2, 2, 0.50, 20000, 20500, 500, '2020-02-01', '2020-02-05', 5, 230.00, 0.13, 'Completed', 'Customer extended rental period due to travel delays.'),
(3, 3, 3, 0.25, 30000, 30500, 500, '2020-03-01', '2020-03-05', 5, 250.00, 0.13, 'Completed', 'Corporate client requested additional services for VIP guests.')
