-- Remove the old primary key
ALTER TABLE [Users] 
DROP CONSTRAINT PK_Id_Usernames
GO

-- Add the new primary key
ALTER TABLE [Users] 
ADD CONSTRAINT PK_Users PRIMARY KEY ([Id])
GO

-- Add the unique constraint
ALTER TABLE [Users] 
ADD CONSTRAINT UQ_Username UNIQUE ([Name])
GO

-- Add the check constraint
ALTER TABLE [Users] 
WITH NOCHECK ADD CONSTRAINT CK_UsernameLength CHECK (LEN([Name]) >= 3)
GO

-- Enable the check constraint
ALTER TABLE [Users] 
CHECK CONSTRAINT CK_UsernameLength;
GO