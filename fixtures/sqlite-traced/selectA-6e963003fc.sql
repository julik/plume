WITH RECURSIVE
    xyz(n) AS (
      SELECT upper((SELECT x FROM (
        SELECT x,y,z FROM t2
        INTERSECT SELECT a,b,c FROM t3
        EXCEPT SELECT c,b,a FROM t1
        UNION SELECT a,b,c FROM t3
        INTERSECT SELECT a,b,c FROM t3
        EXCEPT SELECT c,b,a FROM t1
        UNION SELECT a,b,c FROM t3
        ORDER BY y COLLATE NOCASE DESC,x,z)))
      UNION ALL
      SELECT n || '+' FROM xyz WHERE length(n)<5
    )
  SELECT n FROM xyz ORDER BY +n;
