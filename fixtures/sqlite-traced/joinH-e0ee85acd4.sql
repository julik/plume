SELECT a1.a, sum( a1.a+a1.b ) FROM t3 AS a1 RIGHT JOIN t4 ON a=x
   GROUP BY a1.a ORDER BY 1;
