SELECT * FROM t1 NATURAL JOIN t1 
   WHERE a==1
      OR (
           (SELECT avg(
                (SELECT sum((SELECT 1 FROM t1 NATURAL RIGHT JOIN t1 WHERE a=a)))) AS xyz
           )
           AND a==2
         );
