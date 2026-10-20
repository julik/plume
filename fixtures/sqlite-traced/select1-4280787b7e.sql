SELECT count(a) AS cn FROM tkt2526 GROUP BY a HAVING cn<max(cn)
