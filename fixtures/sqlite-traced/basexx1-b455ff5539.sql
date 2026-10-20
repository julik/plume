INSERT INTO bs SELECT randomblob(4000 + n%3), n 
   FROM ( 
     WITH RECURSIVE seq(n) AS (
      VALUES(1) UNION ALL SELECT n+1
      FROM seq WHERE n<100
     ) SELECT n FROM seq);
