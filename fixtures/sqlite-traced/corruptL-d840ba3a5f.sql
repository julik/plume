-- bypass improved sqlite_master consistency checking
  SELECT * FROM t1 WHERE a<='2019-05-09' ORDER BY a DESC;
