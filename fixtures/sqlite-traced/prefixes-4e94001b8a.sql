WITH finder(str) AS (
      SELECT (SELECT max(k) FROM t1 WHERE k<=$INPUT)
        UNION ALL
        SELECT (
          SELECT max(k) FROM t1 
          WHERE k<=substr($INPUT, 1, prefix_length(finder.str, $INPUT))
        ) FROM finder WHERE length(finder.str)>0
      )
    SELECT str FROM finder WHERE length(str)==prefix_length(str, $INPUT) LIMIT 1
