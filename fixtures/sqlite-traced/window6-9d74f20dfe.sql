SELECT group_concat(x, '.') OVER (ORDER BY y) FROM t1
