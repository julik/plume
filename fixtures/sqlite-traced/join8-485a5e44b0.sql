SELECT * FROM t4 LEFT JOIN t5 ON x=y LEFT JOIN t6 ON (x=z)
   WHERE t5.y!='x' AND t4.x!='x';
