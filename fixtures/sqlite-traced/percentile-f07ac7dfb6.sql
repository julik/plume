SELECT a, b, c, d,  group_concat(b,'.') OVER w1 AS 'elements',  percentile_cont(d,0.5) OVER w1 AS 'median'  FROM t1  WINDOW w1 AS (ORDER BY c, a ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING)
