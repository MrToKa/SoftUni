ALTER TABLE [Users]
ADD CONSTRAINT CheckPasswordLength 
CHECK (LEN([Password]) >= 5)