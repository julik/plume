SELECT group_concat(following, '.') OVER (ORDER BY over) FROM t1
