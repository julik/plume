SELECT * FROM t1 WHERE z IN (SELECT 10207 UNION SELECT 10006)
                         AND y IN (SELECT 10000 UNION SELECT 10201)
                         AND x>0 AND x<10
        ORDER BY w
