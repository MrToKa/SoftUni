ALTER TABLE [Users] 
DROP CONSTRAINT PK_Id_Usernames
GO

ALTER TABLE [Users] 
ADD CONSTRAINT PK_Users PRIMARY KEY ([Id])
GO

ALTER TABLE [Users] 
ADD CONSTRAINT UQ_Username UNIQUE ([Name])
GO

ALTER TABLE [Users] 
WITH NOCHECK ADD CONSTRAINT CK_UsernameLength CHECK (LEN([Name]) >= 3)
GO

ALTER TABLE [Users] 
CHECK CONSTRAINT CK_UsernameLength;
GO