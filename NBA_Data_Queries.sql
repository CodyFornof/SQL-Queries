-- This Query uses Champions_Data at https://github.com/CodyFornof/SQL-Queries/blob/main/champions_data.csv

SELECT DISTINCT year, team
FROM "codyfornof/championsData"."championsdata"
ORDER BY year;

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
