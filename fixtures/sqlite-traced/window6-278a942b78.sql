SELECT group_concat(over, '.') OVER (ORDER BY y) FROM t1
