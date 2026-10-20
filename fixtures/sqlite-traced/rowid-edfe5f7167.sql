SELECT 1, NULL INTERSECT SELECT * FROM (
      SELECT t2.c0, t1.c1 FROM t1, t2
      WHERE ((t2.rowid <= 'a')) OR (t1.c0 <= t2.c0) ORDER BY 'a' DESC LIMIT 100
  );
