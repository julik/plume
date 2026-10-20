EXPLAIN SELECT * FROM t1
   WHERE b IN (345, (SELECT 1 FROM t1 
                      WHERE b IN (coalesce(1,random()))
                        AND c GLOB 'abc*xyz'))
     AND c BETWEEN 'abc' AND 'xyz';
