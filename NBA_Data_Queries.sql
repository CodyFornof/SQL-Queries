-- This Query uses NBA_Championship_Teams.csv at https://github.com/CodyFornof/SQL-Queries/blob/main/NBA_Datasets/NBA_Championship_Teams.csv

SELECT DISTINCT year, team
FROM "codyfornof/championsData"."championsdata"
ORDER BY year;

-- This Query uses all_seasons.csv at https://github.com/CodyFornof/SQL-Queries/blob/main/all_seasons.csv

SELECT DISTINCT player_name AS Name,
draft_year,
draft_round,
CAST(draft_number As INT) AS drafted_overall
	FROM NBA_data.dbo.all_seasons
		WHERE draft_year = '2016'
		ORDER BY CAST(draft_number As INT);


-- This Query uses NBA_Championship_Teams.csv at https://github.com/CodyFornof/SQL-Queries/blob/main/NBA_Datasets/NBA_Championship_Teams.csv

SELECT players.player,
players>born,
players.birth_city,
stats.year,
stats.age,
stats.tm,
stats.g,
stats.ast,
FROM "cfornof/SQL_Data"."players" AS players
  RIGHT JOIN "cfornof/SQL_Data"."seasons_stats" AS stats
    ON stats.players = players.player
  WHERE birth_city = 'Los Angeles'
    OR birth_city = 'New York';
    
-- QUERY USES NBA_Championship_Teams.csv at https://github.com/CodyFornof/SQL-Queries/blob/main/NBA_Datasets/NBA_Championship_Teams.csv
--QUERY USES PlayersStatistics.csv AT https://github.com/CodyFornof/SQL-Queries/blob/main/NBA_Datasets/PlayersStatistics.csv

SELECT DISTINCT champions.Year,
champions.team,
players.player,
players.pos,
players.age
FROM NBA_Data.dbo.PlayersStatistics AS players
	RIGHT JOIN NBA_Data.dbo.NBA_Championship_Teams AS champions
		ON champions.team = players.tm AND champions.Year = players.Year;
		
--QUERY USES PlayersStatistics.csv AT https://github.com/CodyFornof/SQL-Queries/blob/main/NBA_Datasets/PlayersStatistics.csv

SELECT pos,
player,
year,
tm,
age,
pts,
g
FROM NBA_Data.dbo.PlayersStatistics AS players
WHERE players.tm != 'TOT'
ORDER BY CAST(pts As INT) DESC;


--QUERY USES PlayersStatistics.csv AT https://github.com/CodyFornof/SQL-Queries/blob/main/NBA_Datasets/PlayersStatistics.csv
--QUERY USES abbreviation.csv AT https://github.com/CodyFornof/SQL-Queries/blob/main/Abbreviations.csv

SELECT pos,
player,
year,
tm,
ab.abbreviation,
age,
pts,
g
FROM NBA_Data.dbo.PlayersStatistics AS stat
INNER JOIN NBA_Data.dbo.abbreviation AS ab
	ON stat.tm = ab.team
ORDER BY CAST(pts As INT) DESC;

-- QUERY USES NBA_Championship_Teams.csv at https://github.com/CodyFornof/SQL-Queries/blob/main/NBA_Datasets/NBA_Championship_Teams.csv

SELECT team,
year,
game
FROM "codyfornof/championsData"."championsdata"
WHERE game = 7;

--QUERY USES PlayersStatistics.csv AT https://github.com/CodyFornof/SQL-Queries/blob/main/NBA_Datasets/PlayersStatistics.csv

SELECT Year,
Player,
pos,
age,
tm,
pts,
[3PA]
FROM NBA_Data.dbo.PlayersStatistics
ORDER BY  CAST([3PA] As INT) DESC;


-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


--Finds Championship Team for each year
--Database:  NBA_Championship_Teams.csv at https://github.com/CodyFornof/SQL-Queries/blob/main/NBA_Datasets/NBA_Championship_Teams.csv
SELECT DISTINCT year, team
FROM NBA_Data.dbo.NBA_Championship_Teams
ORDER BY year;

--Finds Players drafted in 2016 from 1st overall to 60th
--Database: all_seasons.csv at https://github.com/CodyFornof/SQL-Queries/blob/main/all_seasons.csv
SELECT DISTINCT player_name AS Name,
draft_year,
draft_round,
CAST(draft_number As INT) AS drafted_overall
	FROM NBA_data.dbo.all_seasons
		WHERE draft_year = '2016'
		ORDER BY CAST(draft_number As INT);

--Finds Players who have the most points scored in a single season
--Database: PlayersStatistics.csv AT https://github.com/CodyFornof/SQL-Queries/blob/main/NBA_Datasets/PlayersStatistics.csv
SELECT pos,
	player,
	year,
	tm,
	age,
	pts,
	g
FROM NBA_Data.dbo.PlayersStatistics AS players
	WHERE players.tm != 'TOT'
		ORDER BY CAST(pts As INT) DESC;

--INNER Join Query: Finds players and their points, rebounds, and assists each year
--Database: all_seasons.csv at https://github.com/CodyFornof/SQL-Queries/blob/main/all_seasons.csv AND PlayersStatistics.csv AT https://github.com/CodyFornof/SQL-Queries/blob/main/NBA_Datasets/PlayersStatistics.csv
SELECT stats1.player_name AS Name,
	stats1.team_abbreviation AS Team,
	stats2.Age,
	stats2.year AS Year,
	stats1.pts,
	stats1.ast,
	stats1.reb
		FROM NBA_Data.dbo.all_seasons AS stats1
		INNER JOIN NBA_Data.dbo.PlayersStatistics AS stats2
			ON stats1.player_name = stats2.Player 
				AND CAST(stats1.age As decimal) =  CAST(ROUND(stats2.Age,0,1) AS INT)
		ORDER BY CAST(stats2.year AS INT) DESC, CAST(stats1.pts AS decimal) DESC;

