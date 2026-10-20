SELECT sum(following) OVER w FROM t1 WINDOW w AS (ORDER BY over)
