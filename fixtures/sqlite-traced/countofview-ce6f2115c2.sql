SELECT count(*) FROM (
     SELECT a, max(b) FROM t1 HAVING a<100 UNION ALL SELECT c, d FROM t2
  )
