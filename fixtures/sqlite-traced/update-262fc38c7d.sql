UPDATE t1 SET x=x+100, y=x<=(SELECT min(x) FROM t1)
   WHERE x<3 OR (1 BETWEEN 0 AND x<=(SELECT min(x)+2 FROM t1));
