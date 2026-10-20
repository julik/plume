SELECT *
    FROM t3
         INNER JOIN t1 ON t1.x= t3.v AND t1.y IS NULL
         LEFT JOIN t4  ON t4.w = t3.w
         LEFT JOIN t5  ON t5.z = t4.z
         LEFT JOIN t2  ON t2.u = t5.m
         LEFT JOIN t1 xyz ON xyz.y = t2.x;
