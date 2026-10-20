SELECT * FROM (
      SELECT x, sum(y) AS s, max(z) AS m 
      FROM t2 GROUP BY x
    )
