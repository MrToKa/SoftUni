--CREATE DATABASE Boardgames
--GO

--USE Boardgames
--GO

-- Create Categories table
CREATE TABLE Categories (
    Id INT PRIMARY KEY IDENTITY(1, 1),
    Name NVARCHAR(50) NOT NULL
);

-- Create Addresses table
CREATE TABLE Addresses (
    Id INT PRIMARY KEY IDENTITY(1, 1),
    StreetName NVARCHAR(100) NOT NULL,
    StreetNumber INT NOT NULL,
    Town NVARCHAR(30) NOT NULL,
    Country NVARCHAR(50) NOT NULL,
    ZIP INT NOT NULL
);

-- Create Publishers table
CREATE TABLE Publishers (
    Id INT PRIMARY KEY IDENTITY(1, 1),
    Name NVARCHAR(30) UNIQUE NOT NULL,
    AddressId INT NOT NULL,
    Website NVARCHAR(40),
    Phone NVARCHAR(20),
    FOREIGN KEY (AddressId) REFERENCES Addresses(Id)
);

-- Create PlayersRanges table
CREATE TABLE PlayersRanges (
    Id INT PRIMARY KEY IDENTITY(1, 1),
    PlayersMin INT NOT NULL,
    PlayersMax INT NOT NULL
);

-- Create Boardgames table
CREATE TABLE Boardgames (
    Id INT PRIMARY KEY IDENTITY(1, 1),
    Name NVARCHAR(30) NOT NULL,
    YearPublished INT NOT NULL,
    Rating DECIMAL(5, 2) NOT NULL,
    CategoryId INT NOT NULL,
    PublisherId INT NOT NULL,
    PlayersRangeId INT NOT NULL,
    FOREIGN KEY (CategoryId) REFERENCES Categories(Id),
    FOREIGN KEY (PublisherId) REFERENCES Publishers(Id),
    FOREIGN KEY (PlayersRangeId) REFERENCES PlayersRanges(Id)
);

-- Create Creators table
CREATE TABLE Creators (
    Id INT PRIMARY KEY IDENTITY(1, 1),
    FirstName NVARCHAR(30) NOT NULL,
    LastName NVARCHAR(30) NOT NULL,
    Email NVARCHAR(30) NOT NULL
);

-- Create CreatorsBoardgames table
CREATE TABLE CreatorsBoardgames (
    CreatorId INT NOT NULL,
    BoardgameId INT NOT NULL,
    PRIMARY KEY (CreatorId, BoardgameId),
    FOREIGN KEY (CreatorId) REFERENCES Creators(Id),
    FOREIGN KEY (BoardgameId) REFERENCES Boardgames(Id)
);
