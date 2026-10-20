WITH v(x) AS (SELECT 'abcdefghijklmnopqrstuvwxyz')
    INSERT INTO t2 SELECT x,x,x,x,x FROM v;
