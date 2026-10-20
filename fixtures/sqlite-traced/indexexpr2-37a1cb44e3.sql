SELECT *,
    (SELECT max(c+abs(b)) FROM t2 GROUP BY d ORDER BY d LIMIT 1) AS subq
   FROM t1 WHERE a=5;
