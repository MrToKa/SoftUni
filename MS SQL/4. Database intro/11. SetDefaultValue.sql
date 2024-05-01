-- Set default value for LastLoginTime column in Users table
ALTER TABLE [Users]
ADD CONSTRAINT DefaultLoginTime
DEFAULT CAST(CONVERT(VARCHAR(8), GETDATE(), 108) AS TIME) FOR [LastLoginTime]