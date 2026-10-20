SELECT a, b, c, d,  group_concat(b,'.') OVER w1 AS 'elements',  median() WITHIN GROUP (ORDER BY d) OVER w1 AS 'median'  FROM t1  WINDOW w1 AS (ORDER BY c, a ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING)
