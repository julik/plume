SELECT min( sum(a) ) OVER () FROM t1 GROUP BY a;
