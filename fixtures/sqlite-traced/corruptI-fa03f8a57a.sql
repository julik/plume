WITH s(a, b) AS (
       SELECT 2, 'abcdefghij'
       UNION ALL
       SELECT a+2, b FROM s WHERe a < 40
     )
     INSERT INTO t1 SELECT * FROM s;
