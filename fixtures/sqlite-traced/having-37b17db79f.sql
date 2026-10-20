explain SELECT a, sum(b) FROM t1 GROUP BY a||b HAVING substr(a||b, 1, 1)='a'
