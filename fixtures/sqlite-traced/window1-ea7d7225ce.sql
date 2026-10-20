SELECT
     ntile( (SELECT sum(x)) ) OVER(ORDER BY x),
     min(x) OVER(ORDER BY x)
    FROM t1;
