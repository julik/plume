SELECT sum(alias.x) OVER w FROM t1 alias WINDOW w AS (ORDER BY y)
