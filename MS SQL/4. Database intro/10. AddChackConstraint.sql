-- Add check constraint to the [Users] table to ensure that the password is at least 5 characters long.
ALTER TABLE [Users]
ADD CONSTRAINT CheckPasswordLength 
CHECK (LEN([Password]) >= 5)