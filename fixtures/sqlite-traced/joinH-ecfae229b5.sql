SELECT sum( a1.a+a1.b ) FROM t3 AS a1 RIGHT JOIN t3 ON true
   GROUP BY a1.a ORDER BY 1;
