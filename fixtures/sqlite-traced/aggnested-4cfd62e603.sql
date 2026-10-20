SELECT max(value1), (SELECT sum(value2=max(value1)) FROM t2)
      FROM t1
     GROUP BY id1;
