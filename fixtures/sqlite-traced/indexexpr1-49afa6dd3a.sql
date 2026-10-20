explain query plan
  SELECT a,
       SUM(1)                              AS t1,
       SUM(CASE WHEN b->>'x'=1 THEN 1 END) AS t2,
       SUM(c)                              AS t3,
       SUM(CASE WHEN b->>'x'=1 THEN c END) AS t4
    FROM t1;
