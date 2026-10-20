SELECT c, (SELECT c + sum(1) OVER ()) AS "res"
    FROM t2 LEFT JOIN (SELECT +a AS c FROM t1) AS v1 ON true
   GROUP BY c
   ORDER by c;