--LEFT Join Query: Shows Champions each year since 1980, and Joins their abbreviations
--Database: NBA_Championship_Teams.csv at https://github.com/CodyFornof/SQL-Queries/blob/main/NBA_Datasets/NBA_Championship_Teams.csv AND abbreviation.csv AT https://github.com/CodyFornof/SQL-Queries/blob/main/Abbreviations.csv
SELECT DISTINCT Year, champs.Team, ab.Abbreviation
	FROM NBA_Data.dbo.NBA_Championship_Teams AS champs
		LEFT JOIN NBA_Data.dbo.abbreviation AS ab
			ON champs.Team = ab.Team;

--RIGHT Join Query
--Database: NBA_Championship_Teams.csv at https://github.com/CodyFornof/SQL-Queries/blob/main/NBA_Datasets/NBA_Championship_Teams.csv AND PlayersStatistics.csv AT https://github.com/CodyFornof/SQL-Queries/blob/main/NBA_Datasets/PlayersStatistics.csv
SELECT DISTINCT champs.year,
	stat.player, 
	stat.pos, 
	stat.age,
	champs.Team
FROM NBA_Data.dbo.PlayersStatistics AS stat
RIGHT JOIN NBA_Data.dbo.NBA_Championship_Teams AS champs
	ON champs.year = stat.Year AND stat.tm = champs.team
WHERE player IS NOT NULL;

--FULL Join Query
--Database: NBA_Championship_Teams.csv at https://github.com/CodyFornof/SQL-Queries/blob/main/NBA_Datasets/NBA_Championship_Teams.csv AND PlayersStatistics.csv AT https://github.com/CodyFornof/SQL-Queries/blob/main/NBA_Datasets/PlayersStatistics.csv
SELECT stat.year,
stat.tm,
stat.Player,
stat.pos,
stat.age,
champs.team AS Championship_Team
FROM NBA_Data.dbo.PlayersStatistics AS stat
	FULL JOIN NBA_Data.dbo.NBA_Championship_Teams AS champs
		ON stat.year = champs.year AND stat.tm = champs.team
ORDER BY stat.year DESC;

--CROSS Join Query
--Database: NBA_Championship_Teams.csv at https://github.com/CodyFornof/SQL-Queries/blob/main/NBA_Datasets/NBA_Championship_Teams.csv AND PlayersStatistics.csv AT https://github.com/CodyFornof/SQL-Queries/blob/main/NBA_Datasets/PlayersStatistics.csv
SELECT stat.year,
	stat.tm,
	stat.Player,
	stat.pos,
	stat.age,
	champs.team,
	champs.year
FROM NBA_Data.dbo.PlayersStatistics AS stat
	CROSS JOIN NBA_Data.dbo.NBA_Championship_Teams AS champs
WHERE stat.player = 'Nick Young'

--UNION Query
--Database: NBA_Championship_Teams.csv at https://github.com/CodyFornof/SQL-Queries/blob/main/NBA_Datasets/NBA_Championship_Teams.csv AND NBA_Lost_Championship_Teams.csv at https://github.com/CodyFornof/SQL-Queries/blob/main/NBA_Lost_Championship_Teams.csv
SELECT *
	FROM NBA_Data.dbo.NBA_Championship_Teams
UNION
SELECT *
	FROM NBA_Data.dbo.NBA_Lost_Championship_Teams
		ORDER BY year DESC, Game;

--INTERSECT Query
--Database: PlayersStatistics.csv AT https://github.com/CodyFornof/SQL-Queries/blob/main/NBA_Datasets/PlayersStatistics.csv AND all_seasons.csv at https://github.com/CodyFornof/SQL-Queries/blob/main/all_seasons.csv
SELECT DISTINCT Player AS Name
FROM NBA_Data.dbo.PlayersStatistics
	INTERSECT
SELECT DISTINCT player_name AS Name
FROM NBA_Data.dbo.all_seasons;

--EXCEPT Query
--Database: PlayersStatistics.csv AT https://github.com/CodyFornof/SQL-Queries/blob/main/NBA_Datasets/PlayersStatistics.csv AND NBA_Championship_Teams.csv at https://github.com/CodyFornof/SQL-Queries/blob/main/NBA_Datasets/NBA_Championship_Teams.csv
SELECT DISTINCT champs.year,
	stat.player, 
	stat.pos, 
	stat.age,
	champs.Team
FROM NBA_Data.dbo.PlayersStatistics AS stat
RIGHT JOIN NBA_Data.dbo.NBA_Championship_Teams AS champs
	ON champs.year = stat.Year AND stat.tm = champs.team
WHERE player IS NOT NULL
EXCEPT 
SELECT DISTINCT champs.year,
	stat.player, 
	stat.pos, 
	stat.age,
	champs.Team
FROM NBA_Data.dbo.PlayersStatistics AS stat
RIGHT JOIN NBA_Data.dbo.NBA_Championship_Teams AS champs
	ON champs.year = stat.Year AND stat.tm = champs.team
WHERE Team = 'Celtics';

--SELECT Subquery
--Database: 
--Paste Query Here

--FROM Subquery
--Database: 
--Paste Query Here

--WHERE Subquery
--Database: 
--Paste Query Here
