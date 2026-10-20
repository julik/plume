WITH s AS MATERIALIZED (SELECT if(1,b) AS x FROM t1)
    SELECT x, typeof(x) FROM s;
