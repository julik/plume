SELECT value, t1.* FROM json_each('17') NATURAL RIGHT JOIN t1
   WHERE (a,b) IN (SELECT rowid, b FROM t1);
