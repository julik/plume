SELECT t1.y 
    FROM ( SELECT 'AAA' ) 
    INNER JOIN (
      SELECT 1 AS abc FROM (
        SELECT 1 FROM t2 LEFT JOIN empty1
      )
    ) AS sub0 ON sub0.abc
    , t1
    RIGHT JOIN (SELECT 'BBB' FROM ( SELECT 'CCC' ))
