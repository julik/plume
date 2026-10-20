SELECT count(*) FROM (
      SELECT DISTINCT * FROM rt0 FULL JOIN t1 ON rt0.c0=t1.c1
      WHERE ((rt0.c1 OR t1.c4)) IS NOT (+ t1.c2)
  );
