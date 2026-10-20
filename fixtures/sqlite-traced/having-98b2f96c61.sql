explain 
      SELECT count(*) FROM t1,t2 WHERE a=c GROUP BY b, d 
      HAVING b=d COLLATE nocase
