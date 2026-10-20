SELECT b, group_concat(a ORDER BY max(d)) FROM t1 GROUP BY b;
