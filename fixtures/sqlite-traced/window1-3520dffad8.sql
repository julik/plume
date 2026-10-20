SELECT x, (
    SELECT sum(b)
      OVER (PARTITION BY a ROWS BETWEEN UNBOUNDED PRECEDING
                                    AND UNBOUNDED FOLLOWING)
    FROM t2 WHERE b<x
  ) FROM t1;
