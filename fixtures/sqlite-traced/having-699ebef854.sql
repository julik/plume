explain 
      SELECT count(*) FROM t1,t2 WHERE a=c AND b=d COLLATE nocase 
      GROUP BY b, d
