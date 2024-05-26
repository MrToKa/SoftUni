-- Update PlayersRanges to increase the maximum players by 1 for ranges [2, 2]
UPDATE PlayersRanges
SET PlayersMax = PlayersMax + 1
WHERE PlayersMin = 2 AND PlayersMax = 2;

-- Update Boardgames to append 'V2' to the names of boardgames issued after 2020 inclusive
UPDATE Boardgames
SET Name = Name + 'V2'
WHERE YearPublished >= 2020;
