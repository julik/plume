SELECT * FROM t2 JOIN (SELECT b FROM t2 LEFT JOIN t1
                       ON c IN (SELECT x FROM t3)) AS t99 ON b IS NULL;
