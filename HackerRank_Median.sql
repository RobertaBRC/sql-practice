/****** Hacker Rank Practice  
Weather observations: querying the median of the Northern Latitudes (LAT_N) from STATION ******/

SELECT CAST(
(
 (SELECT MAX(LAT_N) FROM
   (SELECT TOP 50 PERCENT LAT_N FROM Station ORDER BY LAT_N) AS lower_half)
 +
 (SELECT MIN(LAT_N) FROM
   (SELECT TOP 50 PERCENT LAT_N FROM Station ORDER BY LAT_N DESC) AS top_half)
) / 2 AS DECIMAL(10,4)) AS Median;