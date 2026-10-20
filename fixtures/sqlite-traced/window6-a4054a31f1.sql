SELECT group_concat(window, '.') OVER (ORDER BY y) FROM t1
