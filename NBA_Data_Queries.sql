-- This Query uses Champions_Data at https://github.com/CodyFornof/SQL-Queries/blob/main/champions_data.csv

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


-- QUERY USES Champions_Data at https://github.com/CodyFornof/SQL-Queries/blob/main/champions_data.csv

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
