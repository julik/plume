SELECT * FROM t1 one LEFT JOIN t1 two ON (one.x=two.x AND EXISTS (
    SELECT 1 FROM t2 WHERE y=one.x
  ));
