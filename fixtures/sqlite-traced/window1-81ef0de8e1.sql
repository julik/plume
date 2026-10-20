SELECT * FROM t1 WHERE b >= (SELECT b FROM t1 ORDER BY lead(b) OVER () AND sum(a));
