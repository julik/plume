SELECT value, t1.* FROM json_each('7') NATURAL RIGHT JOIN t1
   WHERE (a,b) IN (SELECT a, b FROM t1);
