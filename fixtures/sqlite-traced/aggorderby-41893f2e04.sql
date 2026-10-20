SELECT b, group_concat(a ORDER BY d) FROM t1 GROUP BY b ORDER BY b;
