SELECT * FROM (
      SELECT x, sum(y) AS s, max(z) AS m,
        max( max(z) ) OVER (PARTITION BY sum(y) 
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        )
      FROM t2 GROUP BY x
    )
