-- This Query uses Champions_Data at https://github.com/CodyFornof/SQL-Queries/blob/main/champions_data.csv

SELECT DISTINCT year, team
FROM "codyfornof/championsData"."championsdata"
ORDER BY year;
