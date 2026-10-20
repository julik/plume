CREATE VIEW test AS
    SELECT *, 'x'
      FROM t1 LEFT JOIN (SELECT * FROM t2, t3) ON (c=b AND x=9)
      WHERE c IS NULL;
