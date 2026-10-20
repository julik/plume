-- bypass improved sqlite_master consistency checking
  DELETE FROM t3 WHERE x IN (SELECT x FROM t4);
