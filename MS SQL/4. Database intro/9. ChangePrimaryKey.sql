-- Remove the old primary key.
ALTER TABLE [Users]
DROP CONSTRAINT PK__Users__3214EC07A58AB000

-- Add the new primary key.
ALTER TABLE [Users]
ADD CONSTRAINT PK_Id_Usernames
PRIMARY KEY ([Id], [Name])