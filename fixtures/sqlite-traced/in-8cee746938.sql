SELECT a.*
    FROM t5 AS 'a' JOIN t5 AS 'b' ON b.id=a.id
   WHERE b.id IN (
          SELECT t6.t5_id
            FROM t6
           WHERE name='Bob'
             AND t6.t5_id IS NOT NULL
             AND t6.id IN (
                  SELECT id
                    FROM (SELECT t6.id, count(*) AS x
                            FROM t6
                           WHERE name='Bob'
                         ) AS 't'
                   WHERE x=1
                 )
             AND t6.id IN (1,id)
         );
