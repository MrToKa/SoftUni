CREATE TABLE [Users](
	[Id] BIGINT PRIMARY KEY IDENTITY (1,1),
	[Username] VARCHAR(30) UNIQUE NOT NULL,
	[Password] VARCHAR(26) NOT NULL,
	[Picture] VARBINARY(MAX),
	CHECK (DATALENGTH([Picture]) <= 900000),	
	[LastLoginTime] TIME,
	[IsDeleted] BIT
)

INSERT INTO [Users] ([Username], [Password], [Picture], [LastLoginTime], [IsDeleted])
VALUES
('user1', 'password1', NULL, '12:30:00', 0),
('user2', 'password2', NULL, '09:45:00', 0),
('user3', 'password3', NULL, '18:20:00', 1),
('user4', 'password4', NULL, '15:10:00', 0),
('user5', 'password5', NULL, '21:00:00', 0);