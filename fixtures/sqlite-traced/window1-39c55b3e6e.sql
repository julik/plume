SELECT count(*), max(a) OVER () FROM t1 GROUP BY c;
