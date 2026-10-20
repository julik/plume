WITH
       auth1311(x,y) AS (SELECT a+b, b-a FROM t1)
    SELECT * FROM auth1311 ORDER BY x;
