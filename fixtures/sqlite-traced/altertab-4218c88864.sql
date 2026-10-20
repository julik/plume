CREATE TRIGGER r1 AFTER INSERT ON t1 WHEN 'no' NOT NULL BEGIN
    INSERT INTO t2(a,a,b,c) VALUES(new.b,new.a,new.c-7);
    WITH c1(x) AS (
      VALUES(0) 
        UNION ALL 
      SELECT current_time+x FROM c1 WHERE x 
        UNION ALL 
      SELECT 1+x FROM c1 WHERE x<1
    ), c2(x) AS (VALUES(0),(1))
    SELECT * FROM c1 AS x1, c2 AS x2, (
      SELECT x+1 FROM c1 WHERE x IS NOT TRUE 
        UNION ALL 
      SELECT 1+x FROM c1 WHERE 1<x
    ) AS x3, c2 x5;
  END;
