SELECT *
    FROM (SELECT avg(w) FROM t2),
         (SELECT sum(x) FROM t1 WHERE x=z AND ((SELECT * FROM t3) IN t4) = x);
