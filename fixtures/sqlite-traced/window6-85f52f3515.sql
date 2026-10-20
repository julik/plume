SELECT sum(alias.x) OVER w FROM over alias WINDOW w AS (ORDER BY y)
