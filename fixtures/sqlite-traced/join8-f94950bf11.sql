SELECT (SELECT c FROM sqlite_temp_schema FULL JOIN t2 ON d IN (1,2,3) ORDER BY d) AS x FROM t1;
