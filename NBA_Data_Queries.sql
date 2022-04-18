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

