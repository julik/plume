explain query plan 
  SELECT (SELECT EXISTS ( SELECT x FROM tx1 ) WHERE 1) FROM tx2
