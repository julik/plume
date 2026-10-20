explain SELECT a, sum(b) FROM t1 WHERE substr(a||b, 1, 1)='a' GROUP BY a||b
