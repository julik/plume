SELECT * FROM t8 WHERE (a, b) IN (
      SELECT count(t8.b), count(*) FROM t7 AS ra0 ORDER BY count(*)
  ) AND t8.b=0;
