SELECT sum(alias.over) OVER w FROM t1 alias WINDOW w AS (ORDER BY y)
