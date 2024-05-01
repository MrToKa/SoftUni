CREATE DATABASE [Movies]
USE [Movies]
GO

CREATE TABLE [Directors](
	[Id] INT PRIMARY KEY IDENTITY (1,1),
	[DirectorName] NVARCHAR(50) NOT NULL,
	[Notes] NVARCHAR(MAX)
)

CREATE TABLE [Genres](
	[Id] INT PRIMARY KEY IDENTITY (1,1),
	[GenreName] NVARCHAR(50) NOT NULL,
	[Notes] NVARCHAR(MAX)
)

CREATE TABLE [Categories](
	[Id] INT PRIMARY KEY IDENTITY (1,1),
	[CategoryName] NVARCHAR(50) NOT NULL,
	[Notes] NVARCHAR(MAX)
)
GO

CREATE TABLE [Movies](
	[Id] INT IDENTITY (1,1) NOT NULL,
	[Title] NVARCHAR(100) NOT NULL,
	[DirectorId] INT FOREIGN KEY REFERENCES [Directors]([Id]),
	[CopyrightYear] DATE,
	[Length] TIME NOT NULL,
	[GenreId] INT FOREIGN KEY REFERENCES [Genres]([Id]),
	[CategoryId] INT FOREIGN KEY REFERENCES [Categories]([Id]),
	[Rating] DECIMAL (3,1),
	[Notes] NVARCHAR(MAX)	
)
GO


-- Inserting sample data into the [Directors] table
INSERT INTO [Directors] ([DirectorName], [Notes]) VALUES
('Christopher Nolan', 'Known for movies like Inception and The Dark Knight trilogy.'),
('Quentin Tarantino', 'Famous for films such as Pulp Fiction and Kill Bill.'),
('Steven Spielberg', 'Renowned director of classics like Jurassic Park and Schindler''s List.'),
('Martin Scorsese', 'Acclaimed for works like Goodfellas and The Wolf of Wall Street.'),
('Greta Gerwig', 'Notable for directing Lady Bird and Little Women.')

-- Inserting sample data into the [Genres] table
INSERT INTO [Genres] ([GenreName], [Notes]) VALUES
('Action', 'Typically involves high energy, big-budget productions with a focus on physical stunts and thrilling sequences.'),
('Drama', 'Emphasizes character development and interpersonal relationships, often tackling serious themes and emotional conflicts.'),
('Comedy', 'Intended to entertain and provoke laughter, often through exaggerated situations, witty dialogue, and humorous characters.'),
('Sci-Fi', 'Explores speculative or futuristic concepts, often involving advanced technology, space exploration, or alternative realities.'),
('Fantasy', 'Features magical or supernatural elements, often set in imaginary worlds with mythical creatures and epic quests.')

-- Inserting sample data into the [Categories] table
INSERT INTO [Categories] ([CategoryName], [Notes]) VALUES
('Serial', 'Includes TV series or serials, often consisting of multiple episodes or seasons.'),
('Cartoon', 'Encompasses animated films or TV shows, typically targeting children but enjoyed by audiences of all ages.'),
('Documentary', 'Features non-fictional narratives or informative content, often based on real-life events or subjects.'),
('Reality Show', 'Follows the lives of real people in unscripted situations, often featuring challenges, competitions, or social interactions.'),
('Talk Show', 'Involves interviews, discussions, or commentary on various topics, usually hosted by a single presenter or a group of hosts.');
GO

-- Inserting sample data into the [Movies] table
INSERT INTO [Movies] ([Title], [DirectorId], [CopyrightYear], [Length], [GenreId], [CategoryId], [Rating], [Notes]) VALUES
('Inception', 1, '2010-07-16', '02:28:00', 4, 1, 8.8, 'A mind-bending sci-fi thriller directed by Christopher Nolan.'),
('The Shawshank Redemption', 2, '1994-10-14', '02:22:00', 2, 1, 9.3, 'A powerful drama directed by Frank Darabont, based on Stephen King''s novella.'),
('Pulp Fiction', 3, '1994-10-14', '02:34:00', 3, 1, 8.9, 'A Quentin Tarantino masterpiece known for its nonlinear narrative and memorable characters.'),
('The Lord of the Rings: The Return of the King', 4, '2003-12-17', '03:21:00', 5, 1, 8.9, 'An epic fantasy film directed by Peter Jackson, based on the novel by J.R.R. Tolkien.'),
('Toy Story', 5, '1995-11-22', '01:21:00', 2, 2, 8.3, 'The first feature-length computer-animated film by Pixar, directed by John Lasseter.');

