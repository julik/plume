SELECT b, b=count(*), group_concat(b) OVER () FROM t1 GROUP BY b;
